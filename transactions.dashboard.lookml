- dashboard: transactions
  title: Transactions
  layout: newspaper
  elements:
  - title: Transactions
    name: Transactions
    model: block_braintree
    explore: transaction
    type: single_value
    fields: [transaction.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Created Date: transaction.created_date
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Transactions Over Time
    name: Transactions Over Time
    model: block_braintree
    explore: transaction
    type: looker_column
    fields: [transaction.total_amount, transaction.created_week, transaction.tender_display]
    pivots: [transaction.tender_display]
    filters: {}
    sorts: [transaction.created_week desc, transaction.tender_display]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      custom:
        id: 9ec3777f-87d4-7850-3636-825e98aacc52
        label: Custom
        type: discrete
        colors:
        - "#282828"
        - "#f2f2f2"
        - "#0092E5"
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: transaction.cumulative_total,
            id: transaction.cumulative_total, name: Cumulative Total}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      Apple Pay - transaction.total_amount: "#595b5e"
      Credit Card - transaction.total_amount: "#8a8d94"
      MasterPass card - transaction.total_amount: "#bac0c9"
      Paypal - transaction.total_amount: "#ebf2ff"
      Samsung Pay - transaction.total_amount: "#b0daf9"
      US Bank - transaction.total_amount: "#76c2f2"
      Venmo - transaction.total_amount: "#3baaec"
      Visa Checkout - transaction.total_amount: "#0092e5"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Created Date: transaction.created_date
    row: 0
    col: 6
    width: 18
    height: 9
  - title: Average Amount
    name: Average Amount
    model: block_braintree
    explore: transaction
    type: single_value
    fields: [transaction.average_amount]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Created Date: transaction.created_date
    row: 3
    col: 0
    width: 6
    height: 3
  - title: Registered Customers
    name: Registered Customers
    model: block_braintree
    explore: transaction
    type: single_value
    fields: [registered_customer.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Created Date: transaction.created_date
    row: 6
    col: 0
    width: 6
    height: 3
  - title: Add On Averages and Quantities
    name: Add On Averages and Quantities
    model: block_braintree
    explore: transaction
    type: looker_column
    fields: [transaction_add_on.average_add_on_amount, transaction_add_on.average_add_on_quantity,
      transaction.created_week]
    sorts: [transaction.created_week desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: transaction_add_on.total_add_on_amount,
            id: transaction_add_on.total_add_on_amount, name: Total Add on Amount}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: transaction_add_on.average_add_on_quantity, id: transaction_add_on.average_add_on_quantity,
            name: Average Add on Quantity}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      transaction_add_on.average_add_on_amount: line
    series_colors:
      transaction_add_on.total_add_on_amount: "#55A3B3"
      transaction_add_on.average_add_on_quantity: "#0092E5"
      transaction_add_on.average_add_on_amount: "#3b3b3b"
    series_point_styles:
      transaction_add_on.average_add_on_quantity: auto
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Created Date: transaction.created_date
    row: 16
    col: 13
    width: 11
    height: 10
  - title: Registered Vs Unregistered Customers
    name: Registered Vs Unregistered Customers
    model: block_braintree
    explore: transaction
    type: looker_donut_multiples
    fields: [transaction.created_month, transaction.count, transaction.registered_customer]
    pivots: [transaction.registered_customer]
    fill_fields: [transaction.created_month, transaction.registered_customer]
    sorts: [transaction.created_month desc, transaction.registered_customer]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    color_application:
      collection_id: legacy
      palette_id: black_to_gray
      options:
        steps: 5
    series_colors:
      Yes - transaction.count: "#0092E5"
      No - transaction.count: "#3c3c3c"
    series_labels:
      unregistered_customer.count: Unregistered Customers
      registered_customer.count: Registrered Customers
      No - transaction.count: Unregistered
      Yes - transaction.count: Registered
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: unregistered_customer.count,
            id: unregistered_customer.count, name: Number of Unregistered Customers},
          {axisId: registered_customer.count, id: registered_customer.count, name: Registered
              Customer}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Created Date: transaction.created_date
    row: 9
    col: 0
    width: 16
    height: 7
  - title: Avg Amount by Tender Type
    name: Avg Amount by Tender Type
    model: block_braintree
    explore: transaction
    type: looker_pie
    fields: [transaction.tender_display, transaction.average_amount]
    filters: {}
    sorts: [transaction.tender_display]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: legacy
      custom:
        id: 9ec3777f-87d4-7850-3636-825e98aacc52
        label: Custom
        type: discrete
        colors:
        - "#282828"
        - "#f2f2f2"
        - "#0092E5"
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: transaction.cumulative_total,
            id: transaction.cumulative_total, name: Cumulative Total}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      Apple Pay - transaction.total_amount: "#595b5e"
      Credit Card - transaction.total_amount: "#8a8d94"
      MasterPass card - transaction.total_amount: "#bac0c9"
      Paypal - transaction.total_amount: "#ebf2ff"
      Samsung Pay - transaction.total_amount: "#b0daf9"
      US Bank - transaction.total_amount: "#76c2f2"
      Venmo - transaction.total_amount: "#3baaec"
      Visa Checkout - transaction.total_amount: "#0092e5"
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Created Date: transaction.created_date
    row: 9
    col: 16
    width: 8
    height: 7
  - title: Total Amount By Day of Week and Hour of Day
    name: Total Amount By Day of Week and Hour of Day
    model: block_braintree
    explore: transaction
    type: looker_grid
    fields: [transaction.created_hour_of_day, transaction.created_day_of_week, transaction.total_amount]
    pivots: [transaction.created_day_of_week]
    fill_fields: [transaction.created_day_of_week, transaction.created_hour_of_day]
    sorts: [transaction.created_day_of_week 0, transaction.created_hour_of_day]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      transaction.created_day_of_week: Day of Week
      transaction.created_hour_of_day: Hour of Day
    series_column_widths: {}
    series_cell_visualizations:
      transaction.total_amount:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, custom: {
            id: 44f35d22-a0c3-fde0-d02d-f868cda7297a, label: Custom, type: continuous,
            stops: [{color: "#282828", offset: 0}, {color: "#ebf2ff", offset: 50},
              {color: "#0092E5", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [transaction.total_amount]}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      Created Date: transaction.created_date
    row: 16
    col: 0
    width: 13
    height: 10
  - title: All Transactions
    name: All Transactions
    model: block_braintree
    explore: transaction
    type: looker_grid
    fields: [transaction.id, transaction.status, transaction.type, transaction.created_date,
      transaction.tender_display, transaction.total_amount_formatted, transaction.total_tax,
      transaction.total_service_fee, transaction_add_on.total_add_on_amount]
    sorts: [transaction.created_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      transaction.total_amount_formatted: Total Amount
    series_cell_visualizations:
      transaction.total_amount:
        is_active: true
        palette:
          palette_id: 13fee84c-6386-1f25-8469-8be8381331bf
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#0092e5"
      transaction.total_tax:
        is_active: true
        palette:
          palette_id: 364c3008-51bb-88a9-2483-e6869f341bd4
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#0092e5"
      transaction.total_service_fee:
        is_active: true
        palette:
          palette_id: 8cdf8fa8-e6b5-cc5a-85d4-6fdf22187082
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#0092e5"
      transaction_add_on.total_add_on_amount:
        is_active: true
        palette:
          palette_id: 5994f1d1-00b6-6c6b-d6f2-a11f8a6f82b8
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#0092e5"
      transaction.total_amount_formatted:
        is_active: true
        palette:
          palette_id: 0ae65167-f192-2ca6-1d67-cdcc1f19dde7
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#0092e5"
    defaults_version: 1
    listen:
      Created Date: transaction.created_date
    row: 26
    col: 0
    width: 24
    height: 7
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 3 months
    allow_multiple_values: true
    required: false
    model: block_braintree
    explore: transaction
    listens_to_filters: []
    field: transaction.created_date
