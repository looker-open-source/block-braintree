- dashboard: at_risk_payments
  title: At Risk Payments
  layout: newspaper
  elements:
  - title: Risk Response Over Time
    name: Risk Response Over Time
    model: block_braintree
    explore: transaction
    type: looker_area
    fields: [transaction.count, transaction.risk_data_decision, transaction.created_month]
    pivots: [transaction.risk_data_decision]
    filters:
      transaction.created_date: ''
    sorts: [transaction.risk_data_decision, transaction.created_month desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      custom:
        id: 19ae2977-4a7f-97b9-952f-b18d65ffa175
        label: Custom
        type: discrete
        colors:
        - "#282828"
        - "#0092E5"
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: Review - transaction.count,
            id: Review - transaction.count, name: Review}, {axisId: Decline - transaction.count,
            id: Decline - transaction.count, name: Decline}, {axisId: Approve - transaction.count,
            id: Approve - transaction.count, name: Approve}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: []
    series_types: {}
    series_colors:
      Approve - transaction.count: "#0092E5"
      Decline - transaction.count: "#282828"
      Review - transaction.count: "#adadad"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Untitled Filter: transaction.created_month
    row: 0
    col: 0
    width: 11
    height: 13
  - title: Unsettled Transactions Using Expired Credit Cards
    name: Unsettled Transactions Using Expired Credit Cards
    model: block_braintree
    explore: transaction
    type: looker_grid
    fields: [credit_card.bin, credit_card.cardholder_name, credit_card.days__until_expiration,
      credit_card.expiration_month, registered_customer.id, registered_customer.phone,
      registered_customer.email]
    filters:
      transaction.denied: 'No'
      transaction.status: "-Authorized,-Settled"
      credit_card.days__until_expiration: NOT NULL
    sorts: [credit_card.days__until_expiration]
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
    series_labels: {}
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential1,
          options: {steps: 5, stepped: false, constraints: {mid: {type: number, value: 30},
              max: {type: number, value: 0}, min: {type: number, value: 60}}, reverse: true}},
        bold: false, italic: false, strikethrough: false, fields: [credit_card.days__until_expiration]}]
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
    hidden_fields: []
    hidden_points_if_no: []
    groupBars: true
    labelSize: 10pt
    showLegend: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    column_order: ["$$$_row_numbers_$$$", credit_card.expiration_month, credit_card.days__until_expiration,
      credit_card.bin, credit_card.cardholder_name]
    listen:
      Untitled Filter: credit_card.expiration_month
    row: 0
    col: 11
    width: 13
    height: 13
  - title: Active Subscriptions With Expired Credit Cards
    name: Active Subscriptions With Expired Credit Cards
    model: block_braintree
    explore: transaction
    type: looker_grid
    fields: [credit_card.bin, credit_card.cardholder_name, subscription.balance, subscription.next_billing_date,
      registered_customer.email, registered_customer.phone]
    filters:
      credit_card.is_expired: 'Yes'
      subscription.status: Active
    sorts: [subscription.next_billing_date]
    limit: 500
    query_timezone: America/Los_Angeles
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
    pinned_columns:
      subscription.next_billing_date: left
    column_order: ["$$$_row_numbers_$$$", subscription.next_billing_date, credit_card.bin,
      subscription.balance, credit_card.cardholder_name]
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      subscription.balance:
        is_active: true
        palette:
          palette_id: af6d02c2-158b-bb9e-3ab3-cd00e7881191
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#F36254"
    series_value_format:
      subscription.balance:
        name: usd_0
        format_string: "$#,##0"
        label: U.S. Dollars (0)
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
      Untitled Filter: subscription.next_billing_date
    row: 13
    col: 0
    width: 12
    height: 15
  - title: Transactions In Need of Review
    name: Transactions In Need of Review
    model: block_braintree
    explore: transaction
    type: looker_grid
    fields: [transaction.updated_date, transaction.tender_display, transaction.total_amount,
      transaction.id, registered_customer.full_name, registered_customer.email, registered_customer.phone,
      registered_customer.company]
    filters:
      transaction.risk_data_decision: Review
    sorts: [transaction.id desc]
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
    column_order: ["$$$_row_numbers_$$$", transaction.updated_date, transaction.id,
      transaction.total_amount, transaction.tender_display, registered_customer.full_name,
      registered_customer.email, registered_customer.phone]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      transaction.id: 278
      transaction.tender_display: 239
    series_cell_visualizations:
      transaction.total_amount:
        is_active: true
        palette:
          palette_id: b88bef13-8fd0-4b30-4afc-56fbb14eeee8
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#F36254"
    series_value_format:
      transaction.id:
        name: id
        format_string: '0'
        label: ID
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_null_points: true
    listen: {}
    row: 13
    col: 12
    width: 12
    height: 15
  filters:
  - name: Untitled Filter
    title: Untitled Filter
    type: date_filter
    default_value: 12 months
    allow_multiple_values: true
    required: false
