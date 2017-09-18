local k = import "ksonnet.beta.2/k.libsonnet";
local luft = import "luft.libsonnet";

local deployment = k.extensions.v1beta1.deployment;

local luftApp = luft.new("nginx", "default", deployment);

// Specify the import objects that we need
local container = k.extensions.v1beta1.deployment.mixin.spec.template.spec.containersType;
local containerPort = container.portsType;

local targetPort = 80;
local nginxContainer =
    container.new("nginx", "nginx:1.7.9") +
    container.ports(containerPort.containerPort(targetPort));

k.core.v1.list.new(luftApp.deployment(2, nginxContainer))
