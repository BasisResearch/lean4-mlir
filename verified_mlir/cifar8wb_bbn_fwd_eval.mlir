module @m {
  func.func @cifar8wb_bbn_fwd_eval(%x: tensor<128x3072xf32>, %W1: tensor<16x3x3x3xf32>, %cb1: tensor<16xf32>, %g1: tensor<16xf32>, %bt1: tensor<16xf32>, %W2: tensor<16x16x3x3xf32>, %cb2: tensor<16xf32>, %g2: tensor<16xf32>, %bt2: tensor<16xf32>, %W3: tensor<16x16x3x3xf32>, %cb3: tensor<16xf32>, %g3: tensor<16xf32>, %bt3: tensor<16xf32>, %W4: tensor<16x16x3x3xf32>, %cb4: tensor<16xf32>, %g4: tensor<16xf32>, %bt4: tensor<16xf32>, %W5: tensor<32x16x3x3xf32>, %cb5: tensor<32xf32>, %g5: tensor<32xf32>, %bt5: tensor<32xf32>, %W6: tensor<32x32x3x3xf32>, %cb6: tensor<32xf32>, %g6: tensor<32xf32>, %bt6: tensor<32xf32>, %W7: tensor<32x32x3x3xf32>, %cb7: tensor<32xf32>, %g7: tensor<32xf32>, %bt7: tensor<32xf32>, %W8: tensor<32x32x3x3xf32>, %cb8: tensor<32xf32>, %g8: tensor<32xf32>, %bt8: tensor<32xf32>, %W9: tensor<128x512xf32>, %b9: tensor<512xf32>, %Wa: tensor<512x512xf32>, %ba: tensor<512xf32>, %Wb: tensor<512x10xf32>, %bb: tensor<10xf32>, %n1mu: tensor<16xf32>, %n1var: tensor<16xf32>, %n2mu: tensor<16xf32>, %n2var: tensor<16xf32>, %n3mu: tensor<16xf32>, %n3var: tensor<16xf32>, %n4mu: tensor<16xf32>, %n4var: tensor<16xf32>, %n5mu: tensor<32xf32>, %n5var: tensor<32xf32>, %n6mu: tensor<32xf32>, %n6var: tensor<32xf32>, %n7mu: tensor<32xf32>, %n7var: tensor<32xf32>, %n8mu: tensor<32xf32>, %n8var: tensor<32xf32>) -> tensor<128x10xf32> {
    // ── cifar8-BN eval forward (running-stats BN, frozen per-channel statistics): every op is pretty(verified AST node) ──
    %v0 = stablehlo.reshape %x : (tensor<128x3072xf32>) -> tensor<128x3x32x32xf32>
    %v1 = stablehlo.convolution(%v0, %W1)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x3x32x32xf32>, tensor<16x3x3x3xf32>) -> tensor<128x16x32x32xf32>
    %v2 = stablehlo.broadcast_in_dim %cb1, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v3 = stablehlo.add %v1, %v2 : tensor<128x16x32x32xf32>
    %v4 = stablehlo.reshape %v3 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v5 = stablehlo.reshape %v4 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v6 = stablehlo.broadcast_in_dim %n1mu, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v7 = stablehlo.subtract %v5, %v6 : tensor<128x16x32x32xf32>
    %v8 = stablehlo.broadcast_in_dim %n1var, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v9 = stablehlo.constant dense<1.0e-05> : tensor<128x16x32x32xf32>
    %v10 = stablehlo.add %v8, %v9 : tensor<128x16x32x32xf32>
    %v11 = stablehlo.rsqrt %v10 : tensor<128x16x32x32xf32>
    %v12 = stablehlo.multiply %v7, %v11 : tensor<128x16x32x32xf32>
    %v13 = stablehlo.broadcast_in_dim %g1, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v14 = stablehlo.broadcast_in_dim %bt1, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v15 = stablehlo.multiply %v12, %v13 : tensor<128x16x32x32xf32>
    %v16 = stablehlo.add %v15, %v14 : tensor<128x16x32x32xf32>
    %v17 = stablehlo.reshape %v16 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v18 = stablehlo.reshape %v17 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v19 = stablehlo.constant dense<0.0> : tensor<128x16x32x32xf32>
    %v20 = stablehlo.maximum %v18, %v19 : tensor<128x16x32x32xf32>
    %v21 = stablehlo.reshape %v20 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v22 = stablehlo.reshape %v21 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v23 = stablehlo.convolution(%v22, %W2)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x16x32x32xf32>, tensor<16x16x3x3xf32>) -> tensor<128x16x32x32xf32>
    %v24 = stablehlo.broadcast_in_dim %cb2, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v25 = stablehlo.add %v23, %v24 : tensor<128x16x32x32xf32>
    %v26 = stablehlo.reshape %v25 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v27 = stablehlo.reshape %v26 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v28 = stablehlo.broadcast_in_dim %n2mu, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v29 = stablehlo.subtract %v27, %v28 : tensor<128x16x32x32xf32>
    %v30 = stablehlo.broadcast_in_dim %n2var, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v31 = stablehlo.constant dense<1.0e-05> : tensor<128x16x32x32xf32>
    %v32 = stablehlo.add %v30, %v31 : tensor<128x16x32x32xf32>
    %v33 = stablehlo.rsqrt %v32 : tensor<128x16x32x32xf32>
    %v34 = stablehlo.multiply %v29, %v33 : tensor<128x16x32x32xf32>
    %v35 = stablehlo.broadcast_in_dim %g2, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v36 = stablehlo.broadcast_in_dim %bt2, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v37 = stablehlo.multiply %v34, %v35 : tensor<128x16x32x32xf32>
    %v38 = stablehlo.add %v37, %v36 : tensor<128x16x32x32xf32>
    %v39 = stablehlo.reshape %v38 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v40 = stablehlo.reshape %v39 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v41 = stablehlo.constant dense<0.0> : tensor<128x16x32x32xf32>
    %v42 = stablehlo.maximum %v40, %v41 : tensor<128x16x32x32xf32>
    %v43 = stablehlo.reshape %v42 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v44 = stablehlo.reshape %v43 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v45 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v46 = "stablehlo.reduce_window"(%v44, %v45) ({
      ^bb0(%pa: tensor<f32>, %pb: tensor<f32>):
        %pm = stablehlo.maximum %pa, %pb : tensor<f32>
        stablehlo.return %pm : tensor<f32>
    }) {window_dimensions = array<i64: 1, 1, 2, 2>, window_strides = array<i64: 1, 1, 2, 2>} : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<128x16x16x16xf32>
    %v47 = stablehlo.reshape %v46 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v48 = stablehlo.reshape %v47 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v49 = stablehlo.convolution(%v48, %W3)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x16x16x16xf32>, tensor<16x16x3x3xf32>) -> tensor<128x16x16x16xf32>
    %v50 = stablehlo.broadcast_in_dim %cb3, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v51 = stablehlo.add %v49, %v50 : tensor<128x16x16x16xf32>
    %v52 = stablehlo.reshape %v51 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v53 = stablehlo.reshape %v52 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v54 = stablehlo.broadcast_in_dim %n3mu, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v55 = stablehlo.subtract %v53, %v54 : tensor<128x16x16x16xf32>
    %v56 = stablehlo.broadcast_in_dim %n3var, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v57 = stablehlo.constant dense<1.0e-05> : tensor<128x16x16x16xf32>
    %v58 = stablehlo.add %v56, %v57 : tensor<128x16x16x16xf32>
    %v59 = stablehlo.rsqrt %v58 : tensor<128x16x16x16xf32>
    %v60 = stablehlo.multiply %v55, %v59 : tensor<128x16x16x16xf32>
    %v61 = stablehlo.broadcast_in_dim %g3, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v62 = stablehlo.broadcast_in_dim %bt3, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v63 = stablehlo.multiply %v60, %v61 : tensor<128x16x16x16xf32>
    %v64 = stablehlo.add %v63, %v62 : tensor<128x16x16x16xf32>
    %v65 = stablehlo.reshape %v64 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v66 = stablehlo.reshape %v65 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v67 = stablehlo.constant dense<0.0> : tensor<128x16x16x16xf32>
    %v68 = stablehlo.maximum %v66, %v67 : tensor<128x16x16x16xf32>
    %v69 = stablehlo.reshape %v68 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v70 = stablehlo.reshape %v69 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v71 = stablehlo.convolution(%v70, %W4)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x16x16x16xf32>, tensor<16x16x3x3xf32>) -> tensor<128x16x16x16xf32>
    %v72 = stablehlo.broadcast_in_dim %cb4, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v73 = stablehlo.add %v71, %v72 : tensor<128x16x16x16xf32>
    %v74 = stablehlo.reshape %v73 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v75 = stablehlo.reshape %v74 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v76 = stablehlo.broadcast_in_dim %n4mu, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v77 = stablehlo.subtract %v75, %v76 : tensor<128x16x16x16xf32>
    %v78 = stablehlo.broadcast_in_dim %n4var, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v79 = stablehlo.constant dense<1.0e-05> : tensor<128x16x16x16xf32>
    %v80 = stablehlo.add %v78, %v79 : tensor<128x16x16x16xf32>
    %v81 = stablehlo.rsqrt %v80 : tensor<128x16x16x16xf32>
    %v82 = stablehlo.multiply %v77, %v81 : tensor<128x16x16x16xf32>
    %v83 = stablehlo.broadcast_in_dim %g4, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v84 = stablehlo.broadcast_in_dim %bt4, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v85 = stablehlo.multiply %v82, %v83 : tensor<128x16x16x16xf32>
    %v86 = stablehlo.add %v85, %v84 : tensor<128x16x16x16xf32>
    %v87 = stablehlo.reshape %v86 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v88 = stablehlo.reshape %v87 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v89 = stablehlo.constant dense<0.0> : tensor<128x16x16x16xf32>
    %v90 = stablehlo.maximum %v88, %v89 : tensor<128x16x16x16xf32>
    %v91 = stablehlo.reshape %v90 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v92 = stablehlo.reshape %v91 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v93 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v94 = "stablehlo.reduce_window"(%v92, %v93) ({
      ^bb0(%pa: tensor<f32>, %pb: tensor<f32>):
        %pm = stablehlo.maximum %pa, %pb : tensor<f32>
        stablehlo.return %pm : tensor<f32>
    }) {window_dimensions = array<i64: 1, 1, 2, 2>, window_strides = array<i64: 1, 1, 2, 2>} : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<128x16x8x8xf32>
    %v95 = stablehlo.reshape %v94 : (tensor<128x16x8x8xf32>) -> tensor<128x1024xf32>
    %v96 = stablehlo.reshape %v95 : (tensor<128x1024xf32>) -> tensor<128x16x8x8xf32>
    %v97 = stablehlo.convolution(%v96, %W5)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x16x8x8xf32>, tensor<32x16x3x3xf32>) -> tensor<128x32x8x8xf32>
    %v98 = stablehlo.broadcast_in_dim %cb5, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v99 = stablehlo.add %v97, %v98 : tensor<128x32x8x8xf32>
    %v100 = stablehlo.reshape %v99 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v101 = stablehlo.reshape %v100 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v102 = stablehlo.broadcast_in_dim %n5mu, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v103 = stablehlo.subtract %v101, %v102 : tensor<128x32x8x8xf32>
    %v104 = stablehlo.broadcast_in_dim %n5var, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v105 = stablehlo.constant dense<1.0e-05> : tensor<128x32x8x8xf32>
    %v106 = stablehlo.add %v104, %v105 : tensor<128x32x8x8xf32>
    %v107 = stablehlo.rsqrt %v106 : tensor<128x32x8x8xf32>
    %v108 = stablehlo.multiply %v103, %v107 : tensor<128x32x8x8xf32>
    %v109 = stablehlo.broadcast_in_dim %g5, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v110 = stablehlo.broadcast_in_dim %bt5, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v111 = stablehlo.multiply %v108, %v109 : tensor<128x32x8x8xf32>
    %v112 = stablehlo.add %v111, %v110 : tensor<128x32x8x8xf32>
    %v113 = stablehlo.reshape %v112 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v114 = stablehlo.reshape %v113 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v115 = stablehlo.constant dense<0.0> : tensor<128x32x8x8xf32>
    %v116 = stablehlo.maximum %v114, %v115 : tensor<128x32x8x8xf32>
    %v117 = stablehlo.reshape %v116 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v118 = stablehlo.reshape %v117 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v119 = stablehlo.convolution(%v118, %W6)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x32x8x8xf32>, tensor<32x32x3x3xf32>) -> tensor<128x32x8x8xf32>
    %v120 = stablehlo.broadcast_in_dim %cb6, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v121 = stablehlo.add %v119, %v120 : tensor<128x32x8x8xf32>
    %v122 = stablehlo.reshape %v121 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v123 = stablehlo.reshape %v122 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v124 = stablehlo.broadcast_in_dim %n6mu, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v125 = stablehlo.subtract %v123, %v124 : tensor<128x32x8x8xf32>
    %v126 = stablehlo.broadcast_in_dim %n6var, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v127 = stablehlo.constant dense<1.0e-05> : tensor<128x32x8x8xf32>
    %v128 = stablehlo.add %v126, %v127 : tensor<128x32x8x8xf32>
    %v129 = stablehlo.rsqrt %v128 : tensor<128x32x8x8xf32>
    %v130 = stablehlo.multiply %v125, %v129 : tensor<128x32x8x8xf32>
    %v131 = stablehlo.broadcast_in_dim %g6, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v132 = stablehlo.broadcast_in_dim %bt6, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v133 = stablehlo.multiply %v130, %v131 : tensor<128x32x8x8xf32>
    %v134 = stablehlo.add %v133, %v132 : tensor<128x32x8x8xf32>
    %v135 = stablehlo.reshape %v134 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v136 = stablehlo.reshape %v135 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v137 = stablehlo.constant dense<0.0> : tensor<128x32x8x8xf32>
    %v138 = stablehlo.maximum %v136, %v137 : tensor<128x32x8x8xf32>
    %v139 = stablehlo.reshape %v138 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v140 = stablehlo.reshape %v139 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v141 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v142 = "stablehlo.reduce_window"(%v140, %v141) ({
      ^bb0(%pa: tensor<f32>, %pb: tensor<f32>):
        %pm = stablehlo.maximum %pa, %pb : tensor<f32>
        stablehlo.return %pm : tensor<f32>
    }) {window_dimensions = array<i64: 1, 1, 2, 2>, window_strides = array<i64: 1, 1, 2, 2>} : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<128x32x4x4xf32>
    %v143 = stablehlo.reshape %v142 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v144 = stablehlo.reshape %v143 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v145 = stablehlo.convolution(%v144, %W7)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x32x4x4xf32>, tensor<32x32x3x3xf32>) -> tensor<128x32x4x4xf32>
    %v146 = stablehlo.broadcast_in_dim %cb7, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v147 = stablehlo.add %v145, %v146 : tensor<128x32x4x4xf32>
    %v148 = stablehlo.reshape %v147 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v149 = stablehlo.reshape %v148 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v150 = stablehlo.broadcast_in_dim %n7mu, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v151 = stablehlo.subtract %v149, %v150 : tensor<128x32x4x4xf32>
    %v152 = stablehlo.broadcast_in_dim %n7var, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v153 = stablehlo.constant dense<1.0e-05> : tensor<128x32x4x4xf32>
    %v154 = stablehlo.add %v152, %v153 : tensor<128x32x4x4xf32>
    %v155 = stablehlo.rsqrt %v154 : tensor<128x32x4x4xf32>
    %v156 = stablehlo.multiply %v151, %v155 : tensor<128x32x4x4xf32>
    %v157 = stablehlo.broadcast_in_dim %g7, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v158 = stablehlo.broadcast_in_dim %bt7, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v159 = stablehlo.multiply %v156, %v157 : tensor<128x32x4x4xf32>
    %v160 = stablehlo.add %v159, %v158 : tensor<128x32x4x4xf32>
    %v161 = stablehlo.reshape %v160 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v162 = stablehlo.reshape %v161 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v163 = stablehlo.constant dense<0.0> : tensor<128x32x4x4xf32>
    %v164 = stablehlo.maximum %v162, %v163 : tensor<128x32x4x4xf32>
    %v165 = stablehlo.reshape %v164 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v166 = stablehlo.reshape %v165 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v167 = stablehlo.convolution(%v166, %W8)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x32x4x4xf32>, tensor<32x32x3x3xf32>) -> tensor<128x32x4x4xf32>
    %v168 = stablehlo.broadcast_in_dim %cb8, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v169 = stablehlo.add %v167, %v168 : tensor<128x32x4x4xf32>
    %v170 = stablehlo.reshape %v169 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v171 = stablehlo.reshape %v170 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v172 = stablehlo.broadcast_in_dim %n8mu, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v173 = stablehlo.subtract %v171, %v172 : tensor<128x32x4x4xf32>
    %v174 = stablehlo.broadcast_in_dim %n8var, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v175 = stablehlo.constant dense<1.0e-05> : tensor<128x32x4x4xf32>
    %v176 = stablehlo.add %v174, %v175 : tensor<128x32x4x4xf32>
    %v177 = stablehlo.rsqrt %v176 : tensor<128x32x4x4xf32>
    %v178 = stablehlo.multiply %v173, %v177 : tensor<128x32x4x4xf32>
    %v179 = stablehlo.broadcast_in_dim %g8, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v180 = stablehlo.broadcast_in_dim %bt8, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v181 = stablehlo.multiply %v178, %v179 : tensor<128x32x4x4xf32>
    %v182 = stablehlo.add %v181, %v180 : tensor<128x32x4x4xf32>
    %v183 = stablehlo.reshape %v182 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v184 = stablehlo.reshape %v183 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v185 = stablehlo.constant dense<0.0> : tensor<128x32x4x4xf32>
    %v186 = stablehlo.maximum %v184, %v185 : tensor<128x32x4x4xf32>
    %v187 = stablehlo.reshape %v186 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v188 = stablehlo.reshape %v187 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v189 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v190 = "stablehlo.reduce_window"(%v188, %v189) ({
      ^bb0(%pa: tensor<f32>, %pb: tensor<f32>):
        %pm = stablehlo.maximum %pa, %pb : tensor<f32>
        stablehlo.return %pm : tensor<f32>
    }) {window_dimensions = array<i64: 1, 1, 2, 2>, window_strides = array<i64: 1, 1, 2, 2>} : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<128x32x2x2xf32>
    %v191 = stablehlo.reshape %v190 : (tensor<128x32x2x2xf32>) -> tensor<128x128xf32>
    %v192 = stablehlo.dot_general %v191, %W9, contracting_dims = [1] x [0], precision = [DEFAULT, DEFAULT] : (tensor<128x128xf32>, tensor<128x512xf32>) -> tensor<128x512xf32>
    %v193 = stablehlo.broadcast_in_dim %b9, dims = [1] : (tensor<512xf32>) -> tensor<128x512xf32>
    %v194 = stablehlo.add %v192, %v193 : tensor<128x512xf32>
    %v195 = stablehlo.constant dense<0.0> : tensor<128x512xf32>
    %v196 = stablehlo.maximum %v194, %v195 : tensor<128x512xf32>
    %v197 = stablehlo.dot_general %v196, %Wa, contracting_dims = [1] x [0], precision = [DEFAULT, DEFAULT] : (tensor<128x512xf32>, tensor<512x512xf32>) -> tensor<128x512xf32>
    %v198 = stablehlo.broadcast_in_dim %ba, dims = [1] : (tensor<512xf32>) -> tensor<128x512xf32>
    %v199 = stablehlo.add %v197, %v198 : tensor<128x512xf32>
    %v200 = stablehlo.constant dense<0.0> : tensor<128x512xf32>
    %v201 = stablehlo.maximum %v199, %v200 : tensor<128x512xf32>
    %v202 = stablehlo.dot_general %v201, %Wb, contracting_dims = [1] x [0], precision = [DEFAULT, DEFAULT] : (tensor<128x512xf32>, tensor<512x10xf32>) -> tensor<128x10xf32>
    %v203 = stablehlo.broadcast_in_dim %bb, dims = [1] : (tensor<10xf32>) -> tensor<128x10xf32>
    %v204 = stablehlo.add %v202, %v203 : tensor<128x10xf32>
    return %v204 : tensor<128x10xf32>
  }
}
