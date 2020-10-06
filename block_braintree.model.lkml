connection: "@{CONNECTION_NAME}"

include: "//@{CORE_PROJECT}/*.explore"
include: "//@{CORE_PROJECT}/*.dashboard"
include: "/views/*"

explore: +subscription {}
explore: +transaction {}
explore: +derived {}
