local k = import "ksonnet.beta.2/k.libsonnet";
local meta = k.core.v1.configMap.mixin.metadata;
local service = k.core.v1.service;

{
    new(appName, namespace, deployment): {
        appName: appName,

        vhost(host, service, targetPort)::
            local ingress = k.extensions.v1beta1.ingress.mixin;
            k.extensions.v1beta1.ingress.new() +
            ingress.metadata.name(appName) +
            ingress.metadata.namespace(namespace) +
            ingress.spec.rules(
                [
                    ingress.spec.rulesType.new() +
                    ingress.spec.rulesType.host(host) + ingress.spec.rulesType.mixin.http.paths(
                        [
                            ingress.spec.rulesType.mixin.http.pathsType.new() +
                            ingress.spec.rulesType.mixin.http.pathsType.mixin.backend.serviceName(service) +
                            ingress.spec.rulesType.mixin.http.pathsType.mixin.backend.servicePort(targetPort),
                        ],
                    ),
                ]
            ),

        configMap(name, data)::
            k.core.v1.configMap.new() +
            meta.namespace(namespace) +
            meta.name(name) +
            k.core.v1.configMap.data(data),

        deployment(instances, containers)::
            deployment.new(
                appName,
                instances,
                containers,
                { app: appName }
            ) + deployment.mixin.metadata.namespace(namespace),

        volume(volumes)::
            local deployment_spec = deployment.mixin.spec.template.spec;
            deployment_spec.volumes(
                std.map(
                    function(volume) deployment_spec.volumesType.fromConfigMap(
                        volume.metadata.name,
                        volume.metadata.name,
                        std.map(
                            function(v) { key: v, path: v },
                            std.objectFields(volume.data)
                        ),
                    ),
                    volumes
                )
            ),
        serviceAccount(labels={})::
            local serviceAccount = k.core.v1.serviceAccount;
            serviceAccount.new() +
            serviceAccount.mixin.metadata.name(appName) +
            serviceAccount.mixin.metadata.namespace(namespace) +
            serviceAccount.mixin.metadata.labels(labels),

        service(port, targetPort)::
            service.new(appName, { app: appName }, service.mixin.spec.portsType.new(port, targetPort)) +
            service.mixin.metadata.namespace(namespace),

        deploymentServiceAccountName()::
            deployment.mixin.spec.template.spec.serviceAccountName(appName),

    },

    serviceNodePort()::
        service.mixin.spec.type("NodePort"),

}
