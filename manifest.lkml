constant: CORE_PROJECT {
  value: "braintree_refined_simple"
}

remote_dependency: braintree_refined_simple {
  url: "https://github.com/llooker/refined-braintree-simple"
  ref: "d271f3ff86894dde9e8120dcc18ab961e0bd05bd"
  override_constant: ROW_FILTER {
    value: "5"
  }
}


constant: CONNECTION_NAME {
  value: "brick-layer"
  export: override_optional
}

constant: DATASET_NAME {
  value: "braintree"
  export: override_optional
}
