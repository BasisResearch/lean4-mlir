module @m {
  func.func @vitbin_emaaccdp2x128x4wxdropeps0000001smxbf16_fwd(%x: tensor<32x150528xf32>, %wConv: tensor<768x3x16x16xf32>, %bConv: tensor<768xf32>, %cls: tensor<768xf32>, %pos: tensor<197x768xf32>, %b0_g1: tensor<768xf32>, %b0_bt1: tensor<768xf32>, %b0_Wq: tensor<768x768xf32>, %b0_bq: tensor<768xf32>, %b0_Wk: tensor<768x768xf32>, %b0_bk: tensor<768xf32>, %b0_Wv: tensor<768x768xf32>, %b0_bv: tensor<768xf32>, %b0_Wo: tensor<768x768xf32>, %b0_bo: tensor<768xf32>, %b0_g2: tensor<768xf32>, %b0_bt2: tensor<768xf32>, %b0_Wfc1: tensor<768x3072xf32>, %b0_bfc1: tensor<3072xf32>, %b0_Wfc2: tensor<3072x768xf32>, %b0_bfc2: tensor<768xf32>, %b1_g1: tensor<768xf32>, %b1_bt1: tensor<768xf32>, %b1_Wq: tensor<768x768xf32>, %b1_bq: tensor<768xf32>, %b1_Wk: tensor<768x768xf32>, %b1_bk: tensor<768xf32>, %b1_Wv: tensor<768x768xf32>, %b1_bv: tensor<768xf32>, %b1_Wo: tensor<768x768xf32>, %b1_bo: tensor<768xf32>, %b1_g2: tensor<768xf32>, %b1_bt2: tensor<768xf32>, %b1_Wfc1: tensor<768x3072xf32>, %b1_bfc1: tensor<3072xf32>, %b1_Wfc2: tensor<3072x768xf32>, %b1_bfc2: tensor<768xf32>, %b2_g1: tensor<768xf32>, %b2_bt1: tensor<768xf32>, %b2_Wq: tensor<768x768xf32>, %b2_bq: tensor<768xf32>, %b2_Wk: tensor<768x768xf32>, %b2_bk: tensor<768xf32>, %b2_Wv: tensor<768x768xf32>, %b2_bv: tensor<768xf32>, %b2_Wo: tensor<768x768xf32>, %b2_bo: tensor<768xf32>, %b2_g2: tensor<768xf32>, %b2_bt2: tensor<768xf32>, %b2_Wfc1: tensor<768x3072xf32>, %b2_bfc1: tensor<3072xf32>, %b2_Wfc2: tensor<3072x768xf32>, %b2_bfc2: tensor<768xf32>, %b3_g1: tensor<768xf32>, %b3_bt1: tensor<768xf32>, %b3_Wq: tensor<768x768xf32>, %b3_bq: tensor<768xf32>, %b3_Wk: tensor<768x768xf32>, %b3_bk: tensor<768xf32>, %b3_Wv: tensor<768x768xf32>, %b3_bv: tensor<768xf32>, %b3_Wo: tensor<768x768xf32>, %b3_bo: tensor<768xf32>, %b3_g2: tensor<768xf32>, %b3_bt2: tensor<768xf32>, %b3_Wfc1: tensor<768x3072xf32>, %b3_bfc1: tensor<3072xf32>, %b3_Wfc2: tensor<3072x768xf32>, %b3_bfc2: tensor<768xf32>, %b4_g1: tensor<768xf32>, %b4_bt1: tensor<768xf32>, %b4_Wq: tensor<768x768xf32>, %b4_bq: tensor<768xf32>, %b4_Wk: tensor<768x768xf32>, %b4_bk: tensor<768xf32>, %b4_Wv: tensor<768x768xf32>, %b4_bv: tensor<768xf32>, %b4_Wo: tensor<768x768xf32>, %b4_bo: tensor<768xf32>, %b4_g2: tensor<768xf32>, %b4_bt2: tensor<768xf32>, %b4_Wfc1: tensor<768x3072xf32>, %b4_bfc1: tensor<3072xf32>, %b4_Wfc2: tensor<3072x768xf32>, %b4_bfc2: tensor<768xf32>, %b5_g1: tensor<768xf32>, %b5_bt1: tensor<768xf32>, %b5_Wq: tensor<768x768xf32>, %b5_bq: tensor<768xf32>, %b5_Wk: tensor<768x768xf32>, %b5_bk: tensor<768xf32>, %b5_Wv: tensor<768x768xf32>, %b5_bv: tensor<768xf32>, %b5_Wo: tensor<768x768xf32>, %b5_bo: tensor<768xf32>, %b5_g2: tensor<768xf32>, %b5_bt2: tensor<768xf32>, %b5_Wfc1: tensor<768x3072xf32>, %b5_bfc1: tensor<3072xf32>, %b5_Wfc2: tensor<3072x768xf32>, %b5_bfc2: tensor<768xf32>, %b6_g1: tensor<768xf32>, %b6_bt1: tensor<768xf32>, %b6_Wq: tensor<768x768xf32>, %b6_bq: tensor<768xf32>, %b6_Wk: tensor<768x768xf32>, %b6_bk: tensor<768xf32>, %b6_Wv: tensor<768x768xf32>, %b6_bv: tensor<768xf32>, %b6_Wo: tensor<768x768xf32>, %b6_bo: tensor<768xf32>, %b6_g2: tensor<768xf32>, %b6_bt2: tensor<768xf32>, %b6_Wfc1: tensor<768x3072xf32>, %b6_bfc1: tensor<3072xf32>, %b6_Wfc2: tensor<3072x768xf32>, %b6_bfc2: tensor<768xf32>, %b7_g1: tensor<768xf32>, %b7_bt1: tensor<768xf32>, %b7_Wq: tensor<768x768xf32>, %b7_bq: tensor<768xf32>, %b7_Wk: tensor<768x768xf32>, %b7_bk: tensor<768xf32>, %b7_Wv: tensor<768x768xf32>, %b7_bv: tensor<768xf32>, %b7_Wo: tensor<768x768xf32>, %b7_bo: tensor<768xf32>, %b7_g2: tensor<768xf32>, %b7_bt2: tensor<768xf32>, %b7_Wfc1: tensor<768x3072xf32>, %b7_bfc1: tensor<3072xf32>, %b7_Wfc2: tensor<3072x768xf32>, %b7_bfc2: tensor<768xf32>, %b8_g1: tensor<768xf32>, %b8_bt1: tensor<768xf32>, %b8_Wq: tensor<768x768xf32>, %b8_bq: tensor<768xf32>, %b8_Wk: tensor<768x768xf32>, %b8_bk: tensor<768xf32>, %b8_Wv: tensor<768x768xf32>, %b8_bv: tensor<768xf32>, %b8_Wo: tensor<768x768xf32>, %b8_bo: tensor<768xf32>, %b8_g2: tensor<768xf32>, %b8_bt2: tensor<768xf32>, %b8_Wfc1: tensor<768x3072xf32>, %b8_bfc1: tensor<3072xf32>, %b8_Wfc2: tensor<3072x768xf32>, %b8_bfc2: tensor<768xf32>, %b9_g1: tensor<768xf32>, %b9_bt1: tensor<768xf32>, %b9_Wq: tensor<768x768xf32>, %b9_bq: tensor<768xf32>, %b9_Wk: tensor<768x768xf32>, %b9_bk: tensor<768xf32>, %b9_Wv: tensor<768x768xf32>, %b9_bv: tensor<768xf32>, %b9_Wo: tensor<768x768xf32>, %b9_bo: tensor<768xf32>, %b9_g2: tensor<768xf32>, %b9_bt2: tensor<768xf32>, %b9_Wfc1: tensor<768x3072xf32>, %b9_bfc1: tensor<3072xf32>, %b9_Wfc2: tensor<3072x768xf32>, %b9_bfc2: tensor<768xf32>, %b10_g1: tensor<768xf32>, %b10_bt1: tensor<768xf32>, %b10_Wq: tensor<768x768xf32>, %b10_bq: tensor<768xf32>, %b10_Wk: tensor<768x768xf32>, %b10_bk: tensor<768xf32>, %b10_Wv: tensor<768x768xf32>, %b10_bv: tensor<768xf32>, %b10_Wo: tensor<768x768xf32>, %b10_bo: tensor<768xf32>, %b10_g2: tensor<768xf32>, %b10_bt2: tensor<768xf32>, %b10_Wfc1: tensor<768x3072xf32>, %b10_bfc1: tensor<3072xf32>, %b10_Wfc2: tensor<3072x768xf32>, %b10_bfc2: tensor<768xf32>, %b11_g1: tensor<768xf32>, %b11_bt1: tensor<768xf32>, %b11_Wq: tensor<768x768xf32>, %b11_bq: tensor<768xf32>, %b11_Wk: tensor<768x768xf32>, %b11_bk: tensor<768xf32>, %b11_Wv: tensor<768x768xf32>, %b11_bv: tensor<768xf32>, %b11_Wo: tensor<768x768xf32>, %b11_bo: tensor<768xf32>, %b11_g2: tensor<768xf32>, %b11_bt2: tensor<768xf32>, %b11_Wfc1: tensor<768x3072xf32>, %b11_bfc1: tensor<3072xf32>, %b11_Wfc2: tensor<3072x768xf32>, %b11_bfc2: tensor<768xf32>, %gF: tensor<768xf32>, %btF: tensor<768xf32>, %Wc: tensor<768x1000xf32>, %bc: tensor<1000xf32>) -> tensor<32x1000xf32> {
    %one = stablehlo.constant dense<1.0> : tensor<f32>
    %zero = stablehlo.constant dense<0.0> : tensor<f32>
    %sc = stablehlo.constant dense<0.0> : tensor<f32>
    %v0 = stablehlo.reshape %x : (tensor<32x150528xf32>) -> tensor<32x3x224x224xf32>
    %v1 = stablehlo.convolution(%v0, %wConv)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [16, 16], pad = [[0, 0], [0, 0]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<32x3x224x224xf32>, tensor<768x3x16x16xf32>) -> tensor<32x768x14x14xf32>
    %v2 = stablehlo.broadcast_in_dim %bConv, dims = [1] : (tensor<768xf32>) -> tensor<32x768x14x14xf32>
    %v3 = stablehlo.add %v1, %v2 : tensor<32x768x14x14xf32>
    %v4 = stablehlo.transpose %v3, dims = [0, 2, 3, 1] : (tensor<32x768x14x14xf32>) -> tensor<32x14x14x768xf32>
    %v5 = stablehlo.reshape %v4 : (tensor<32x14x14x768xf32>) -> tensor<32x196x768xf32>
    %v6 = stablehlo.broadcast_in_dim %cls, dims = [2] : (tensor<768xf32>) -> tensor<32x1x768xf32>
    %v7 = stablehlo.concatenate %v6, %v5, dim = 1 : (tensor<32x1x768xf32>, tensor<32x196x768xf32>) -> tensor<32x197x768xf32>
    %v8 = stablehlo.broadcast_in_dim %pos, dims = [1, 2] : (tensor<197x768xf32>) -> tensor<32x197x768xf32>
    %v9 = stablehlo.add %v7, %v8 : tensor<32x197x768xf32>
    %v10 = stablehlo.reshape %v9 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v11 = stablehlo.reshape %v10 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v12 = stablehlo.constant dense<0.0> : tensor<f32>
    %v13 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v14 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v15 = stablehlo.reduce(%v11 init: %v12) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v16 = stablehlo.broadcast_in_dim %v15, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v17 = stablehlo.divide %v16, %v13 : tensor<32x197x768xf32>
    %v18 = stablehlo.subtract %v11, %v17 : tensor<32x197x768xf32>
    %v19 = stablehlo.multiply %v18, %v18 : tensor<32x197x768xf32>
    %v20 = stablehlo.reduce(%v19 init: %v12) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v21 = stablehlo.broadcast_in_dim %v20, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v22 = stablehlo.divide %v21, %v13 : tensor<32x197x768xf32>
    %v23 = stablehlo.add %v22, %v14 : tensor<32x197x768xf32>
    %v24 = stablehlo.rsqrt %v23 : tensor<32x197x768xf32>
    %v25 = stablehlo.multiply %v18, %v24 : tensor<32x197x768xf32>
    %v26 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v27 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v28 = stablehlo.multiply %v25, %v26 : tensor<32x197x768xf32>
    %v29 = stablehlo.add %v28, %v27 : tensor<32x197x768xf32>
    %v30 = stablehlo.reshape %v29 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v31 = stablehlo.reshape %v30 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v32 = stablehlo.broadcast_in_dim %b0_g1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v33 = stablehlo.multiply %v31, %v32 : tensor<32x197x768xf32>
    %v34 = stablehlo.reshape %v33 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v35 = stablehlo.reshape %v34 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v36 = stablehlo.broadcast_in_dim %b0_bt1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v37 = stablehlo.add %v35, %v36 : tensor<32x197x768xf32>
    %v38 = stablehlo.reshape %v37 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v39 = stablehlo.reshape %v38 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v40 = stablehlo.dot_general %v39, %b0_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v41 = stablehlo.broadcast_in_dim %b0_bq, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v42 = stablehlo.add %v40, %v41 : tensor<32x197x768xf32>
    %v43 = stablehlo.reshape %v42 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v44 = stablehlo.reshape %v38 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v45 = stablehlo.dot_general %v44, %b0_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v46 = stablehlo.broadcast_in_dim %b0_bk, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v47 = stablehlo.add %v45, %v46 : tensor<32x197x768xf32>
    %v48 = stablehlo.reshape %v47 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v49 = stablehlo.reshape %v38 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v50 = stablehlo.dot_general %v49, %b0_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v51 = stablehlo.broadcast_in_dim %b0_bv, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v52 = stablehlo.add %v50, %v51 : tensor<32x197x768xf32>
    %v53 = stablehlo.reshape %v52 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v54 = stablehlo.reshape %v43 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v55 = stablehlo.slice %v54 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v56 = stablehlo.reshape %v55 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v57 = stablehlo.reshape %v48 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v58 = stablehlo.slice %v57 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v59 = stablehlo.reshape %v58 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v60 = stablehlo.reshape %v53 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v61 = stablehlo.slice %v60 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v62 = stablehlo.reshape %v61 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v63 = stablehlo.reshape %v59 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v64 = stablehlo.transpose %v63, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v65 = stablehlo.reshape %v64 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v66 = stablehlo.reshape %v56 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v67 = stablehlo.reshape %v65 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v68 = stablehlo.dot_general %v66, %v67, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v69 = stablehlo.reshape %v68 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v70 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v71 = stablehlo.multiply %v69, %v70 : tensor<32x38809xf32>
    %v72 = stablehlo.reshape %v71 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v73 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v74 = stablehlo.reduce(%v72 init: %v73) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v75 = stablehlo.broadcast_in_dim %v74, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v76 = stablehlo.subtract %v72, %v75 : tensor<32x197x197xf32>
    %v77 = stablehlo.constant dense<0.0> : tensor<f32>
    %v78 = stablehlo.exponential %v76 : tensor<32x197x197xf32>
    %v79 = stablehlo.reduce(%v78 init: %v77) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v80 = stablehlo.broadcast_in_dim %v79, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v81 = stablehlo.divide %v78, %v80 : tensor<32x197x197xf32>
    %v82 = stablehlo.reshape %v81 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v83 = stablehlo.reshape %v82 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v84 = stablehlo.reshape %v62 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v85 = stablehlo.dot_general %v83, %v84, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v86 = stablehlo.reshape %v85 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v87 = stablehlo.reshape %v86 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v88 = stablehlo.constant dense<0.0> : tensor<f32>
    %v89 = stablehlo.pad %v87, %v88, low = [0, 0, 0], high = [0, 0, 704], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v90 = stablehlo.reshape %v89 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v91 = stablehlo.reshape %v43 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v92 = stablehlo.slice %v91 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v93 = stablehlo.reshape %v92 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v94 = stablehlo.reshape %v48 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v95 = stablehlo.slice %v94 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v96 = stablehlo.reshape %v95 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v97 = stablehlo.reshape %v53 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v98 = stablehlo.slice %v97 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v99 = stablehlo.reshape %v98 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v100 = stablehlo.reshape %v96 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v101 = stablehlo.transpose %v100, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v102 = stablehlo.reshape %v101 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v103 = stablehlo.reshape %v93 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v104 = stablehlo.reshape %v102 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v105 = stablehlo.dot_general %v103, %v104, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v106 = stablehlo.reshape %v105 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v107 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v108 = stablehlo.multiply %v106, %v107 : tensor<32x38809xf32>
    %v109 = stablehlo.reshape %v108 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v110 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v111 = stablehlo.reduce(%v109 init: %v110) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v112 = stablehlo.broadcast_in_dim %v111, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v113 = stablehlo.subtract %v109, %v112 : tensor<32x197x197xf32>
    %v114 = stablehlo.constant dense<0.0> : tensor<f32>
    %v115 = stablehlo.exponential %v113 : tensor<32x197x197xf32>
    %v116 = stablehlo.reduce(%v115 init: %v114) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v117 = stablehlo.broadcast_in_dim %v116, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v118 = stablehlo.divide %v115, %v117 : tensor<32x197x197xf32>
    %v119 = stablehlo.reshape %v118 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v120 = stablehlo.reshape %v119 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v121 = stablehlo.reshape %v99 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v122 = stablehlo.dot_general %v120, %v121, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v123 = stablehlo.reshape %v122 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v124 = stablehlo.reshape %v123 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v125 = stablehlo.constant dense<0.0> : tensor<f32>
    %v126 = stablehlo.pad %v124, %v125, low = [0, 0, 64], high = [0, 0, 640], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v127 = stablehlo.reshape %v126 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v128 = stablehlo.add %v90, %v127 : tensor<32x151296xf32>
    %v129 = stablehlo.reshape %v43 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v130 = stablehlo.slice %v129 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v131 = stablehlo.reshape %v130 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v132 = stablehlo.reshape %v48 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v133 = stablehlo.slice %v132 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v134 = stablehlo.reshape %v133 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v135 = stablehlo.reshape %v53 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v136 = stablehlo.slice %v135 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v137 = stablehlo.reshape %v136 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v138 = stablehlo.reshape %v134 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v139 = stablehlo.transpose %v138, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v140 = stablehlo.reshape %v139 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v141 = stablehlo.reshape %v131 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v142 = stablehlo.reshape %v140 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v143 = stablehlo.dot_general %v141, %v142, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v144 = stablehlo.reshape %v143 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v145 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v146 = stablehlo.multiply %v144, %v145 : tensor<32x38809xf32>
    %v147 = stablehlo.reshape %v146 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v148 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v149 = stablehlo.reduce(%v147 init: %v148) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v150 = stablehlo.broadcast_in_dim %v149, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v151 = stablehlo.subtract %v147, %v150 : tensor<32x197x197xf32>
    %v152 = stablehlo.constant dense<0.0> : tensor<f32>
    %v153 = stablehlo.exponential %v151 : tensor<32x197x197xf32>
    %v154 = stablehlo.reduce(%v153 init: %v152) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v155 = stablehlo.broadcast_in_dim %v154, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v156 = stablehlo.divide %v153, %v155 : tensor<32x197x197xf32>
    %v157 = stablehlo.reshape %v156 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v158 = stablehlo.reshape %v157 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v159 = stablehlo.reshape %v137 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v160 = stablehlo.dot_general %v158, %v159, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v161 = stablehlo.reshape %v160 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v162 = stablehlo.reshape %v161 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v163 = stablehlo.constant dense<0.0> : tensor<f32>
    %v164 = stablehlo.pad %v162, %v163, low = [0, 0, 128], high = [0, 0, 576], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v165 = stablehlo.reshape %v164 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v166 = stablehlo.add %v128, %v165 : tensor<32x151296xf32>
    %v167 = stablehlo.reshape %v43 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v168 = stablehlo.slice %v167 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v169 = stablehlo.reshape %v168 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v170 = stablehlo.reshape %v48 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v171 = stablehlo.slice %v170 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v172 = stablehlo.reshape %v171 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v173 = stablehlo.reshape %v53 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v174 = stablehlo.slice %v173 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v175 = stablehlo.reshape %v174 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v176 = stablehlo.reshape %v172 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v177 = stablehlo.transpose %v176, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v178 = stablehlo.reshape %v177 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v179 = stablehlo.reshape %v169 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v180 = stablehlo.reshape %v178 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v181 = stablehlo.dot_general %v179, %v180, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v182 = stablehlo.reshape %v181 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v183 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v184 = stablehlo.multiply %v182, %v183 : tensor<32x38809xf32>
    %v185 = stablehlo.reshape %v184 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v186 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v187 = stablehlo.reduce(%v185 init: %v186) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v188 = stablehlo.broadcast_in_dim %v187, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v189 = stablehlo.subtract %v185, %v188 : tensor<32x197x197xf32>
    %v190 = stablehlo.constant dense<0.0> : tensor<f32>
    %v191 = stablehlo.exponential %v189 : tensor<32x197x197xf32>
    %v192 = stablehlo.reduce(%v191 init: %v190) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v193 = stablehlo.broadcast_in_dim %v192, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v194 = stablehlo.divide %v191, %v193 : tensor<32x197x197xf32>
    %v195 = stablehlo.reshape %v194 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v196 = stablehlo.reshape %v195 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v197 = stablehlo.reshape %v175 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v198 = stablehlo.dot_general %v196, %v197, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v199 = stablehlo.reshape %v198 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v200 = stablehlo.reshape %v199 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v201 = stablehlo.constant dense<0.0> : tensor<f32>
    %v202 = stablehlo.pad %v200, %v201, low = [0, 0, 192], high = [0, 0, 512], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v203 = stablehlo.reshape %v202 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v204 = stablehlo.add %v166, %v203 : tensor<32x151296xf32>
    %v205 = stablehlo.reshape %v43 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v206 = stablehlo.slice %v205 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v207 = stablehlo.reshape %v206 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v208 = stablehlo.reshape %v48 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v209 = stablehlo.slice %v208 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v210 = stablehlo.reshape %v209 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v211 = stablehlo.reshape %v53 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v212 = stablehlo.slice %v211 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v213 = stablehlo.reshape %v212 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v214 = stablehlo.reshape %v210 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v215 = stablehlo.transpose %v214, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v216 = stablehlo.reshape %v215 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v217 = stablehlo.reshape %v207 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v218 = stablehlo.reshape %v216 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v219 = stablehlo.dot_general %v217, %v218, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v220 = stablehlo.reshape %v219 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v221 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v222 = stablehlo.multiply %v220, %v221 : tensor<32x38809xf32>
    %v223 = stablehlo.reshape %v222 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v224 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v225 = stablehlo.reduce(%v223 init: %v224) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v226 = stablehlo.broadcast_in_dim %v225, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v227 = stablehlo.subtract %v223, %v226 : tensor<32x197x197xf32>
    %v228 = stablehlo.constant dense<0.0> : tensor<f32>
    %v229 = stablehlo.exponential %v227 : tensor<32x197x197xf32>
    %v230 = stablehlo.reduce(%v229 init: %v228) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v231 = stablehlo.broadcast_in_dim %v230, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v232 = stablehlo.divide %v229, %v231 : tensor<32x197x197xf32>
    %v233 = stablehlo.reshape %v232 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v234 = stablehlo.reshape %v233 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v235 = stablehlo.reshape %v213 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v236 = stablehlo.dot_general %v234, %v235, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v237 = stablehlo.reshape %v236 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v238 = stablehlo.reshape %v237 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v239 = stablehlo.constant dense<0.0> : tensor<f32>
    %v240 = stablehlo.pad %v238, %v239, low = [0, 0, 256], high = [0, 0, 448], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v241 = stablehlo.reshape %v240 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v242 = stablehlo.add %v204, %v241 : tensor<32x151296xf32>
    %v243 = stablehlo.reshape %v43 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v244 = stablehlo.slice %v243 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v245 = stablehlo.reshape %v244 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v246 = stablehlo.reshape %v48 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v247 = stablehlo.slice %v246 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v248 = stablehlo.reshape %v247 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v249 = stablehlo.reshape %v53 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v250 = stablehlo.slice %v249 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v251 = stablehlo.reshape %v250 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v252 = stablehlo.reshape %v248 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v253 = stablehlo.transpose %v252, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v254 = stablehlo.reshape %v253 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v255 = stablehlo.reshape %v245 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v256 = stablehlo.reshape %v254 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v257 = stablehlo.dot_general %v255, %v256, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v258 = stablehlo.reshape %v257 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v259 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v260 = stablehlo.multiply %v258, %v259 : tensor<32x38809xf32>
    %v261 = stablehlo.reshape %v260 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v262 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v263 = stablehlo.reduce(%v261 init: %v262) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v264 = stablehlo.broadcast_in_dim %v263, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v265 = stablehlo.subtract %v261, %v264 : tensor<32x197x197xf32>
    %v266 = stablehlo.constant dense<0.0> : tensor<f32>
    %v267 = stablehlo.exponential %v265 : tensor<32x197x197xf32>
    %v268 = stablehlo.reduce(%v267 init: %v266) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v269 = stablehlo.broadcast_in_dim %v268, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v270 = stablehlo.divide %v267, %v269 : tensor<32x197x197xf32>
    %v271 = stablehlo.reshape %v270 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v272 = stablehlo.reshape %v271 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v273 = stablehlo.reshape %v251 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v274 = stablehlo.dot_general %v272, %v273, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v275 = stablehlo.reshape %v274 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v276 = stablehlo.reshape %v275 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v277 = stablehlo.constant dense<0.0> : tensor<f32>
    %v278 = stablehlo.pad %v276, %v277, low = [0, 0, 320], high = [0, 0, 384], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v279 = stablehlo.reshape %v278 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v280 = stablehlo.add %v242, %v279 : tensor<32x151296xf32>
    %v281 = stablehlo.reshape %v43 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v282 = stablehlo.slice %v281 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v283 = stablehlo.reshape %v282 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v284 = stablehlo.reshape %v48 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v285 = stablehlo.slice %v284 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v286 = stablehlo.reshape %v285 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v287 = stablehlo.reshape %v53 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v288 = stablehlo.slice %v287 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v289 = stablehlo.reshape %v288 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v290 = stablehlo.reshape %v286 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v291 = stablehlo.transpose %v290, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v292 = stablehlo.reshape %v291 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v293 = stablehlo.reshape %v283 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v294 = stablehlo.reshape %v292 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v295 = stablehlo.dot_general %v293, %v294, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v296 = stablehlo.reshape %v295 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v297 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v298 = stablehlo.multiply %v296, %v297 : tensor<32x38809xf32>
    %v299 = stablehlo.reshape %v298 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v300 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v301 = stablehlo.reduce(%v299 init: %v300) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v302 = stablehlo.broadcast_in_dim %v301, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v303 = stablehlo.subtract %v299, %v302 : tensor<32x197x197xf32>
    %v304 = stablehlo.constant dense<0.0> : tensor<f32>
    %v305 = stablehlo.exponential %v303 : tensor<32x197x197xf32>
    %v306 = stablehlo.reduce(%v305 init: %v304) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v307 = stablehlo.broadcast_in_dim %v306, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v308 = stablehlo.divide %v305, %v307 : tensor<32x197x197xf32>
    %v309 = stablehlo.reshape %v308 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v310 = stablehlo.reshape %v309 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v311 = stablehlo.reshape %v289 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v312 = stablehlo.dot_general %v310, %v311, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v313 = stablehlo.reshape %v312 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v314 = stablehlo.reshape %v313 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v315 = stablehlo.constant dense<0.0> : tensor<f32>
    %v316 = stablehlo.pad %v314, %v315, low = [0, 0, 384], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v317 = stablehlo.reshape %v316 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v318 = stablehlo.add %v280, %v317 : tensor<32x151296xf32>
    %v319 = stablehlo.reshape %v43 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v320 = stablehlo.slice %v319 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v321 = stablehlo.reshape %v320 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v322 = stablehlo.reshape %v48 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v323 = stablehlo.slice %v322 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v324 = stablehlo.reshape %v323 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v325 = stablehlo.reshape %v53 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v326 = stablehlo.slice %v325 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v327 = stablehlo.reshape %v326 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v328 = stablehlo.reshape %v324 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v329 = stablehlo.transpose %v328, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v330 = stablehlo.reshape %v329 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v331 = stablehlo.reshape %v321 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v332 = stablehlo.reshape %v330 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v333 = stablehlo.dot_general %v331, %v332, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v334 = stablehlo.reshape %v333 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v335 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v336 = stablehlo.multiply %v334, %v335 : tensor<32x38809xf32>
    %v337 = stablehlo.reshape %v336 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v338 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v339 = stablehlo.reduce(%v337 init: %v338) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v340 = stablehlo.broadcast_in_dim %v339, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v341 = stablehlo.subtract %v337, %v340 : tensor<32x197x197xf32>
    %v342 = stablehlo.constant dense<0.0> : tensor<f32>
    %v343 = stablehlo.exponential %v341 : tensor<32x197x197xf32>
    %v344 = stablehlo.reduce(%v343 init: %v342) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v345 = stablehlo.broadcast_in_dim %v344, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v346 = stablehlo.divide %v343, %v345 : tensor<32x197x197xf32>
    %v347 = stablehlo.reshape %v346 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v348 = stablehlo.reshape %v347 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v349 = stablehlo.reshape %v327 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v350 = stablehlo.dot_general %v348, %v349, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v351 = stablehlo.reshape %v350 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v352 = stablehlo.reshape %v351 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v353 = stablehlo.constant dense<0.0> : tensor<f32>
    %v354 = stablehlo.pad %v352, %v353, low = [0, 0, 448], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v355 = stablehlo.reshape %v354 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v356 = stablehlo.add %v318, %v355 : tensor<32x151296xf32>
    %v357 = stablehlo.reshape %v43 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v358 = stablehlo.slice %v357 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v359 = stablehlo.reshape %v358 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v360 = stablehlo.reshape %v48 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v361 = stablehlo.slice %v360 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v362 = stablehlo.reshape %v361 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v363 = stablehlo.reshape %v53 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v364 = stablehlo.slice %v363 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v365 = stablehlo.reshape %v364 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v366 = stablehlo.reshape %v362 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v367 = stablehlo.transpose %v366, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v368 = stablehlo.reshape %v367 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v369 = stablehlo.reshape %v359 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v370 = stablehlo.reshape %v368 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v371 = stablehlo.dot_general %v369, %v370, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v372 = stablehlo.reshape %v371 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v373 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v374 = stablehlo.multiply %v372, %v373 : tensor<32x38809xf32>
    %v375 = stablehlo.reshape %v374 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v376 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v377 = stablehlo.reduce(%v375 init: %v376) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v378 = stablehlo.broadcast_in_dim %v377, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v379 = stablehlo.subtract %v375, %v378 : tensor<32x197x197xf32>
    %v380 = stablehlo.constant dense<0.0> : tensor<f32>
    %v381 = stablehlo.exponential %v379 : tensor<32x197x197xf32>
    %v382 = stablehlo.reduce(%v381 init: %v380) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v383 = stablehlo.broadcast_in_dim %v382, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v384 = stablehlo.divide %v381, %v383 : tensor<32x197x197xf32>
    %v385 = stablehlo.reshape %v384 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v386 = stablehlo.reshape %v385 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v387 = stablehlo.reshape %v365 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v388 = stablehlo.dot_general %v386, %v387, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v389 = stablehlo.reshape %v388 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v390 = stablehlo.reshape %v389 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v391 = stablehlo.constant dense<0.0> : tensor<f32>
    %v392 = stablehlo.pad %v390, %v391, low = [0, 0, 512], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v393 = stablehlo.reshape %v392 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v394 = stablehlo.add %v356, %v393 : tensor<32x151296xf32>
    %v395 = stablehlo.reshape %v43 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v396 = stablehlo.slice %v395 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v397 = stablehlo.reshape %v396 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v398 = stablehlo.reshape %v48 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v399 = stablehlo.slice %v398 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v400 = stablehlo.reshape %v399 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v401 = stablehlo.reshape %v53 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v402 = stablehlo.slice %v401 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v403 = stablehlo.reshape %v402 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v404 = stablehlo.reshape %v400 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v405 = stablehlo.transpose %v404, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v406 = stablehlo.reshape %v405 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v407 = stablehlo.reshape %v397 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v408 = stablehlo.reshape %v406 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v409 = stablehlo.dot_general %v407, %v408, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v410 = stablehlo.reshape %v409 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v411 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v412 = stablehlo.multiply %v410, %v411 : tensor<32x38809xf32>
    %v413 = stablehlo.reshape %v412 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v414 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v415 = stablehlo.reduce(%v413 init: %v414) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v416 = stablehlo.broadcast_in_dim %v415, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v417 = stablehlo.subtract %v413, %v416 : tensor<32x197x197xf32>
    %v418 = stablehlo.constant dense<0.0> : tensor<f32>
    %v419 = stablehlo.exponential %v417 : tensor<32x197x197xf32>
    %v420 = stablehlo.reduce(%v419 init: %v418) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v421 = stablehlo.broadcast_in_dim %v420, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v422 = stablehlo.divide %v419, %v421 : tensor<32x197x197xf32>
    %v423 = stablehlo.reshape %v422 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v424 = stablehlo.reshape %v423 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v425 = stablehlo.reshape %v403 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v426 = stablehlo.dot_general %v424, %v425, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v427 = stablehlo.reshape %v426 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v428 = stablehlo.reshape %v427 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v429 = stablehlo.constant dense<0.0> : tensor<f32>
    %v430 = stablehlo.pad %v428, %v429, low = [0, 0, 576], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v431 = stablehlo.reshape %v430 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v432 = stablehlo.add %v394, %v431 : tensor<32x151296xf32>
    %v433 = stablehlo.reshape %v43 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v434 = stablehlo.slice %v433 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v435 = stablehlo.reshape %v434 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v436 = stablehlo.reshape %v48 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v437 = stablehlo.slice %v436 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v438 = stablehlo.reshape %v437 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v439 = stablehlo.reshape %v53 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v440 = stablehlo.slice %v439 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v441 = stablehlo.reshape %v440 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v442 = stablehlo.reshape %v438 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v443 = stablehlo.transpose %v442, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v444 = stablehlo.reshape %v443 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v445 = stablehlo.reshape %v435 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v446 = stablehlo.reshape %v444 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v447 = stablehlo.dot_general %v445, %v446, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v448 = stablehlo.reshape %v447 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v449 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v450 = stablehlo.multiply %v448, %v449 : tensor<32x38809xf32>
    %v451 = stablehlo.reshape %v450 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v452 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v453 = stablehlo.reduce(%v451 init: %v452) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v454 = stablehlo.broadcast_in_dim %v453, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v455 = stablehlo.subtract %v451, %v454 : tensor<32x197x197xf32>
    %v456 = stablehlo.constant dense<0.0> : tensor<f32>
    %v457 = stablehlo.exponential %v455 : tensor<32x197x197xf32>
    %v458 = stablehlo.reduce(%v457 init: %v456) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v459 = stablehlo.broadcast_in_dim %v458, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v460 = stablehlo.divide %v457, %v459 : tensor<32x197x197xf32>
    %v461 = stablehlo.reshape %v460 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v462 = stablehlo.reshape %v461 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v463 = stablehlo.reshape %v441 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v464 = stablehlo.dot_general %v462, %v463, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v465 = stablehlo.reshape %v464 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v466 = stablehlo.reshape %v465 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v467 = stablehlo.constant dense<0.0> : tensor<f32>
    %v468 = stablehlo.pad %v466, %v467, low = [0, 0, 640], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v469 = stablehlo.reshape %v468 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v470 = stablehlo.add %v432, %v469 : tensor<32x151296xf32>
    %v471 = stablehlo.reshape %v43 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v472 = stablehlo.slice %v471 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v473 = stablehlo.reshape %v472 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v474 = stablehlo.reshape %v48 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v475 = stablehlo.slice %v474 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v476 = stablehlo.reshape %v475 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v477 = stablehlo.reshape %v53 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v478 = stablehlo.slice %v477 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v479 = stablehlo.reshape %v478 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v480 = stablehlo.reshape %v476 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v481 = stablehlo.transpose %v480, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v482 = stablehlo.reshape %v481 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v483 = stablehlo.reshape %v473 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v484 = stablehlo.reshape %v482 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v485 = stablehlo.dot_general %v483, %v484, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v486 = stablehlo.reshape %v485 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v487 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v488 = stablehlo.multiply %v486, %v487 : tensor<32x38809xf32>
    %v489 = stablehlo.reshape %v488 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v490 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v491 = stablehlo.reduce(%v489 init: %v490) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v492 = stablehlo.broadcast_in_dim %v491, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v493 = stablehlo.subtract %v489, %v492 : tensor<32x197x197xf32>
    %v494 = stablehlo.constant dense<0.0> : tensor<f32>
    %v495 = stablehlo.exponential %v493 : tensor<32x197x197xf32>
    %v496 = stablehlo.reduce(%v495 init: %v494) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v497 = stablehlo.broadcast_in_dim %v496, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v498 = stablehlo.divide %v495, %v497 : tensor<32x197x197xf32>
    %v499 = stablehlo.reshape %v498 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v500 = stablehlo.reshape %v499 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v501 = stablehlo.reshape %v479 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v502 = stablehlo.dot_general %v500, %v501, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v503 = stablehlo.reshape %v502 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v504 = stablehlo.reshape %v503 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v505 = stablehlo.constant dense<0.0> : tensor<f32>
    %v506 = stablehlo.pad %v504, %v505, low = [0, 0, 704], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v507 = stablehlo.reshape %v506 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v508 = stablehlo.add %v470, %v507 : tensor<32x151296xf32>
    %v509 = stablehlo.reshape %v508 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v510 = stablehlo.dot_general %v509, %b0_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v511 = stablehlo.broadcast_in_dim %b0_bo, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v512 = stablehlo.add %v510, %v511 : tensor<32x197x768xf32>
    %v513 = stablehlo.reshape %v512 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v514 = stablehlo.add %v10, %v513 : tensor<32x151296xf32>
    %v515 = stablehlo.reshape %v514 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v516 = stablehlo.constant dense<0.0> : tensor<f32>
    %v517 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v518 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v519 = stablehlo.reduce(%v515 init: %v516) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v520 = stablehlo.broadcast_in_dim %v519, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v521 = stablehlo.divide %v520, %v517 : tensor<32x197x768xf32>
    %v522 = stablehlo.subtract %v515, %v521 : tensor<32x197x768xf32>
    %v523 = stablehlo.multiply %v522, %v522 : tensor<32x197x768xf32>
    %v524 = stablehlo.reduce(%v523 init: %v516) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v525 = stablehlo.broadcast_in_dim %v524, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v526 = stablehlo.divide %v525, %v517 : tensor<32x197x768xf32>
    %v527 = stablehlo.add %v526, %v518 : tensor<32x197x768xf32>
    %v528 = stablehlo.rsqrt %v527 : tensor<32x197x768xf32>
    %v529 = stablehlo.multiply %v522, %v528 : tensor<32x197x768xf32>
    %v530 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v531 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v532 = stablehlo.multiply %v529, %v530 : tensor<32x197x768xf32>
    %v533 = stablehlo.add %v532, %v531 : tensor<32x197x768xf32>
    %v534 = stablehlo.reshape %v533 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v535 = stablehlo.reshape %v534 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v536 = stablehlo.broadcast_in_dim %b0_g2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v537 = stablehlo.multiply %v535, %v536 : tensor<32x197x768xf32>
    %v538 = stablehlo.reshape %v537 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v539 = stablehlo.reshape %v538 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v540 = stablehlo.broadcast_in_dim %b0_bt2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v541 = stablehlo.add %v539, %v540 : tensor<32x197x768xf32>
    %v542 = stablehlo.reshape %v541 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v543 = stablehlo.reshape %v542 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v544 = stablehlo.dot_general %v543, %b0_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x3072xf32>) -> tensor<32x197x3072xf32>
    %v545 = stablehlo.broadcast_in_dim %b0_bfc1, dims = [2] : (tensor<3072xf32>) -> tensor<32x197x3072xf32>
    %v546 = stablehlo.add %v544, %v545 : tensor<32x197x3072xf32>
    %v547 = stablehlo.reshape %v546 : (tensor<32x197x3072xf32>) -> tensor<32x605184xf32>
    %v548 = stablehlo.multiply %v547, %v547 : tensor<32x605184xf32>
    %v549 = stablehlo.multiply %v548, %v547 : tensor<32x605184xf32>
    %v550 = stablehlo.constant dense<0.044715> : tensor<32x605184xf32>
    %v551 = stablehlo.multiply %v550, %v549 : tensor<32x605184xf32>
    %v552 = stablehlo.add %v547, %v551 : tensor<32x605184xf32>
    %v553 = stablehlo.constant dense<0.7978845608028654> : tensor<32x605184xf32>
    %v554 = stablehlo.multiply %v553, %v552 : tensor<32x605184xf32>
    %v555 = stablehlo.tanh %v554 : tensor<32x605184xf32>
    %v556 = stablehlo.constant dense<1.0> : tensor<32x605184xf32>
    %v557 = stablehlo.add %v556, %v555 : tensor<32x605184xf32>
    %v558 = stablehlo.constant dense<0.5> : tensor<32x605184xf32>
    %v559 = stablehlo.multiply %v558, %v547 : tensor<32x605184xf32>
    %v560 = stablehlo.multiply %v559, %v557 : tensor<32x605184xf32>
    %v561 = stablehlo.reshape %v560 : (tensor<32x605184xf32>) -> tensor<32x197x3072xf32>
    %v562 = stablehlo.dot_general %v561, %b0_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x3072xf32>, tensor<3072x768xf32>) -> tensor<32x197x768xf32>
    %v563 = stablehlo.broadcast_in_dim %b0_bfc2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v564 = stablehlo.add %v562, %v563 : tensor<32x197x768xf32>
    %v565 = stablehlo.reshape %v564 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v566 = stablehlo.add %v514, %v565 : tensor<32x151296xf32>
    %v567 = stablehlo.reshape %v566 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v568 = stablehlo.constant dense<0.0> : tensor<f32>
    %v569 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v570 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v571 = stablehlo.reduce(%v567 init: %v568) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v572 = stablehlo.broadcast_in_dim %v571, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v573 = stablehlo.divide %v572, %v569 : tensor<32x197x768xf32>
    %v574 = stablehlo.subtract %v567, %v573 : tensor<32x197x768xf32>
    %v575 = stablehlo.multiply %v574, %v574 : tensor<32x197x768xf32>
    %v576 = stablehlo.reduce(%v575 init: %v568) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v577 = stablehlo.broadcast_in_dim %v576, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v578 = stablehlo.divide %v577, %v569 : tensor<32x197x768xf32>
    %v579 = stablehlo.add %v578, %v570 : tensor<32x197x768xf32>
    %v580 = stablehlo.rsqrt %v579 : tensor<32x197x768xf32>
    %v581 = stablehlo.multiply %v574, %v580 : tensor<32x197x768xf32>
    %v582 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v583 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v584 = stablehlo.multiply %v581, %v582 : tensor<32x197x768xf32>
    %v585 = stablehlo.add %v584, %v583 : tensor<32x197x768xf32>
    %v586 = stablehlo.reshape %v585 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v587 = stablehlo.reshape %v586 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v588 = stablehlo.broadcast_in_dim %b1_g1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v589 = stablehlo.multiply %v587, %v588 : tensor<32x197x768xf32>
    %v590 = stablehlo.reshape %v589 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v591 = stablehlo.reshape %v590 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v592 = stablehlo.broadcast_in_dim %b1_bt1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v593 = stablehlo.add %v591, %v592 : tensor<32x197x768xf32>
    %v594 = stablehlo.reshape %v593 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v595 = stablehlo.reshape %v594 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v596 = stablehlo.dot_general %v595, %b1_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v597 = stablehlo.broadcast_in_dim %b1_bq, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v598 = stablehlo.add %v596, %v597 : tensor<32x197x768xf32>
    %v599 = stablehlo.reshape %v598 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v600 = stablehlo.reshape %v594 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v601 = stablehlo.dot_general %v600, %b1_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v602 = stablehlo.broadcast_in_dim %b1_bk, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v603 = stablehlo.add %v601, %v602 : tensor<32x197x768xf32>
    %v604 = stablehlo.reshape %v603 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v605 = stablehlo.reshape %v594 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v606 = stablehlo.dot_general %v605, %b1_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v607 = stablehlo.broadcast_in_dim %b1_bv, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v608 = stablehlo.add %v606, %v607 : tensor<32x197x768xf32>
    %v609 = stablehlo.reshape %v608 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v610 = stablehlo.reshape %v599 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v611 = stablehlo.slice %v610 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v612 = stablehlo.reshape %v611 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v613 = stablehlo.reshape %v604 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v614 = stablehlo.slice %v613 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v615 = stablehlo.reshape %v614 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v616 = stablehlo.reshape %v609 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v617 = stablehlo.slice %v616 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v618 = stablehlo.reshape %v617 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v619 = stablehlo.reshape %v615 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v620 = stablehlo.transpose %v619, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v621 = stablehlo.reshape %v620 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v622 = stablehlo.reshape %v612 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v623 = stablehlo.reshape %v621 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v624 = stablehlo.dot_general %v622, %v623, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v625 = stablehlo.reshape %v624 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v626 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v627 = stablehlo.multiply %v625, %v626 : tensor<32x38809xf32>
    %v628 = stablehlo.reshape %v627 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v629 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v630 = stablehlo.reduce(%v628 init: %v629) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v631 = stablehlo.broadcast_in_dim %v630, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v632 = stablehlo.subtract %v628, %v631 : tensor<32x197x197xf32>
    %v633 = stablehlo.constant dense<0.0> : tensor<f32>
    %v634 = stablehlo.exponential %v632 : tensor<32x197x197xf32>
    %v635 = stablehlo.reduce(%v634 init: %v633) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v636 = stablehlo.broadcast_in_dim %v635, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v637 = stablehlo.divide %v634, %v636 : tensor<32x197x197xf32>
    %v638 = stablehlo.reshape %v637 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v639 = stablehlo.reshape %v638 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v640 = stablehlo.reshape %v618 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v641 = stablehlo.dot_general %v639, %v640, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v642 = stablehlo.reshape %v641 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v643 = stablehlo.reshape %v642 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v644 = stablehlo.constant dense<0.0> : tensor<f32>
    %v645 = stablehlo.pad %v643, %v644, low = [0, 0, 0], high = [0, 0, 704], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v646 = stablehlo.reshape %v645 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v647 = stablehlo.reshape %v599 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v648 = stablehlo.slice %v647 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v649 = stablehlo.reshape %v648 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v650 = stablehlo.reshape %v604 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v651 = stablehlo.slice %v650 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v652 = stablehlo.reshape %v651 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v653 = stablehlo.reshape %v609 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v654 = stablehlo.slice %v653 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v655 = stablehlo.reshape %v654 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v656 = stablehlo.reshape %v652 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v657 = stablehlo.transpose %v656, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v658 = stablehlo.reshape %v657 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v659 = stablehlo.reshape %v649 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v660 = stablehlo.reshape %v658 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v661 = stablehlo.dot_general %v659, %v660, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v662 = stablehlo.reshape %v661 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v663 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v664 = stablehlo.multiply %v662, %v663 : tensor<32x38809xf32>
    %v665 = stablehlo.reshape %v664 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v666 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v667 = stablehlo.reduce(%v665 init: %v666) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v668 = stablehlo.broadcast_in_dim %v667, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v669 = stablehlo.subtract %v665, %v668 : tensor<32x197x197xf32>
    %v670 = stablehlo.constant dense<0.0> : tensor<f32>
    %v671 = stablehlo.exponential %v669 : tensor<32x197x197xf32>
    %v672 = stablehlo.reduce(%v671 init: %v670) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v673 = stablehlo.broadcast_in_dim %v672, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v674 = stablehlo.divide %v671, %v673 : tensor<32x197x197xf32>
    %v675 = stablehlo.reshape %v674 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v676 = stablehlo.reshape %v675 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v677 = stablehlo.reshape %v655 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v678 = stablehlo.dot_general %v676, %v677, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v679 = stablehlo.reshape %v678 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v680 = stablehlo.reshape %v679 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v681 = stablehlo.constant dense<0.0> : tensor<f32>
    %v682 = stablehlo.pad %v680, %v681, low = [0, 0, 64], high = [0, 0, 640], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v683 = stablehlo.reshape %v682 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v684 = stablehlo.add %v646, %v683 : tensor<32x151296xf32>
    %v685 = stablehlo.reshape %v599 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v686 = stablehlo.slice %v685 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v687 = stablehlo.reshape %v686 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v688 = stablehlo.reshape %v604 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v689 = stablehlo.slice %v688 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v690 = stablehlo.reshape %v689 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v691 = stablehlo.reshape %v609 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v692 = stablehlo.slice %v691 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v693 = stablehlo.reshape %v692 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v694 = stablehlo.reshape %v690 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v695 = stablehlo.transpose %v694, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v696 = stablehlo.reshape %v695 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v697 = stablehlo.reshape %v687 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v698 = stablehlo.reshape %v696 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v699 = stablehlo.dot_general %v697, %v698, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v700 = stablehlo.reshape %v699 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v701 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v702 = stablehlo.multiply %v700, %v701 : tensor<32x38809xf32>
    %v703 = stablehlo.reshape %v702 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v704 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v705 = stablehlo.reduce(%v703 init: %v704) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v706 = stablehlo.broadcast_in_dim %v705, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v707 = stablehlo.subtract %v703, %v706 : tensor<32x197x197xf32>
    %v708 = stablehlo.constant dense<0.0> : tensor<f32>
    %v709 = stablehlo.exponential %v707 : tensor<32x197x197xf32>
    %v710 = stablehlo.reduce(%v709 init: %v708) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v711 = stablehlo.broadcast_in_dim %v710, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v712 = stablehlo.divide %v709, %v711 : tensor<32x197x197xf32>
    %v713 = stablehlo.reshape %v712 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v714 = stablehlo.reshape %v713 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v715 = stablehlo.reshape %v693 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v716 = stablehlo.dot_general %v714, %v715, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v717 = stablehlo.reshape %v716 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v718 = stablehlo.reshape %v717 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v719 = stablehlo.constant dense<0.0> : tensor<f32>
    %v720 = stablehlo.pad %v718, %v719, low = [0, 0, 128], high = [0, 0, 576], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v721 = stablehlo.reshape %v720 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v722 = stablehlo.add %v684, %v721 : tensor<32x151296xf32>
    %v723 = stablehlo.reshape %v599 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v724 = stablehlo.slice %v723 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v725 = stablehlo.reshape %v724 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v726 = stablehlo.reshape %v604 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v727 = stablehlo.slice %v726 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v728 = stablehlo.reshape %v727 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v729 = stablehlo.reshape %v609 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v730 = stablehlo.slice %v729 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v731 = stablehlo.reshape %v730 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v732 = stablehlo.reshape %v728 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v733 = stablehlo.transpose %v732, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v734 = stablehlo.reshape %v733 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v735 = stablehlo.reshape %v725 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v736 = stablehlo.reshape %v734 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v737 = stablehlo.dot_general %v735, %v736, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v738 = stablehlo.reshape %v737 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v739 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v740 = stablehlo.multiply %v738, %v739 : tensor<32x38809xf32>
    %v741 = stablehlo.reshape %v740 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v742 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v743 = stablehlo.reduce(%v741 init: %v742) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v744 = stablehlo.broadcast_in_dim %v743, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v745 = stablehlo.subtract %v741, %v744 : tensor<32x197x197xf32>
    %v746 = stablehlo.constant dense<0.0> : tensor<f32>
    %v747 = stablehlo.exponential %v745 : tensor<32x197x197xf32>
    %v748 = stablehlo.reduce(%v747 init: %v746) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v749 = stablehlo.broadcast_in_dim %v748, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v750 = stablehlo.divide %v747, %v749 : tensor<32x197x197xf32>
    %v751 = stablehlo.reshape %v750 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v752 = stablehlo.reshape %v751 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v753 = stablehlo.reshape %v731 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v754 = stablehlo.dot_general %v752, %v753, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v755 = stablehlo.reshape %v754 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v756 = stablehlo.reshape %v755 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v757 = stablehlo.constant dense<0.0> : tensor<f32>
    %v758 = stablehlo.pad %v756, %v757, low = [0, 0, 192], high = [0, 0, 512], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v759 = stablehlo.reshape %v758 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v760 = stablehlo.add %v722, %v759 : tensor<32x151296xf32>
    %v761 = stablehlo.reshape %v599 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v762 = stablehlo.slice %v761 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v763 = stablehlo.reshape %v762 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v764 = stablehlo.reshape %v604 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v765 = stablehlo.slice %v764 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v766 = stablehlo.reshape %v765 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v767 = stablehlo.reshape %v609 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v768 = stablehlo.slice %v767 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v769 = stablehlo.reshape %v768 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v770 = stablehlo.reshape %v766 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v771 = stablehlo.transpose %v770, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v772 = stablehlo.reshape %v771 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v773 = stablehlo.reshape %v763 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v774 = stablehlo.reshape %v772 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v775 = stablehlo.dot_general %v773, %v774, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v776 = stablehlo.reshape %v775 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v777 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v778 = stablehlo.multiply %v776, %v777 : tensor<32x38809xf32>
    %v779 = stablehlo.reshape %v778 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v780 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v781 = stablehlo.reduce(%v779 init: %v780) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v782 = stablehlo.broadcast_in_dim %v781, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v783 = stablehlo.subtract %v779, %v782 : tensor<32x197x197xf32>
    %v784 = stablehlo.constant dense<0.0> : tensor<f32>
    %v785 = stablehlo.exponential %v783 : tensor<32x197x197xf32>
    %v786 = stablehlo.reduce(%v785 init: %v784) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v787 = stablehlo.broadcast_in_dim %v786, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v788 = stablehlo.divide %v785, %v787 : tensor<32x197x197xf32>
    %v789 = stablehlo.reshape %v788 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v790 = stablehlo.reshape %v789 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v791 = stablehlo.reshape %v769 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v792 = stablehlo.dot_general %v790, %v791, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v793 = stablehlo.reshape %v792 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v794 = stablehlo.reshape %v793 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v795 = stablehlo.constant dense<0.0> : tensor<f32>
    %v796 = stablehlo.pad %v794, %v795, low = [0, 0, 256], high = [0, 0, 448], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v797 = stablehlo.reshape %v796 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v798 = stablehlo.add %v760, %v797 : tensor<32x151296xf32>
    %v799 = stablehlo.reshape %v599 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v800 = stablehlo.slice %v799 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v801 = stablehlo.reshape %v800 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v802 = stablehlo.reshape %v604 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v803 = stablehlo.slice %v802 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v804 = stablehlo.reshape %v803 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v805 = stablehlo.reshape %v609 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v806 = stablehlo.slice %v805 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v807 = stablehlo.reshape %v806 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v808 = stablehlo.reshape %v804 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v809 = stablehlo.transpose %v808, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v810 = stablehlo.reshape %v809 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v811 = stablehlo.reshape %v801 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v812 = stablehlo.reshape %v810 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v813 = stablehlo.dot_general %v811, %v812, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v814 = stablehlo.reshape %v813 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v815 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v816 = stablehlo.multiply %v814, %v815 : tensor<32x38809xf32>
    %v817 = stablehlo.reshape %v816 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v818 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v819 = stablehlo.reduce(%v817 init: %v818) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v820 = stablehlo.broadcast_in_dim %v819, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v821 = stablehlo.subtract %v817, %v820 : tensor<32x197x197xf32>
    %v822 = stablehlo.constant dense<0.0> : tensor<f32>
    %v823 = stablehlo.exponential %v821 : tensor<32x197x197xf32>
    %v824 = stablehlo.reduce(%v823 init: %v822) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v825 = stablehlo.broadcast_in_dim %v824, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v826 = stablehlo.divide %v823, %v825 : tensor<32x197x197xf32>
    %v827 = stablehlo.reshape %v826 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v828 = stablehlo.reshape %v827 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v829 = stablehlo.reshape %v807 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v830 = stablehlo.dot_general %v828, %v829, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v831 = stablehlo.reshape %v830 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v832 = stablehlo.reshape %v831 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v833 = stablehlo.constant dense<0.0> : tensor<f32>
    %v834 = stablehlo.pad %v832, %v833, low = [0, 0, 320], high = [0, 0, 384], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v835 = stablehlo.reshape %v834 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v836 = stablehlo.add %v798, %v835 : tensor<32x151296xf32>
    %v837 = stablehlo.reshape %v599 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v838 = stablehlo.slice %v837 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v839 = stablehlo.reshape %v838 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v840 = stablehlo.reshape %v604 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v841 = stablehlo.slice %v840 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v842 = stablehlo.reshape %v841 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v843 = stablehlo.reshape %v609 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v844 = stablehlo.slice %v843 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v845 = stablehlo.reshape %v844 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v846 = stablehlo.reshape %v842 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v847 = stablehlo.transpose %v846, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v848 = stablehlo.reshape %v847 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v849 = stablehlo.reshape %v839 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v850 = stablehlo.reshape %v848 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v851 = stablehlo.dot_general %v849, %v850, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v852 = stablehlo.reshape %v851 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v853 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v854 = stablehlo.multiply %v852, %v853 : tensor<32x38809xf32>
    %v855 = stablehlo.reshape %v854 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v856 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v857 = stablehlo.reduce(%v855 init: %v856) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v858 = stablehlo.broadcast_in_dim %v857, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v859 = stablehlo.subtract %v855, %v858 : tensor<32x197x197xf32>
    %v860 = stablehlo.constant dense<0.0> : tensor<f32>
    %v861 = stablehlo.exponential %v859 : tensor<32x197x197xf32>
    %v862 = stablehlo.reduce(%v861 init: %v860) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v863 = stablehlo.broadcast_in_dim %v862, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v864 = stablehlo.divide %v861, %v863 : tensor<32x197x197xf32>
    %v865 = stablehlo.reshape %v864 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v866 = stablehlo.reshape %v865 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v867 = stablehlo.reshape %v845 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v868 = stablehlo.dot_general %v866, %v867, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v869 = stablehlo.reshape %v868 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v870 = stablehlo.reshape %v869 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v871 = stablehlo.constant dense<0.0> : tensor<f32>
    %v872 = stablehlo.pad %v870, %v871, low = [0, 0, 384], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v873 = stablehlo.reshape %v872 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v874 = stablehlo.add %v836, %v873 : tensor<32x151296xf32>
    %v875 = stablehlo.reshape %v599 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v876 = stablehlo.slice %v875 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v877 = stablehlo.reshape %v876 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v878 = stablehlo.reshape %v604 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v879 = stablehlo.slice %v878 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v880 = stablehlo.reshape %v879 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v881 = stablehlo.reshape %v609 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v882 = stablehlo.slice %v881 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v883 = stablehlo.reshape %v882 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v884 = stablehlo.reshape %v880 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v885 = stablehlo.transpose %v884, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v886 = stablehlo.reshape %v885 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v887 = stablehlo.reshape %v877 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v888 = stablehlo.reshape %v886 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v889 = stablehlo.dot_general %v887, %v888, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v890 = stablehlo.reshape %v889 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v891 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v892 = stablehlo.multiply %v890, %v891 : tensor<32x38809xf32>
    %v893 = stablehlo.reshape %v892 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v894 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v895 = stablehlo.reduce(%v893 init: %v894) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v896 = stablehlo.broadcast_in_dim %v895, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v897 = stablehlo.subtract %v893, %v896 : tensor<32x197x197xf32>
    %v898 = stablehlo.constant dense<0.0> : tensor<f32>
    %v899 = stablehlo.exponential %v897 : tensor<32x197x197xf32>
    %v900 = stablehlo.reduce(%v899 init: %v898) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v901 = stablehlo.broadcast_in_dim %v900, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v902 = stablehlo.divide %v899, %v901 : tensor<32x197x197xf32>
    %v903 = stablehlo.reshape %v902 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v904 = stablehlo.reshape %v903 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v905 = stablehlo.reshape %v883 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v906 = stablehlo.dot_general %v904, %v905, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v907 = stablehlo.reshape %v906 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v908 = stablehlo.reshape %v907 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v909 = stablehlo.constant dense<0.0> : tensor<f32>
    %v910 = stablehlo.pad %v908, %v909, low = [0, 0, 448], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v911 = stablehlo.reshape %v910 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v912 = stablehlo.add %v874, %v911 : tensor<32x151296xf32>
    %v913 = stablehlo.reshape %v599 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v914 = stablehlo.slice %v913 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v915 = stablehlo.reshape %v914 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v916 = stablehlo.reshape %v604 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v917 = stablehlo.slice %v916 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v918 = stablehlo.reshape %v917 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v919 = stablehlo.reshape %v609 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v920 = stablehlo.slice %v919 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v921 = stablehlo.reshape %v920 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v922 = stablehlo.reshape %v918 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v923 = stablehlo.transpose %v922, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v924 = stablehlo.reshape %v923 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v925 = stablehlo.reshape %v915 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v926 = stablehlo.reshape %v924 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v927 = stablehlo.dot_general %v925, %v926, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v928 = stablehlo.reshape %v927 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v929 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v930 = stablehlo.multiply %v928, %v929 : tensor<32x38809xf32>
    %v931 = stablehlo.reshape %v930 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v932 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v933 = stablehlo.reduce(%v931 init: %v932) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v934 = stablehlo.broadcast_in_dim %v933, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v935 = stablehlo.subtract %v931, %v934 : tensor<32x197x197xf32>
    %v936 = stablehlo.constant dense<0.0> : tensor<f32>
    %v937 = stablehlo.exponential %v935 : tensor<32x197x197xf32>
    %v938 = stablehlo.reduce(%v937 init: %v936) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v939 = stablehlo.broadcast_in_dim %v938, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v940 = stablehlo.divide %v937, %v939 : tensor<32x197x197xf32>
    %v941 = stablehlo.reshape %v940 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v942 = stablehlo.reshape %v941 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v943 = stablehlo.reshape %v921 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v944 = stablehlo.dot_general %v942, %v943, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v945 = stablehlo.reshape %v944 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v946 = stablehlo.reshape %v945 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v947 = stablehlo.constant dense<0.0> : tensor<f32>
    %v948 = stablehlo.pad %v946, %v947, low = [0, 0, 512], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v949 = stablehlo.reshape %v948 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v950 = stablehlo.add %v912, %v949 : tensor<32x151296xf32>
    %v951 = stablehlo.reshape %v599 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v952 = stablehlo.slice %v951 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v953 = stablehlo.reshape %v952 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v954 = stablehlo.reshape %v604 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v955 = stablehlo.slice %v954 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v956 = stablehlo.reshape %v955 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v957 = stablehlo.reshape %v609 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v958 = stablehlo.slice %v957 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v959 = stablehlo.reshape %v958 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v960 = stablehlo.reshape %v956 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v961 = stablehlo.transpose %v960, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v962 = stablehlo.reshape %v961 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v963 = stablehlo.reshape %v953 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v964 = stablehlo.reshape %v962 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v965 = stablehlo.dot_general %v963, %v964, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v966 = stablehlo.reshape %v965 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v967 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v968 = stablehlo.multiply %v966, %v967 : tensor<32x38809xf32>
    %v969 = stablehlo.reshape %v968 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v970 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v971 = stablehlo.reduce(%v969 init: %v970) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v972 = stablehlo.broadcast_in_dim %v971, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v973 = stablehlo.subtract %v969, %v972 : tensor<32x197x197xf32>
    %v974 = stablehlo.constant dense<0.0> : tensor<f32>
    %v975 = stablehlo.exponential %v973 : tensor<32x197x197xf32>
    %v976 = stablehlo.reduce(%v975 init: %v974) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v977 = stablehlo.broadcast_in_dim %v976, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v978 = stablehlo.divide %v975, %v977 : tensor<32x197x197xf32>
    %v979 = stablehlo.reshape %v978 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v980 = stablehlo.reshape %v979 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v981 = stablehlo.reshape %v959 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v982 = stablehlo.dot_general %v980, %v981, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v983 = stablehlo.reshape %v982 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v984 = stablehlo.reshape %v983 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v985 = stablehlo.constant dense<0.0> : tensor<f32>
    %v986 = stablehlo.pad %v984, %v985, low = [0, 0, 576], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v987 = stablehlo.reshape %v986 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v988 = stablehlo.add %v950, %v987 : tensor<32x151296xf32>
    %v989 = stablehlo.reshape %v599 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v990 = stablehlo.slice %v989 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v991 = stablehlo.reshape %v990 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v992 = stablehlo.reshape %v604 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v993 = stablehlo.slice %v992 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v994 = stablehlo.reshape %v993 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v995 = stablehlo.reshape %v609 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v996 = stablehlo.slice %v995 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v997 = stablehlo.reshape %v996 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v998 = stablehlo.reshape %v994 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v999 = stablehlo.transpose %v998, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1000 = stablehlo.reshape %v999 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1001 = stablehlo.reshape %v991 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1002 = stablehlo.reshape %v1000 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1003 = stablehlo.dot_general %v1001, %v1002, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1004 = stablehlo.reshape %v1003 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1005 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1006 = stablehlo.multiply %v1004, %v1005 : tensor<32x38809xf32>
    %v1007 = stablehlo.reshape %v1006 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1008 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1009 = stablehlo.reduce(%v1007 init: %v1008) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1010 = stablehlo.broadcast_in_dim %v1009, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1011 = stablehlo.subtract %v1007, %v1010 : tensor<32x197x197xf32>
    %v1012 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1013 = stablehlo.exponential %v1011 : tensor<32x197x197xf32>
    %v1014 = stablehlo.reduce(%v1013 init: %v1012) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1015 = stablehlo.broadcast_in_dim %v1014, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1016 = stablehlo.divide %v1013, %v1015 : tensor<32x197x197xf32>
    %v1017 = stablehlo.reshape %v1016 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1018 = stablehlo.reshape %v1017 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1019 = stablehlo.reshape %v997 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1020 = stablehlo.dot_general %v1018, %v1019, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1021 = stablehlo.reshape %v1020 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1022 = stablehlo.reshape %v1021 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1023 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1024 = stablehlo.pad %v1022, %v1023, low = [0, 0, 640], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1025 = stablehlo.reshape %v1024 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1026 = stablehlo.add %v988, %v1025 : tensor<32x151296xf32>
    %v1027 = stablehlo.reshape %v599 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1028 = stablehlo.slice %v1027 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1029 = stablehlo.reshape %v1028 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1030 = stablehlo.reshape %v604 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1031 = stablehlo.slice %v1030 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1032 = stablehlo.reshape %v1031 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1033 = stablehlo.reshape %v609 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1034 = stablehlo.slice %v1033 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1035 = stablehlo.reshape %v1034 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1036 = stablehlo.reshape %v1032 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1037 = stablehlo.transpose %v1036, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1038 = stablehlo.reshape %v1037 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1039 = stablehlo.reshape %v1029 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1040 = stablehlo.reshape %v1038 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1041 = stablehlo.dot_general %v1039, %v1040, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1042 = stablehlo.reshape %v1041 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1043 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1044 = stablehlo.multiply %v1042, %v1043 : tensor<32x38809xf32>
    %v1045 = stablehlo.reshape %v1044 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1046 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1047 = stablehlo.reduce(%v1045 init: %v1046) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1048 = stablehlo.broadcast_in_dim %v1047, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1049 = stablehlo.subtract %v1045, %v1048 : tensor<32x197x197xf32>
    %v1050 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1051 = stablehlo.exponential %v1049 : tensor<32x197x197xf32>
    %v1052 = stablehlo.reduce(%v1051 init: %v1050) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1053 = stablehlo.broadcast_in_dim %v1052, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1054 = stablehlo.divide %v1051, %v1053 : tensor<32x197x197xf32>
    %v1055 = stablehlo.reshape %v1054 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1056 = stablehlo.reshape %v1055 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1057 = stablehlo.reshape %v1035 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1058 = stablehlo.dot_general %v1056, %v1057, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1059 = stablehlo.reshape %v1058 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1060 = stablehlo.reshape %v1059 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1061 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1062 = stablehlo.pad %v1060, %v1061, low = [0, 0, 704], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1063 = stablehlo.reshape %v1062 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1064 = stablehlo.add %v1026, %v1063 : tensor<32x151296xf32>
    %v1065 = stablehlo.reshape %v1064 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1066 = stablehlo.dot_general %v1065, %b1_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v1067 = stablehlo.broadcast_in_dim %b1_bo, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1068 = stablehlo.add %v1066, %v1067 : tensor<32x197x768xf32>
    %v1069 = stablehlo.reshape %v1068 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1070 = stablehlo.add %v566, %v1069 : tensor<32x151296xf32>
    %v1071 = stablehlo.reshape %v1070 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1072 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1073 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v1074 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v1075 = stablehlo.reduce(%v1071 init: %v1072) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1076 = stablehlo.broadcast_in_dim %v1075, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v1077 = stablehlo.divide %v1076, %v1073 : tensor<32x197x768xf32>
    %v1078 = stablehlo.subtract %v1071, %v1077 : tensor<32x197x768xf32>
    %v1079 = stablehlo.multiply %v1078, %v1078 : tensor<32x197x768xf32>
    %v1080 = stablehlo.reduce(%v1079 init: %v1072) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1081 = stablehlo.broadcast_in_dim %v1080, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v1082 = stablehlo.divide %v1081, %v1073 : tensor<32x197x768xf32>
    %v1083 = stablehlo.add %v1082, %v1074 : tensor<32x197x768xf32>
    %v1084 = stablehlo.rsqrt %v1083 : tensor<32x197x768xf32>
    %v1085 = stablehlo.multiply %v1078, %v1084 : tensor<32x197x768xf32>
    %v1086 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v1087 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v1088 = stablehlo.multiply %v1085, %v1086 : tensor<32x197x768xf32>
    %v1089 = stablehlo.add %v1088, %v1087 : tensor<32x197x768xf32>
    %v1090 = stablehlo.reshape %v1089 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1091 = stablehlo.reshape %v1090 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1092 = stablehlo.broadcast_in_dim %b1_g2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1093 = stablehlo.multiply %v1091, %v1092 : tensor<32x197x768xf32>
    %v1094 = stablehlo.reshape %v1093 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1095 = stablehlo.reshape %v1094 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1096 = stablehlo.broadcast_in_dim %b1_bt2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1097 = stablehlo.add %v1095, %v1096 : tensor<32x197x768xf32>
    %v1098 = stablehlo.reshape %v1097 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1099 = stablehlo.reshape %v1098 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1100 = stablehlo.dot_general %v1099, %b1_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x3072xf32>) -> tensor<32x197x3072xf32>
    %v1101 = stablehlo.broadcast_in_dim %b1_bfc1, dims = [2] : (tensor<3072xf32>) -> tensor<32x197x3072xf32>
    %v1102 = stablehlo.add %v1100, %v1101 : tensor<32x197x3072xf32>
    %v1103 = stablehlo.reshape %v1102 : (tensor<32x197x3072xf32>) -> tensor<32x605184xf32>
    %v1104 = stablehlo.multiply %v1103, %v1103 : tensor<32x605184xf32>
    %v1105 = stablehlo.multiply %v1104, %v1103 : tensor<32x605184xf32>
    %v1106 = stablehlo.constant dense<0.044715> : tensor<32x605184xf32>
    %v1107 = stablehlo.multiply %v1106, %v1105 : tensor<32x605184xf32>
    %v1108 = stablehlo.add %v1103, %v1107 : tensor<32x605184xf32>
    %v1109 = stablehlo.constant dense<0.7978845608028654> : tensor<32x605184xf32>
    %v1110 = stablehlo.multiply %v1109, %v1108 : tensor<32x605184xf32>
    %v1111 = stablehlo.tanh %v1110 : tensor<32x605184xf32>
    %v1112 = stablehlo.constant dense<1.0> : tensor<32x605184xf32>
    %v1113 = stablehlo.add %v1112, %v1111 : tensor<32x605184xf32>
    %v1114 = stablehlo.constant dense<0.5> : tensor<32x605184xf32>
    %v1115 = stablehlo.multiply %v1114, %v1103 : tensor<32x605184xf32>
    %v1116 = stablehlo.multiply %v1115, %v1113 : tensor<32x605184xf32>
    %v1117 = stablehlo.reshape %v1116 : (tensor<32x605184xf32>) -> tensor<32x197x3072xf32>
    %v1118 = stablehlo.dot_general %v1117, %b1_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x3072xf32>, tensor<3072x768xf32>) -> tensor<32x197x768xf32>
    %v1119 = stablehlo.broadcast_in_dim %b1_bfc2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1120 = stablehlo.add %v1118, %v1119 : tensor<32x197x768xf32>
    %v1121 = stablehlo.reshape %v1120 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1122 = stablehlo.add %v1070, %v1121 : tensor<32x151296xf32>
    %v1123 = stablehlo.reshape %v1122 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1124 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1125 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v1126 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v1127 = stablehlo.reduce(%v1123 init: %v1124) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1128 = stablehlo.broadcast_in_dim %v1127, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v1129 = stablehlo.divide %v1128, %v1125 : tensor<32x197x768xf32>
    %v1130 = stablehlo.subtract %v1123, %v1129 : tensor<32x197x768xf32>
    %v1131 = stablehlo.multiply %v1130, %v1130 : tensor<32x197x768xf32>
    %v1132 = stablehlo.reduce(%v1131 init: %v1124) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1133 = stablehlo.broadcast_in_dim %v1132, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v1134 = stablehlo.divide %v1133, %v1125 : tensor<32x197x768xf32>
    %v1135 = stablehlo.add %v1134, %v1126 : tensor<32x197x768xf32>
    %v1136 = stablehlo.rsqrt %v1135 : tensor<32x197x768xf32>
    %v1137 = stablehlo.multiply %v1130, %v1136 : tensor<32x197x768xf32>
    %v1138 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v1139 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v1140 = stablehlo.multiply %v1137, %v1138 : tensor<32x197x768xf32>
    %v1141 = stablehlo.add %v1140, %v1139 : tensor<32x197x768xf32>
    %v1142 = stablehlo.reshape %v1141 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1143 = stablehlo.reshape %v1142 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1144 = stablehlo.broadcast_in_dim %b2_g1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1145 = stablehlo.multiply %v1143, %v1144 : tensor<32x197x768xf32>
    %v1146 = stablehlo.reshape %v1145 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1147 = stablehlo.reshape %v1146 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1148 = stablehlo.broadcast_in_dim %b2_bt1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1149 = stablehlo.add %v1147, %v1148 : tensor<32x197x768xf32>
    %v1150 = stablehlo.reshape %v1149 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1151 = stablehlo.reshape %v1150 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1152 = stablehlo.dot_general %v1151, %b2_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v1153 = stablehlo.broadcast_in_dim %b2_bq, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1154 = stablehlo.add %v1152, %v1153 : tensor<32x197x768xf32>
    %v1155 = stablehlo.reshape %v1154 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1156 = stablehlo.reshape %v1150 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1157 = stablehlo.dot_general %v1156, %b2_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v1158 = stablehlo.broadcast_in_dim %b2_bk, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1159 = stablehlo.add %v1157, %v1158 : tensor<32x197x768xf32>
    %v1160 = stablehlo.reshape %v1159 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1161 = stablehlo.reshape %v1150 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1162 = stablehlo.dot_general %v1161, %b2_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v1163 = stablehlo.broadcast_in_dim %b2_bv, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1164 = stablehlo.add %v1162, %v1163 : tensor<32x197x768xf32>
    %v1165 = stablehlo.reshape %v1164 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1166 = stablehlo.reshape %v1155 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1167 = stablehlo.slice %v1166 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1168 = stablehlo.reshape %v1167 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1169 = stablehlo.reshape %v1160 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1170 = stablehlo.slice %v1169 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1171 = stablehlo.reshape %v1170 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1172 = stablehlo.reshape %v1165 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1173 = stablehlo.slice %v1172 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1174 = stablehlo.reshape %v1173 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1175 = stablehlo.reshape %v1171 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1176 = stablehlo.transpose %v1175, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1177 = stablehlo.reshape %v1176 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1178 = stablehlo.reshape %v1168 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1179 = stablehlo.reshape %v1177 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1180 = stablehlo.dot_general %v1178, %v1179, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1181 = stablehlo.reshape %v1180 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1182 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1183 = stablehlo.multiply %v1181, %v1182 : tensor<32x38809xf32>
    %v1184 = stablehlo.reshape %v1183 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1185 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1186 = stablehlo.reduce(%v1184 init: %v1185) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1187 = stablehlo.broadcast_in_dim %v1186, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1188 = stablehlo.subtract %v1184, %v1187 : tensor<32x197x197xf32>
    %v1189 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1190 = stablehlo.exponential %v1188 : tensor<32x197x197xf32>
    %v1191 = stablehlo.reduce(%v1190 init: %v1189) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1192 = stablehlo.broadcast_in_dim %v1191, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1193 = stablehlo.divide %v1190, %v1192 : tensor<32x197x197xf32>
    %v1194 = stablehlo.reshape %v1193 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1195 = stablehlo.reshape %v1194 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1196 = stablehlo.reshape %v1174 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1197 = stablehlo.dot_general %v1195, %v1196, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1198 = stablehlo.reshape %v1197 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1199 = stablehlo.reshape %v1198 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1200 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1201 = stablehlo.pad %v1199, %v1200, low = [0, 0, 0], high = [0, 0, 704], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1202 = stablehlo.reshape %v1201 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1203 = stablehlo.reshape %v1155 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1204 = stablehlo.slice %v1203 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1205 = stablehlo.reshape %v1204 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1206 = stablehlo.reshape %v1160 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1207 = stablehlo.slice %v1206 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1208 = stablehlo.reshape %v1207 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1209 = stablehlo.reshape %v1165 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1210 = stablehlo.slice %v1209 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1211 = stablehlo.reshape %v1210 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1212 = stablehlo.reshape %v1208 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1213 = stablehlo.transpose %v1212, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1214 = stablehlo.reshape %v1213 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1215 = stablehlo.reshape %v1205 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1216 = stablehlo.reshape %v1214 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1217 = stablehlo.dot_general %v1215, %v1216, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1218 = stablehlo.reshape %v1217 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1219 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1220 = stablehlo.multiply %v1218, %v1219 : tensor<32x38809xf32>
    %v1221 = stablehlo.reshape %v1220 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1222 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1223 = stablehlo.reduce(%v1221 init: %v1222) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1224 = stablehlo.broadcast_in_dim %v1223, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1225 = stablehlo.subtract %v1221, %v1224 : tensor<32x197x197xf32>
    %v1226 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1227 = stablehlo.exponential %v1225 : tensor<32x197x197xf32>
    %v1228 = stablehlo.reduce(%v1227 init: %v1226) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1229 = stablehlo.broadcast_in_dim %v1228, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1230 = stablehlo.divide %v1227, %v1229 : tensor<32x197x197xf32>
    %v1231 = stablehlo.reshape %v1230 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1232 = stablehlo.reshape %v1231 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1233 = stablehlo.reshape %v1211 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1234 = stablehlo.dot_general %v1232, %v1233, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1235 = stablehlo.reshape %v1234 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1236 = stablehlo.reshape %v1235 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1237 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1238 = stablehlo.pad %v1236, %v1237, low = [0, 0, 64], high = [0, 0, 640], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1239 = stablehlo.reshape %v1238 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1240 = stablehlo.add %v1202, %v1239 : tensor<32x151296xf32>
    %v1241 = stablehlo.reshape %v1155 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1242 = stablehlo.slice %v1241 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1243 = stablehlo.reshape %v1242 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1244 = stablehlo.reshape %v1160 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1245 = stablehlo.slice %v1244 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1246 = stablehlo.reshape %v1245 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1247 = stablehlo.reshape %v1165 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1248 = stablehlo.slice %v1247 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1249 = stablehlo.reshape %v1248 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1250 = stablehlo.reshape %v1246 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1251 = stablehlo.transpose %v1250, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1252 = stablehlo.reshape %v1251 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1253 = stablehlo.reshape %v1243 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1254 = stablehlo.reshape %v1252 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1255 = stablehlo.dot_general %v1253, %v1254, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1256 = stablehlo.reshape %v1255 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1257 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1258 = stablehlo.multiply %v1256, %v1257 : tensor<32x38809xf32>
    %v1259 = stablehlo.reshape %v1258 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1260 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1261 = stablehlo.reduce(%v1259 init: %v1260) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1262 = stablehlo.broadcast_in_dim %v1261, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1263 = stablehlo.subtract %v1259, %v1262 : tensor<32x197x197xf32>
    %v1264 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1265 = stablehlo.exponential %v1263 : tensor<32x197x197xf32>
    %v1266 = stablehlo.reduce(%v1265 init: %v1264) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1267 = stablehlo.broadcast_in_dim %v1266, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1268 = stablehlo.divide %v1265, %v1267 : tensor<32x197x197xf32>
    %v1269 = stablehlo.reshape %v1268 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1270 = stablehlo.reshape %v1269 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1271 = stablehlo.reshape %v1249 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1272 = stablehlo.dot_general %v1270, %v1271, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1273 = stablehlo.reshape %v1272 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1274 = stablehlo.reshape %v1273 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1275 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1276 = stablehlo.pad %v1274, %v1275, low = [0, 0, 128], high = [0, 0, 576], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1277 = stablehlo.reshape %v1276 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1278 = stablehlo.add %v1240, %v1277 : tensor<32x151296xf32>
    %v1279 = stablehlo.reshape %v1155 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1280 = stablehlo.slice %v1279 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1281 = stablehlo.reshape %v1280 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1282 = stablehlo.reshape %v1160 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1283 = stablehlo.slice %v1282 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1284 = stablehlo.reshape %v1283 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1285 = stablehlo.reshape %v1165 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1286 = stablehlo.slice %v1285 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1287 = stablehlo.reshape %v1286 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1288 = stablehlo.reshape %v1284 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1289 = stablehlo.transpose %v1288, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1290 = stablehlo.reshape %v1289 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1291 = stablehlo.reshape %v1281 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1292 = stablehlo.reshape %v1290 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1293 = stablehlo.dot_general %v1291, %v1292, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1294 = stablehlo.reshape %v1293 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1295 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1296 = stablehlo.multiply %v1294, %v1295 : tensor<32x38809xf32>
    %v1297 = stablehlo.reshape %v1296 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1298 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1299 = stablehlo.reduce(%v1297 init: %v1298) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1300 = stablehlo.broadcast_in_dim %v1299, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1301 = stablehlo.subtract %v1297, %v1300 : tensor<32x197x197xf32>
    %v1302 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1303 = stablehlo.exponential %v1301 : tensor<32x197x197xf32>
    %v1304 = stablehlo.reduce(%v1303 init: %v1302) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1305 = stablehlo.broadcast_in_dim %v1304, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1306 = stablehlo.divide %v1303, %v1305 : tensor<32x197x197xf32>
    %v1307 = stablehlo.reshape %v1306 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1308 = stablehlo.reshape %v1307 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1309 = stablehlo.reshape %v1287 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1310 = stablehlo.dot_general %v1308, %v1309, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1311 = stablehlo.reshape %v1310 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1312 = stablehlo.reshape %v1311 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1313 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1314 = stablehlo.pad %v1312, %v1313, low = [0, 0, 192], high = [0, 0, 512], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1315 = stablehlo.reshape %v1314 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1316 = stablehlo.add %v1278, %v1315 : tensor<32x151296xf32>
    %v1317 = stablehlo.reshape %v1155 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1318 = stablehlo.slice %v1317 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1319 = stablehlo.reshape %v1318 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1320 = stablehlo.reshape %v1160 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1321 = stablehlo.slice %v1320 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1322 = stablehlo.reshape %v1321 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1323 = stablehlo.reshape %v1165 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1324 = stablehlo.slice %v1323 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1325 = stablehlo.reshape %v1324 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1326 = stablehlo.reshape %v1322 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1327 = stablehlo.transpose %v1326, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1328 = stablehlo.reshape %v1327 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1329 = stablehlo.reshape %v1319 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1330 = stablehlo.reshape %v1328 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1331 = stablehlo.dot_general %v1329, %v1330, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1332 = stablehlo.reshape %v1331 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1333 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1334 = stablehlo.multiply %v1332, %v1333 : tensor<32x38809xf32>
    %v1335 = stablehlo.reshape %v1334 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1336 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1337 = stablehlo.reduce(%v1335 init: %v1336) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1338 = stablehlo.broadcast_in_dim %v1337, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1339 = stablehlo.subtract %v1335, %v1338 : tensor<32x197x197xf32>
    %v1340 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1341 = stablehlo.exponential %v1339 : tensor<32x197x197xf32>
    %v1342 = stablehlo.reduce(%v1341 init: %v1340) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1343 = stablehlo.broadcast_in_dim %v1342, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1344 = stablehlo.divide %v1341, %v1343 : tensor<32x197x197xf32>
    %v1345 = stablehlo.reshape %v1344 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1346 = stablehlo.reshape %v1345 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1347 = stablehlo.reshape %v1325 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1348 = stablehlo.dot_general %v1346, %v1347, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1349 = stablehlo.reshape %v1348 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1350 = stablehlo.reshape %v1349 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1351 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1352 = stablehlo.pad %v1350, %v1351, low = [0, 0, 256], high = [0, 0, 448], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1353 = stablehlo.reshape %v1352 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1354 = stablehlo.add %v1316, %v1353 : tensor<32x151296xf32>
    %v1355 = stablehlo.reshape %v1155 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1356 = stablehlo.slice %v1355 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1357 = stablehlo.reshape %v1356 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1358 = stablehlo.reshape %v1160 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1359 = stablehlo.slice %v1358 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1360 = stablehlo.reshape %v1359 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1361 = stablehlo.reshape %v1165 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1362 = stablehlo.slice %v1361 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1363 = stablehlo.reshape %v1362 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1364 = stablehlo.reshape %v1360 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1365 = stablehlo.transpose %v1364, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1366 = stablehlo.reshape %v1365 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1367 = stablehlo.reshape %v1357 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1368 = stablehlo.reshape %v1366 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1369 = stablehlo.dot_general %v1367, %v1368, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1370 = stablehlo.reshape %v1369 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1371 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1372 = stablehlo.multiply %v1370, %v1371 : tensor<32x38809xf32>
    %v1373 = stablehlo.reshape %v1372 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1374 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1375 = stablehlo.reduce(%v1373 init: %v1374) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1376 = stablehlo.broadcast_in_dim %v1375, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1377 = stablehlo.subtract %v1373, %v1376 : tensor<32x197x197xf32>
    %v1378 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1379 = stablehlo.exponential %v1377 : tensor<32x197x197xf32>
    %v1380 = stablehlo.reduce(%v1379 init: %v1378) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1381 = stablehlo.broadcast_in_dim %v1380, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1382 = stablehlo.divide %v1379, %v1381 : tensor<32x197x197xf32>
    %v1383 = stablehlo.reshape %v1382 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1384 = stablehlo.reshape %v1383 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1385 = stablehlo.reshape %v1363 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1386 = stablehlo.dot_general %v1384, %v1385, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1387 = stablehlo.reshape %v1386 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1388 = stablehlo.reshape %v1387 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1389 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1390 = stablehlo.pad %v1388, %v1389, low = [0, 0, 320], high = [0, 0, 384], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1391 = stablehlo.reshape %v1390 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1392 = stablehlo.add %v1354, %v1391 : tensor<32x151296xf32>
    %v1393 = stablehlo.reshape %v1155 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1394 = stablehlo.slice %v1393 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1395 = stablehlo.reshape %v1394 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1396 = stablehlo.reshape %v1160 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1397 = stablehlo.slice %v1396 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1398 = stablehlo.reshape %v1397 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1399 = stablehlo.reshape %v1165 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1400 = stablehlo.slice %v1399 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1401 = stablehlo.reshape %v1400 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1402 = stablehlo.reshape %v1398 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1403 = stablehlo.transpose %v1402, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1404 = stablehlo.reshape %v1403 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1405 = stablehlo.reshape %v1395 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1406 = stablehlo.reshape %v1404 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1407 = stablehlo.dot_general %v1405, %v1406, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1408 = stablehlo.reshape %v1407 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1409 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1410 = stablehlo.multiply %v1408, %v1409 : tensor<32x38809xf32>
    %v1411 = stablehlo.reshape %v1410 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1412 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1413 = stablehlo.reduce(%v1411 init: %v1412) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1414 = stablehlo.broadcast_in_dim %v1413, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1415 = stablehlo.subtract %v1411, %v1414 : tensor<32x197x197xf32>
    %v1416 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1417 = stablehlo.exponential %v1415 : tensor<32x197x197xf32>
    %v1418 = stablehlo.reduce(%v1417 init: %v1416) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1419 = stablehlo.broadcast_in_dim %v1418, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1420 = stablehlo.divide %v1417, %v1419 : tensor<32x197x197xf32>
    %v1421 = stablehlo.reshape %v1420 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1422 = stablehlo.reshape %v1421 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1423 = stablehlo.reshape %v1401 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1424 = stablehlo.dot_general %v1422, %v1423, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1425 = stablehlo.reshape %v1424 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1426 = stablehlo.reshape %v1425 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1427 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1428 = stablehlo.pad %v1426, %v1427, low = [0, 0, 384], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1429 = stablehlo.reshape %v1428 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1430 = stablehlo.add %v1392, %v1429 : tensor<32x151296xf32>
    %v1431 = stablehlo.reshape %v1155 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1432 = stablehlo.slice %v1431 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1433 = stablehlo.reshape %v1432 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1434 = stablehlo.reshape %v1160 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1435 = stablehlo.slice %v1434 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1436 = stablehlo.reshape %v1435 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1437 = stablehlo.reshape %v1165 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1438 = stablehlo.slice %v1437 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1439 = stablehlo.reshape %v1438 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1440 = stablehlo.reshape %v1436 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1441 = stablehlo.transpose %v1440, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1442 = stablehlo.reshape %v1441 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1443 = stablehlo.reshape %v1433 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1444 = stablehlo.reshape %v1442 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1445 = stablehlo.dot_general %v1443, %v1444, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1446 = stablehlo.reshape %v1445 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1447 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1448 = stablehlo.multiply %v1446, %v1447 : tensor<32x38809xf32>
    %v1449 = stablehlo.reshape %v1448 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1450 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1451 = stablehlo.reduce(%v1449 init: %v1450) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1452 = stablehlo.broadcast_in_dim %v1451, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1453 = stablehlo.subtract %v1449, %v1452 : tensor<32x197x197xf32>
    %v1454 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1455 = stablehlo.exponential %v1453 : tensor<32x197x197xf32>
    %v1456 = stablehlo.reduce(%v1455 init: %v1454) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1457 = stablehlo.broadcast_in_dim %v1456, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1458 = stablehlo.divide %v1455, %v1457 : tensor<32x197x197xf32>
    %v1459 = stablehlo.reshape %v1458 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1460 = stablehlo.reshape %v1459 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1461 = stablehlo.reshape %v1439 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1462 = stablehlo.dot_general %v1460, %v1461, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1463 = stablehlo.reshape %v1462 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1464 = stablehlo.reshape %v1463 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1465 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1466 = stablehlo.pad %v1464, %v1465, low = [0, 0, 448], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1467 = stablehlo.reshape %v1466 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1468 = stablehlo.add %v1430, %v1467 : tensor<32x151296xf32>
    %v1469 = stablehlo.reshape %v1155 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1470 = stablehlo.slice %v1469 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1471 = stablehlo.reshape %v1470 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1472 = stablehlo.reshape %v1160 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1473 = stablehlo.slice %v1472 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1474 = stablehlo.reshape %v1473 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1475 = stablehlo.reshape %v1165 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1476 = stablehlo.slice %v1475 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1477 = stablehlo.reshape %v1476 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1478 = stablehlo.reshape %v1474 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1479 = stablehlo.transpose %v1478, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1480 = stablehlo.reshape %v1479 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1481 = stablehlo.reshape %v1471 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1482 = stablehlo.reshape %v1480 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1483 = stablehlo.dot_general %v1481, %v1482, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1484 = stablehlo.reshape %v1483 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1485 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1486 = stablehlo.multiply %v1484, %v1485 : tensor<32x38809xf32>
    %v1487 = stablehlo.reshape %v1486 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1488 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1489 = stablehlo.reduce(%v1487 init: %v1488) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1490 = stablehlo.broadcast_in_dim %v1489, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1491 = stablehlo.subtract %v1487, %v1490 : tensor<32x197x197xf32>
    %v1492 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1493 = stablehlo.exponential %v1491 : tensor<32x197x197xf32>
    %v1494 = stablehlo.reduce(%v1493 init: %v1492) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1495 = stablehlo.broadcast_in_dim %v1494, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1496 = stablehlo.divide %v1493, %v1495 : tensor<32x197x197xf32>
    %v1497 = stablehlo.reshape %v1496 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1498 = stablehlo.reshape %v1497 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1499 = stablehlo.reshape %v1477 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1500 = stablehlo.dot_general %v1498, %v1499, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1501 = stablehlo.reshape %v1500 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1502 = stablehlo.reshape %v1501 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1503 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1504 = stablehlo.pad %v1502, %v1503, low = [0, 0, 512], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1505 = stablehlo.reshape %v1504 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1506 = stablehlo.add %v1468, %v1505 : tensor<32x151296xf32>
    %v1507 = stablehlo.reshape %v1155 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1508 = stablehlo.slice %v1507 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1509 = stablehlo.reshape %v1508 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1510 = stablehlo.reshape %v1160 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1511 = stablehlo.slice %v1510 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1512 = stablehlo.reshape %v1511 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1513 = stablehlo.reshape %v1165 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1514 = stablehlo.slice %v1513 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1515 = stablehlo.reshape %v1514 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1516 = stablehlo.reshape %v1512 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1517 = stablehlo.transpose %v1516, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1518 = stablehlo.reshape %v1517 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1519 = stablehlo.reshape %v1509 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1520 = stablehlo.reshape %v1518 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1521 = stablehlo.dot_general %v1519, %v1520, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1522 = stablehlo.reshape %v1521 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1523 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1524 = stablehlo.multiply %v1522, %v1523 : tensor<32x38809xf32>
    %v1525 = stablehlo.reshape %v1524 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1526 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1527 = stablehlo.reduce(%v1525 init: %v1526) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1528 = stablehlo.broadcast_in_dim %v1527, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1529 = stablehlo.subtract %v1525, %v1528 : tensor<32x197x197xf32>
    %v1530 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1531 = stablehlo.exponential %v1529 : tensor<32x197x197xf32>
    %v1532 = stablehlo.reduce(%v1531 init: %v1530) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1533 = stablehlo.broadcast_in_dim %v1532, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1534 = stablehlo.divide %v1531, %v1533 : tensor<32x197x197xf32>
    %v1535 = stablehlo.reshape %v1534 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1536 = stablehlo.reshape %v1535 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1537 = stablehlo.reshape %v1515 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1538 = stablehlo.dot_general %v1536, %v1537, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1539 = stablehlo.reshape %v1538 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1540 = stablehlo.reshape %v1539 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1541 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1542 = stablehlo.pad %v1540, %v1541, low = [0, 0, 576], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1543 = stablehlo.reshape %v1542 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1544 = stablehlo.add %v1506, %v1543 : tensor<32x151296xf32>
    %v1545 = stablehlo.reshape %v1155 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1546 = stablehlo.slice %v1545 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1547 = stablehlo.reshape %v1546 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1548 = stablehlo.reshape %v1160 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1549 = stablehlo.slice %v1548 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1550 = stablehlo.reshape %v1549 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1551 = stablehlo.reshape %v1165 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1552 = stablehlo.slice %v1551 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1553 = stablehlo.reshape %v1552 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1554 = stablehlo.reshape %v1550 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1555 = stablehlo.transpose %v1554, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1556 = stablehlo.reshape %v1555 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1557 = stablehlo.reshape %v1547 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1558 = stablehlo.reshape %v1556 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1559 = stablehlo.dot_general %v1557, %v1558, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1560 = stablehlo.reshape %v1559 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1561 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1562 = stablehlo.multiply %v1560, %v1561 : tensor<32x38809xf32>
    %v1563 = stablehlo.reshape %v1562 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1564 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1565 = stablehlo.reduce(%v1563 init: %v1564) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1566 = stablehlo.broadcast_in_dim %v1565, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1567 = stablehlo.subtract %v1563, %v1566 : tensor<32x197x197xf32>
    %v1568 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1569 = stablehlo.exponential %v1567 : tensor<32x197x197xf32>
    %v1570 = stablehlo.reduce(%v1569 init: %v1568) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1571 = stablehlo.broadcast_in_dim %v1570, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1572 = stablehlo.divide %v1569, %v1571 : tensor<32x197x197xf32>
    %v1573 = stablehlo.reshape %v1572 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1574 = stablehlo.reshape %v1573 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1575 = stablehlo.reshape %v1553 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1576 = stablehlo.dot_general %v1574, %v1575, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1577 = stablehlo.reshape %v1576 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1578 = stablehlo.reshape %v1577 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1579 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1580 = stablehlo.pad %v1578, %v1579, low = [0, 0, 640], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1581 = stablehlo.reshape %v1580 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1582 = stablehlo.add %v1544, %v1581 : tensor<32x151296xf32>
    %v1583 = stablehlo.reshape %v1155 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1584 = stablehlo.slice %v1583 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1585 = stablehlo.reshape %v1584 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1586 = stablehlo.reshape %v1160 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1587 = stablehlo.slice %v1586 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1588 = stablehlo.reshape %v1587 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1589 = stablehlo.reshape %v1165 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1590 = stablehlo.slice %v1589 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1591 = stablehlo.reshape %v1590 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1592 = stablehlo.reshape %v1588 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1593 = stablehlo.transpose %v1592, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1594 = stablehlo.reshape %v1593 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1595 = stablehlo.reshape %v1585 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1596 = stablehlo.reshape %v1594 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1597 = stablehlo.dot_general %v1595, %v1596, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1598 = stablehlo.reshape %v1597 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1599 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1600 = stablehlo.multiply %v1598, %v1599 : tensor<32x38809xf32>
    %v1601 = stablehlo.reshape %v1600 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1602 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1603 = stablehlo.reduce(%v1601 init: %v1602) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1604 = stablehlo.broadcast_in_dim %v1603, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1605 = stablehlo.subtract %v1601, %v1604 : tensor<32x197x197xf32>
    %v1606 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1607 = stablehlo.exponential %v1605 : tensor<32x197x197xf32>
    %v1608 = stablehlo.reduce(%v1607 init: %v1606) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1609 = stablehlo.broadcast_in_dim %v1608, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1610 = stablehlo.divide %v1607, %v1609 : tensor<32x197x197xf32>
    %v1611 = stablehlo.reshape %v1610 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1612 = stablehlo.reshape %v1611 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1613 = stablehlo.reshape %v1591 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1614 = stablehlo.dot_general %v1612, %v1613, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1615 = stablehlo.reshape %v1614 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1616 = stablehlo.reshape %v1615 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1617 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1618 = stablehlo.pad %v1616, %v1617, low = [0, 0, 704], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1619 = stablehlo.reshape %v1618 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1620 = stablehlo.add %v1582, %v1619 : tensor<32x151296xf32>
    %v1621 = stablehlo.reshape %v1620 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1622 = stablehlo.dot_general %v1621, %b2_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v1623 = stablehlo.broadcast_in_dim %b2_bo, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1624 = stablehlo.add %v1622, %v1623 : tensor<32x197x768xf32>
    %v1625 = stablehlo.reshape %v1624 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1626 = stablehlo.add %v1122, %v1625 : tensor<32x151296xf32>
    %v1627 = stablehlo.reshape %v1626 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1628 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1629 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v1630 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v1631 = stablehlo.reduce(%v1627 init: %v1628) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1632 = stablehlo.broadcast_in_dim %v1631, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v1633 = stablehlo.divide %v1632, %v1629 : tensor<32x197x768xf32>
    %v1634 = stablehlo.subtract %v1627, %v1633 : tensor<32x197x768xf32>
    %v1635 = stablehlo.multiply %v1634, %v1634 : tensor<32x197x768xf32>
    %v1636 = stablehlo.reduce(%v1635 init: %v1628) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1637 = stablehlo.broadcast_in_dim %v1636, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v1638 = stablehlo.divide %v1637, %v1629 : tensor<32x197x768xf32>
    %v1639 = stablehlo.add %v1638, %v1630 : tensor<32x197x768xf32>
    %v1640 = stablehlo.rsqrt %v1639 : tensor<32x197x768xf32>
    %v1641 = stablehlo.multiply %v1634, %v1640 : tensor<32x197x768xf32>
    %v1642 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v1643 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v1644 = stablehlo.multiply %v1641, %v1642 : tensor<32x197x768xf32>
    %v1645 = stablehlo.add %v1644, %v1643 : tensor<32x197x768xf32>
    %v1646 = stablehlo.reshape %v1645 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1647 = stablehlo.reshape %v1646 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1648 = stablehlo.broadcast_in_dim %b2_g2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1649 = stablehlo.multiply %v1647, %v1648 : tensor<32x197x768xf32>
    %v1650 = stablehlo.reshape %v1649 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1651 = stablehlo.reshape %v1650 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1652 = stablehlo.broadcast_in_dim %b2_bt2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1653 = stablehlo.add %v1651, %v1652 : tensor<32x197x768xf32>
    %v1654 = stablehlo.reshape %v1653 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1655 = stablehlo.reshape %v1654 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1656 = stablehlo.dot_general %v1655, %b2_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x3072xf32>) -> tensor<32x197x3072xf32>
    %v1657 = stablehlo.broadcast_in_dim %b2_bfc1, dims = [2] : (tensor<3072xf32>) -> tensor<32x197x3072xf32>
    %v1658 = stablehlo.add %v1656, %v1657 : tensor<32x197x3072xf32>
    %v1659 = stablehlo.reshape %v1658 : (tensor<32x197x3072xf32>) -> tensor<32x605184xf32>
    %v1660 = stablehlo.multiply %v1659, %v1659 : tensor<32x605184xf32>
    %v1661 = stablehlo.multiply %v1660, %v1659 : tensor<32x605184xf32>
    %v1662 = stablehlo.constant dense<0.044715> : tensor<32x605184xf32>
    %v1663 = stablehlo.multiply %v1662, %v1661 : tensor<32x605184xf32>
    %v1664 = stablehlo.add %v1659, %v1663 : tensor<32x605184xf32>
    %v1665 = stablehlo.constant dense<0.7978845608028654> : tensor<32x605184xf32>
    %v1666 = stablehlo.multiply %v1665, %v1664 : tensor<32x605184xf32>
    %v1667 = stablehlo.tanh %v1666 : tensor<32x605184xf32>
    %v1668 = stablehlo.constant dense<1.0> : tensor<32x605184xf32>
    %v1669 = stablehlo.add %v1668, %v1667 : tensor<32x605184xf32>
    %v1670 = stablehlo.constant dense<0.5> : tensor<32x605184xf32>
    %v1671 = stablehlo.multiply %v1670, %v1659 : tensor<32x605184xf32>
    %v1672 = stablehlo.multiply %v1671, %v1669 : tensor<32x605184xf32>
    %v1673 = stablehlo.reshape %v1672 : (tensor<32x605184xf32>) -> tensor<32x197x3072xf32>
    %v1674 = stablehlo.dot_general %v1673, %b2_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x3072xf32>, tensor<3072x768xf32>) -> tensor<32x197x768xf32>
    %v1675 = stablehlo.broadcast_in_dim %b2_bfc2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1676 = stablehlo.add %v1674, %v1675 : tensor<32x197x768xf32>
    %v1677 = stablehlo.reshape %v1676 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1678 = stablehlo.add %v1626, %v1677 : tensor<32x151296xf32>
    %v1679 = stablehlo.reshape %v1678 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1680 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1681 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v1682 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v1683 = stablehlo.reduce(%v1679 init: %v1680) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1684 = stablehlo.broadcast_in_dim %v1683, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v1685 = stablehlo.divide %v1684, %v1681 : tensor<32x197x768xf32>
    %v1686 = stablehlo.subtract %v1679, %v1685 : tensor<32x197x768xf32>
    %v1687 = stablehlo.multiply %v1686, %v1686 : tensor<32x197x768xf32>
    %v1688 = stablehlo.reduce(%v1687 init: %v1680) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1689 = stablehlo.broadcast_in_dim %v1688, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v1690 = stablehlo.divide %v1689, %v1681 : tensor<32x197x768xf32>
    %v1691 = stablehlo.add %v1690, %v1682 : tensor<32x197x768xf32>
    %v1692 = stablehlo.rsqrt %v1691 : tensor<32x197x768xf32>
    %v1693 = stablehlo.multiply %v1686, %v1692 : tensor<32x197x768xf32>
    %v1694 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v1695 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v1696 = stablehlo.multiply %v1693, %v1694 : tensor<32x197x768xf32>
    %v1697 = stablehlo.add %v1696, %v1695 : tensor<32x197x768xf32>
    %v1698 = stablehlo.reshape %v1697 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1699 = stablehlo.reshape %v1698 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1700 = stablehlo.broadcast_in_dim %b3_g1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1701 = stablehlo.multiply %v1699, %v1700 : tensor<32x197x768xf32>
    %v1702 = stablehlo.reshape %v1701 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1703 = stablehlo.reshape %v1702 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1704 = stablehlo.broadcast_in_dim %b3_bt1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1705 = stablehlo.add %v1703, %v1704 : tensor<32x197x768xf32>
    %v1706 = stablehlo.reshape %v1705 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1707 = stablehlo.reshape %v1706 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1708 = stablehlo.dot_general %v1707, %b3_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v1709 = stablehlo.broadcast_in_dim %b3_bq, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1710 = stablehlo.add %v1708, %v1709 : tensor<32x197x768xf32>
    %v1711 = stablehlo.reshape %v1710 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1712 = stablehlo.reshape %v1706 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1713 = stablehlo.dot_general %v1712, %b3_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v1714 = stablehlo.broadcast_in_dim %b3_bk, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1715 = stablehlo.add %v1713, %v1714 : tensor<32x197x768xf32>
    %v1716 = stablehlo.reshape %v1715 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1717 = stablehlo.reshape %v1706 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1718 = stablehlo.dot_general %v1717, %b3_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v1719 = stablehlo.broadcast_in_dim %b3_bv, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v1720 = stablehlo.add %v1718, %v1719 : tensor<32x197x768xf32>
    %v1721 = stablehlo.reshape %v1720 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1722 = stablehlo.reshape %v1711 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1723 = stablehlo.slice %v1722 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1724 = stablehlo.reshape %v1723 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1725 = stablehlo.reshape %v1716 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1726 = stablehlo.slice %v1725 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1727 = stablehlo.reshape %v1726 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1728 = stablehlo.reshape %v1721 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1729 = stablehlo.slice %v1728 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1730 = stablehlo.reshape %v1729 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1731 = stablehlo.reshape %v1727 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1732 = stablehlo.transpose %v1731, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1733 = stablehlo.reshape %v1732 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1734 = stablehlo.reshape %v1724 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1735 = stablehlo.reshape %v1733 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1736 = stablehlo.dot_general %v1734, %v1735, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1737 = stablehlo.reshape %v1736 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1738 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1739 = stablehlo.multiply %v1737, %v1738 : tensor<32x38809xf32>
    %v1740 = stablehlo.reshape %v1739 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1741 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1742 = stablehlo.reduce(%v1740 init: %v1741) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1743 = stablehlo.broadcast_in_dim %v1742, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1744 = stablehlo.subtract %v1740, %v1743 : tensor<32x197x197xf32>
    %v1745 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1746 = stablehlo.exponential %v1744 : tensor<32x197x197xf32>
    %v1747 = stablehlo.reduce(%v1746 init: %v1745) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1748 = stablehlo.broadcast_in_dim %v1747, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1749 = stablehlo.divide %v1746, %v1748 : tensor<32x197x197xf32>
    %v1750 = stablehlo.reshape %v1749 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1751 = stablehlo.reshape %v1750 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1752 = stablehlo.reshape %v1730 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1753 = stablehlo.dot_general %v1751, %v1752, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1754 = stablehlo.reshape %v1753 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1755 = stablehlo.reshape %v1754 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1756 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1757 = stablehlo.pad %v1755, %v1756, low = [0, 0, 0], high = [0, 0, 704], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1758 = stablehlo.reshape %v1757 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1759 = stablehlo.reshape %v1711 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1760 = stablehlo.slice %v1759 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1761 = stablehlo.reshape %v1760 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1762 = stablehlo.reshape %v1716 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1763 = stablehlo.slice %v1762 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1764 = stablehlo.reshape %v1763 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1765 = stablehlo.reshape %v1721 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1766 = stablehlo.slice %v1765 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1767 = stablehlo.reshape %v1766 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1768 = stablehlo.reshape %v1764 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1769 = stablehlo.transpose %v1768, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1770 = stablehlo.reshape %v1769 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1771 = stablehlo.reshape %v1761 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1772 = stablehlo.reshape %v1770 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1773 = stablehlo.dot_general %v1771, %v1772, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1774 = stablehlo.reshape %v1773 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1775 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1776 = stablehlo.multiply %v1774, %v1775 : tensor<32x38809xf32>
    %v1777 = stablehlo.reshape %v1776 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1778 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1779 = stablehlo.reduce(%v1777 init: %v1778) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1780 = stablehlo.broadcast_in_dim %v1779, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1781 = stablehlo.subtract %v1777, %v1780 : tensor<32x197x197xf32>
    %v1782 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1783 = stablehlo.exponential %v1781 : tensor<32x197x197xf32>
    %v1784 = stablehlo.reduce(%v1783 init: %v1782) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1785 = stablehlo.broadcast_in_dim %v1784, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1786 = stablehlo.divide %v1783, %v1785 : tensor<32x197x197xf32>
    %v1787 = stablehlo.reshape %v1786 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1788 = stablehlo.reshape %v1787 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1789 = stablehlo.reshape %v1767 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1790 = stablehlo.dot_general %v1788, %v1789, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1791 = stablehlo.reshape %v1790 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1792 = stablehlo.reshape %v1791 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1793 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1794 = stablehlo.pad %v1792, %v1793, low = [0, 0, 64], high = [0, 0, 640], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1795 = stablehlo.reshape %v1794 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1796 = stablehlo.add %v1758, %v1795 : tensor<32x151296xf32>
    %v1797 = stablehlo.reshape %v1711 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1798 = stablehlo.slice %v1797 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1799 = stablehlo.reshape %v1798 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1800 = stablehlo.reshape %v1716 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1801 = stablehlo.slice %v1800 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1802 = stablehlo.reshape %v1801 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1803 = stablehlo.reshape %v1721 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1804 = stablehlo.slice %v1803 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1805 = stablehlo.reshape %v1804 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1806 = stablehlo.reshape %v1802 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1807 = stablehlo.transpose %v1806, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1808 = stablehlo.reshape %v1807 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1809 = stablehlo.reshape %v1799 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1810 = stablehlo.reshape %v1808 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1811 = stablehlo.dot_general %v1809, %v1810, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1812 = stablehlo.reshape %v1811 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1813 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1814 = stablehlo.multiply %v1812, %v1813 : tensor<32x38809xf32>
    %v1815 = stablehlo.reshape %v1814 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1816 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1817 = stablehlo.reduce(%v1815 init: %v1816) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1818 = stablehlo.broadcast_in_dim %v1817, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1819 = stablehlo.subtract %v1815, %v1818 : tensor<32x197x197xf32>
    %v1820 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1821 = stablehlo.exponential %v1819 : tensor<32x197x197xf32>
    %v1822 = stablehlo.reduce(%v1821 init: %v1820) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1823 = stablehlo.broadcast_in_dim %v1822, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1824 = stablehlo.divide %v1821, %v1823 : tensor<32x197x197xf32>
    %v1825 = stablehlo.reshape %v1824 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1826 = stablehlo.reshape %v1825 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1827 = stablehlo.reshape %v1805 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1828 = stablehlo.dot_general %v1826, %v1827, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1829 = stablehlo.reshape %v1828 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1830 = stablehlo.reshape %v1829 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1831 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1832 = stablehlo.pad %v1830, %v1831, low = [0, 0, 128], high = [0, 0, 576], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1833 = stablehlo.reshape %v1832 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1834 = stablehlo.add %v1796, %v1833 : tensor<32x151296xf32>
    %v1835 = stablehlo.reshape %v1711 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1836 = stablehlo.slice %v1835 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1837 = stablehlo.reshape %v1836 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1838 = stablehlo.reshape %v1716 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1839 = stablehlo.slice %v1838 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1840 = stablehlo.reshape %v1839 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1841 = stablehlo.reshape %v1721 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1842 = stablehlo.slice %v1841 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1843 = stablehlo.reshape %v1842 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1844 = stablehlo.reshape %v1840 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1845 = stablehlo.transpose %v1844, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1846 = stablehlo.reshape %v1845 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1847 = stablehlo.reshape %v1837 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1848 = stablehlo.reshape %v1846 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1849 = stablehlo.dot_general %v1847, %v1848, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1850 = stablehlo.reshape %v1849 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1851 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1852 = stablehlo.multiply %v1850, %v1851 : tensor<32x38809xf32>
    %v1853 = stablehlo.reshape %v1852 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1854 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1855 = stablehlo.reduce(%v1853 init: %v1854) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1856 = stablehlo.broadcast_in_dim %v1855, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1857 = stablehlo.subtract %v1853, %v1856 : tensor<32x197x197xf32>
    %v1858 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1859 = stablehlo.exponential %v1857 : tensor<32x197x197xf32>
    %v1860 = stablehlo.reduce(%v1859 init: %v1858) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1861 = stablehlo.broadcast_in_dim %v1860, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1862 = stablehlo.divide %v1859, %v1861 : tensor<32x197x197xf32>
    %v1863 = stablehlo.reshape %v1862 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1864 = stablehlo.reshape %v1863 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1865 = stablehlo.reshape %v1843 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1866 = stablehlo.dot_general %v1864, %v1865, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1867 = stablehlo.reshape %v1866 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1868 = stablehlo.reshape %v1867 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1869 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1870 = stablehlo.pad %v1868, %v1869, low = [0, 0, 192], high = [0, 0, 512], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1871 = stablehlo.reshape %v1870 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1872 = stablehlo.add %v1834, %v1871 : tensor<32x151296xf32>
    %v1873 = stablehlo.reshape %v1711 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1874 = stablehlo.slice %v1873 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1875 = stablehlo.reshape %v1874 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1876 = stablehlo.reshape %v1716 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1877 = stablehlo.slice %v1876 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1878 = stablehlo.reshape %v1877 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1879 = stablehlo.reshape %v1721 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1880 = stablehlo.slice %v1879 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1881 = stablehlo.reshape %v1880 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1882 = stablehlo.reshape %v1878 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1883 = stablehlo.transpose %v1882, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1884 = stablehlo.reshape %v1883 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1885 = stablehlo.reshape %v1875 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1886 = stablehlo.reshape %v1884 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1887 = stablehlo.dot_general %v1885, %v1886, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1888 = stablehlo.reshape %v1887 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1889 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1890 = stablehlo.multiply %v1888, %v1889 : tensor<32x38809xf32>
    %v1891 = stablehlo.reshape %v1890 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1892 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1893 = stablehlo.reduce(%v1891 init: %v1892) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1894 = stablehlo.broadcast_in_dim %v1893, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1895 = stablehlo.subtract %v1891, %v1894 : tensor<32x197x197xf32>
    %v1896 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1897 = stablehlo.exponential %v1895 : tensor<32x197x197xf32>
    %v1898 = stablehlo.reduce(%v1897 init: %v1896) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1899 = stablehlo.broadcast_in_dim %v1898, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1900 = stablehlo.divide %v1897, %v1899 : tensor<32x197x197xf32>
    %v1901 = stablehlo.reshape %v1900 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1902 = stablehlo.reshape %v1901 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1903 = stablehlo.reshape %v1881 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1904 = stablehlo.dot_general %v1902, %v1903, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1905 = stablehlo.reshape %v1904 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1906 = stablehlo.reshape %v1905 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1907 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1908 = stablehlo.pad %v1906, %v1907, low = [0, 0, 256], high = [0, 0, 448], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1909 = stablehlo.reshape %v1908 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1910 = stablehlo.add %v1872, %v1909 : tensor<32x151296xf32>
    %v1911 = stablehlo.reshape %v1711 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1912 = stablehlo.slice %v1911 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1913 = stablehlo.reshape %v1912 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1914 = stablehlo.reshape %v1716 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1915 = stablehlo.slice %v1914 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1916 = stablehlo.reshape %v1915 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1917 = stablehlo.reshape %v1721 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1918 = stablehlo.slice %v1917 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1919 = stablehlo.reshape %v1918 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1920 = stablehlo.reshape %v1916 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1921 = stablehlo.transpose %v1920, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1922 = stablehlo.reshape %v1921 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1923 = stablehlo.reshape %v1913 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1924 = stablehlo.reshape %v1922 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1925 = stablehlo.dot_general %v1923, %v1924, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1926 = stablehlo.reshape %v1925 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1927 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1928 = stablehlo.multiply %v1926, %v1927 : tensor<32x38809xf32>
    %v1929 = stablehlo.reshape %v1928 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1930 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1931 = stablehlo.reduce(%v1929 init: %v1930) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1932 = stablehlo.broadcast_in_dim %v1931, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1933 = stablehlo.subtract %v1929, %v1932 : tensor<32x197x197xf32>
    %v1934 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1935 = stablehlo.exponential %v1933 : tensor<32x197x197xf32>
    %v1936 = stablehlo.reduce(%v1935 init: %v1934) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1937 = stablehlo.broadcast_in_dim %v1936, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1938 = stablehlo.divide %v1935, %v1937 : tensor<32x197x197xf32>
    %v1939 = stablehlo.reshape %v1938 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1940 = stablehlo.reshape %v1939 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1941 = stablehlo.reshape %v1919 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1942 = stablehlo.dot_general %v1940, %v1941, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1943 = stablehlo.reshape %v1942 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1944 = stablehlo.reshape %v1943 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1945 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1946 = stablehlo.pad %v1944, %v1945, low = [0, 0, 320], high = [0, 0, 384], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1947 = stablehlo.reshape %v1946 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1948 = stablehlo.add %v1910, %v1947 : tensor<32x151296xf32>
    %v1949 = stablehlo.reshape %v1711 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1950 = stablehlo.slice %v1949 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1951 = stablehlo.reshape %v1950 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1952 = stablehlo.reshape %v1716 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1953 = stablehlo.slice %v1952 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1954 = stablehlo.reshape %v1953 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1955 = stablehlo.reshape %v1721 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1956 = stablehlo.slice %v1955 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1957 = stablehlo.reshape %v1956 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1958 = stablehlo.reshape %v1954 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1959 = stablehlo.transpose %v1958, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1960 = stablehlo.reshape %v1959 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1961 = stablehlo.reshape %v1951 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1962 = stablehlo.reshape %v1960 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v1963 = stablehlo.dot_general %v1961, %v1962, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v1964 = stablehlo.reshape %v1963 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1965 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v1966 = stablehlo.multiply %v1964, %v1965 : tensor<32x38809xf32>
    %v1967 = stablehlo.reshape %v1966 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1968 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1969 = stablehlo.reduce(%v1967 init: %v1968) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1970 = stablehlo.broadcast_in_dim %v1969, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1971 = stablehlo.subtract %v1967, %v1970 : tensor<32x197x197xf32>
    %v1972 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1973 = stablehlo.exponential %v1971 : tensor<32x197x197xf32>
    %v1974 = stablehlo.reduce(%v1973 init: %v1972) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v1975 = stablehlo.broadcast_in_dim %v1974, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v1976 = stablehlo.divide %v1973, %v1975 : tensor<32x197x197xf32>
    %v1977 = stablehlo.reshape %v1976 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v1978 = stablehlo.reshape %v1977 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v1979 = stablehlo.reshape %v1957 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1980 = stablehlo.dot_general %v1978, %v1979, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v1981 = stablehlo.reshape %v1980 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1982 = stablehlo.reshape %v1981 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1983 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1984 = stablehlo.pad %v1982, %v1983, low = [0, 0, 384], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v1985 = stablehlo.reshape %v1984 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v1986 = stablehlo.add %v1948, %v1985 : tensor<32x151296xf32>
    %v1987 = stablehlo.reshape %v1711 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1988 = stablehlo.slice %v1987 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1989 = stablehlo.reshape %v1988 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1990 = stablehlo.reshape %v1716 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1991 = stablehlo.slice %v1990 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1992 = stablehlo.reshape %v1991 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1993 = stablehlo.reshape %v1721 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v1994 = stablehlo.slice %v1993 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v1995 = stablehlo.reshape %v1994 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v1996 = stablehlo.reshape %v1992 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v1997 = stablehlo.transpose %v1996, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v1998 = stablehlo.reshape %v1997 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v1999 = stablehlo.reshape %v1989 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2000 = stablehlo.reshape %v1998 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2001 = stablehlo.dot_general %v1999, %v2000, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2002 = stablehlo.reshape %v2001 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2003 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2004 = stablehlo.multiply %v2002, %v2003 : tensor<32x38809xf32>
    %v2005 = stablehlo.reshape %v2004 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2006 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2007 = stablehlo.reduce(%v2005 init: %v2006) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2008 = stablehlo.broadcast_in_dim %v2007, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2009 = stablehlo.subtract %v2005, %v2008 : tensor<32x197x197xf32>
    %v2010 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2011 = stablehlo.exponential %v2009 : tensor<32x197x197xf32>
    %v2012 = stablehlo.reduce(%v2011 init: %v2010) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2013 = stablehlo.broadcast_in_dim %v2012, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2014 = stablehlo.divide %v2011, %v2013 : tensor<32x197x197xf32>
    %v2015 = stablehlo.reshape %v2014 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2016 = stablehlo.reshape %v2015 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2017 = stablehlo.reshape %v1995 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2018 = stablehlo.dot_general %v2016, %v2017, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2019 = stablehlo.reshape %v2018 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2020 = stablehlo.reshape %v2019 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2021 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2022 = stablehlo.pad %v2020, %v2021, low = [0, 0, 448], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2023 = stablehlo.reshape %v2022 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2024 = stablehlo.add %v1986, %v2023 : tensor<32x151296xf32>
    %v2025 = stablehlo.reshape %v1711 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2026 = stablehlo.slice %v2025 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2027 = stablehlo.reshape %v2026 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2028 = stablehlo.reshape %v1716 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2029 = stablehlo.slice %v2028 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2030 = stablehlo.reshape %v2029 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2031 = stablehlo.reshape %v1721 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2032 = stablehlo.slice %v2031 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2033 = stablehlo.reshape %v2032 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2034 = stablehlo.reshape %v2030 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2035 = stablehlo.transpose %v2034, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2036 = stablehlo.reshape %v2035 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2037 = stablehlo.reshape %v2027 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2038 = stablehlo.reshape %v2036 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2039 = stablehlo.dot_general %v2037, %v2038, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2040 = stablehlo.reshape %v2039 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2041 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2042 = stablehlo.multiply %v2040, %v2041 : tensor<32x38809xf32>
    %v2043 = stablehlo.reshape %v2042 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2044 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2045 = stablehlo.reduce(%v2043 init: %v2044) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2046 = stablehlo.broadcast_in_dim %v2045, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2047 = stablehlo.subtract %v2043, %v2046 : tensor<32x197x197xf32>
    %v2048 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2049 = stablehlo.exponential %v2047 : tensor<32x197x197xf32>
    %v2050 = stablehlo.reduce(%v2049 init: %v2048) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2051 = stablehlo.broadcast_in_dim %v2050, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2052 = stablehlo.divide %v2049, %v2051 : tensor<32x197x197xf32>
    %v2053 = stablehlo.reshape %v2052 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2054 = stablehlo.reshape %v2053 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2055 = stablehlo.reshape %v2033 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2056 = stablehlo.dot_general %v2054, %v2055, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2057 = stablehlo.reshape %v2056 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2058 = stablehlo.reshape %v2057 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2059 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2060 = stablehlo.pad %v2058, %v2059, low = [0, 0, 512], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2061 = stablehlo.reshape %v2060 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2062 = stablehlo.add %v2024, %v2061 : tensor<32x151296xf32>
    %v2063 = stablehlo.reshape %v1711 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2064 = stablehlo.slice %v2063 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2065 = stablehlo.reshape %v2064 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2066 = stablehlo.reshape %v1716 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2067 = stablehlo.slice %v2066 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2068 = stablehlo.reshape %v2067 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2069 = stablehlo.reshape %v1721 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2070 = stablehlo.slice %v2069 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2071 = stablehlo.reshape %v2070 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2072 = stablehlo.reshape %v2068 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2073 = stablehlo.transpose %v2072, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2074 = stablehlo.reshape %v2073 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2075 = stablehlo.reshape %v2065 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2076 = stablehlo.reshape %v2074 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2077 = stablehlo.dot_general %v2075, %v2076, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2078 = stablehlo.reshape %v2077 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2079 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2080 = stablehlo.multiply %v2078, %v2079 : tensor<32x38809xf32>
    %v2081 = stablehlo.reshape %v2080 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2082 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2083 = stablehlo.reduce(%v2081 init: %v2082) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2084 = stablehlo.broadcast_in_dim %v2083, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2085 = stablehlo.subtract %v2081, %v2084 : tensor<32x197x197xf32>
    %v2086 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2087 = stablehlo.exponential %v2085 : tensor<32x197x197xf32>
    %v2088 = stablehlo.reduce(%v2087 init: %v2086) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2089 = stablehlo.broadcast_in_dim %v2088, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2090 = stablehlo.divide %v2087, %v2089 : tensor<32x197x197xf32>
    %v2091 = stablehlo.reshape %v2090 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2092 = stablehlo.reshape %v2091 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2093 = stablehlo.reshape %v2071 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2094 = stablehlo.dot_general %v2092, %v2093, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2095 = stablehlo.reshape %v2094 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2096 = stablehlo.reshape %v2095 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2097 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2098 = stablehlo.pad %v2096, %v2097, low = [0, 0, 576], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2099 = stablehlo.reshape %v2098 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2100 = stablehlo.add %v2062, %v2099 : tensor<32x151296xf32>
    %v2101 = stablehlo.reshape %v1711 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2102 = stablehlo.slice %v2101 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2103 = stablehlo.reshape %v2102 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2104 = stablehlo.reshape %v1716 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2105 = stablehlo.slice %v2104 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2106 = stablehlo.reshape %v2105 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2107 = stablehlo.reshape %v1721 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2108 = stablehlo.slice %v2107 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2109 = stablehlo.reshape %v2108 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2110 = stablehlo.reshape %v2106 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2111 = stablehlo.transpose %v2110, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2112 = stablehlo.reshape %v2111 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2113 = stablehlo.reshape %v2103 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2114 = stablehlo.reshape %v2112 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2115 = stablehlo.dot_general %v2113, %v2114, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2116 = stablehlo.reshape %v2115 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2117 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2118 = stablehlo.multiply %v2116, %v2117 : tensor<32x38809xf32>
    %v2119 = stablehlo.reshape %v2118 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2120 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2121 = stablehlo.reduce(%v2119 init: %v2120) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2122 = stablehlo.broadcast_in_dim %v2121, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2123 = stablehlo.subtract %v2119, %v2122 : tensor<32x197x197xf32>
    %v2124 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2125 = stablehlo.exponential %v2123 : tensor<32x197x197xf32>
    %v2126 = stablehlo.reduce(%v2125 init: %v2124) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2127 = stablehlo.broadcast_in_dim %v2126, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2128 = stablehlo.divide %v2125, %v2127 : tensor<32x197x197xf32>
    %v2129 = stablehlo.reshape %v2128 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2130 = stablehlo.reshape %v2129 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2131 = stablehlo.reshape %v2109 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2132 = stablehlo.dot_general %v2130, %v2131, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2133 = stablehlo.reshape %v2132 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2134 = stablehlo.reshape %v2133 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2135 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2136 = stablehlo.pad %v2134, %v2135, low = [0, 0, 640], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2137 = stablehlo.reshape %v2136 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2138 = stablehlo.add %v2100, %v2137 : tensor<32x151296xf32>
    %v2139 = stablehlo.reshape %v1711 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2140 = stablehlo.slice %v2139 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2141 = stablehlo.reshape %v2140 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2142 = stablehlo.reshape %v1716 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2143 = stablehlo.slice %v2142 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2144 = stablehlo.reshape %v2143 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2145 = stablehlo.reshape %v1721 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2146 = stablehlo.slice %v2145 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2147 = stablehlo.reshape %v2146 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2148 = stablehlo.reshape %v2144 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2149 = stablehlo.transpose %v2148, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2150 = stablehlo.reshape %v2149 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2151 = stablehlo.reshape %v2141 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2152 = stablehlo.reshape %v2150 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2153 = stablehlo.dot_general %v2151, %v2152, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2154 = stablehlo.reshape %v2153 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2155 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2156 = stablehlo.multiply %v2154, %v2155 : tensor<32x38809xf32>
    %v2157 = stablehlo.reshape %v2156 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2158 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2159 = stablehlo.reduce(%v2157 init: %v2158) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2160 = stablehlo.broadcast_in_dim %v2159, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2161 = stablehlo.subtract %v2157, %v2160 : tensor<32x197x197xf32>
    %v2162 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2163 = stablehlo.exponential %v2161 : tensor<32x197x197xf32>
    %v2164 = stablehlo.reduce(%v2163 init: %v2162) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2165 = stablehlo.broadcast_in_dim %v2164, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2166 = stablehlo.divide %v2163, %v2165 : tensor<32x197x197xf32>
    %v2167 = stablehlo.reshape %v2166 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2168 = stablehlo.reshape %v2167 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2169 = stablehlo.reshape %v2147 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2170 = stablehlo.dot_general %v2168, %v2169, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2171 = stablehlo.reshape %v2170 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2172 = stablehlo.reshape %v2171 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2173 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2174 = stablehlo.pad %v2172, %v2173, low = [0, 0, 704], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2175 = stablehlo.reshape %v2174 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2176 = stablehlo.add %v2138, %v2175 : tensor<32x151296xf32>
    %v2177 = stablehlo.reshape %v2176 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2178 = stablehlo.dot_general %v2177, %b3_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v2179 = stablehlo.broadcast_in_dim %b3_bo, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2180 = stablehlo.add %v2178, %v2179 : tensor<32x197x768xf32>
    %v2181 = stablehlo.reshape %v2180 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2182 = stablehlo.add %v1678, %v2181 : tensor<32x151296xf32>
    %v2183 = stablehlo.reshape %v2182 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2184 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2185 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v2186 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v2187 = stablehlo.reduce(%v2183 init: %v2184) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2188 = stablehlo.broadcast_in_dim %v2187, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v2189 = stablehlo.divide %v2188, %v2185 : tensor<32x197x768xf32>
    %v2190 = stablehlo.subtract %v2183, %v2189 : tensor<32x197x768xf32>
    %v2191 = stablehlo.multiply %v2190, %v2190 : tensor<32x197x768xf32>
    %v2192 = stablehlo.reduce(%v2191 init: %v2184) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2193 = stablehlo.broadcast_in_dim %v2192, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v2194 = stablehlo.divide %v2193, %v2185 : tensor<32x197x768xf32>
    %v2195 = stablehlo.add %v2194, %v2186 : tensor<32x197x768xf32>
    %v2196 = stablehlo.rsqrt %v2195 : tensor<32x197x768xf32>
    %v2197 = stablehlo.multiply %v2190, %v2196 : tensor<32x197x768xf32>
    %v2198 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v2199 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v2200 = stablehlo.multiply %v2197, %v2198 : tensor<32x197x768xf32>
    %v2201 = stablehlo.add %v2200, %v2199 : tensor<32x197x768xf32>
    %v2202 = stablehlo.reshape %v2201 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2203 = stablehlo.reshape %v2202 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2204 = stablehlo.broadcast_in_dim %b3_g2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2205 = stablehlo.multiply %v2203, %v2204 : tensor<32x197x768xf32>
    %v2206 = stablehlo.reshape %v2205 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2207 = stablehlo.reshape %v2206 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2208 = stablehlo.broadcast_in_dim %b3_bt2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2209 = stablehlo.add %v2207, %v2208 : tensor<32x197x768xf32>
    %v2210 = stablehlo.reshape %v2209 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2211 = stablehlo.reshape %v2210 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2212 = stablehlo.dot_general %v2211, %b3_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x3072xf32>) -> tensor<32x197x3072xf32>
    %v2213 = stablehlo.broadcast_in_dim %b3_bfc1, dims = [2] : (tensor<3072xf32>) -> tensor<32x197x3072xf32>
    %v2214 = stablehlo.add %v2212, %v2213 : tensor<32x197x3072xf32>
    %v2215 = stablehlo.reshape %v2214 : (tensor<32x197x3072xf32>) -> tensor<32x605184xf32>
    %v2216 = stablehlo.multiply %v2215, %v2215 : tensor<32x605184xf32>
    %v2217 = stablehlo.multiply %v2216, %v2215 : tensor<32x605184xf32>
    %v2218 = stablehlo.constant dense<0.044715> : tensor<32x605184xf32>
    %v2219 = stablehlo.multiply %v2218, %v2217 : tensor<32x605184xf32>
    %v2220 = stablehlo.add %v2215, %v2219 : tensor<32x605184xf32>
    %v2221 = stablehlo.constant dense<0.7978845608028654> : tensor<32x605184xf32>
    %v2222 = stablehlo.multiply %v2221, %v2220 : tensor<32x605184xf32>
    %v2223 = stablehlo.tanh %v2222 : tensor<32x605184xf32>
    %v2224 = stablehlo.constant dense<1.0> : tensor<32x605184xf32>
    %v2225 = stablehlo.add %v2224, %v2223 : tensor<32x605184xf32>
    %v2226 = stablehlo.constant dense<0.5> : tensor<32x605184xf32>
    %v2227 = stablehlo.multiply %v2226, %v2215 : tensor<32x605184xf32>
    %v2228 = stablehlo.multiply %v2227, %v2225 : tensor<32x605184xf32>
    %v2229 = stablehlo.reshape %v2228 : (tensor<32x605184xf32>) -> tensor<32x197x3072xf32>
    %v2230 = stablehlo.dot_general %v2229, %b3_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x3072xf32>, tensor<3072x768xf32>) -> tensor<32x197x768xf32>
    %v2231 = stablehlo.broadcast_in_dim %b3_bfc2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2232 = stablehlo.add %v2230, %v2231 : tensor<32x197x768xf32>
    %v2233 = stablehlo.reshape %v2232 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2234 = stablehlo.add %v2182, %v2233 : tensor<32x151296xf32>
    %v2235 = stablehlo.reshape %v2234 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2236 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2237 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v2238 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v2239 = stablehlo.reduce(%v2235 init: %v2236) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2240 = stablehlo.broadcast_in_dim %v2239, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v2241 = stablehlo.divide %v2240, %v2237 : tensor<32x197x768xf32>
    %v2242 = stablehlo.subtract %v2235, %v2241 : tensor<32x197x768xf32>
    %v2243 = stablehlo.multiply %v2242, %v2242 : tensor<32x197x768xf32>
    %v2244 = stablehlo.reduce(%v2243 init: %v2236) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2245 = stablehlo.broadcast_in_dim %v2244, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v2246 = stablehlo.divide %v2245, %v2237 : tensor<32x197x768xf32>
    %v2247 = stablehlo.add %v2246, %v2238 : tensor<32x197x768xf32>
    %v2248 = stablehlo.rsqrt %v2247 : tensor<32x197x768xf32>
    %v2249 = stablehlo.multiply %v2242, %v2248 : tensor<32x197x768xf32>
    %v2250 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v2251 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v2252 = stablehlo.multiply %v2249, %v2250 : tensor<32x197x768xf32>
    %v2253 = stablehlo.add %v2252, %v2251 : tensor<32x197x768xf32>
    %v2254 = stablehlo.reshape %v2253 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2255 = stablehlo.reshape %v2254 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2256 = stablehlo.broadcast_in_dim %b4_g1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2257 = stablehlo.multiply %v2255, %v2256 : tensor<32x197x768xf32>
    %v2258 = stablehlo.reshape %v2257 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2259 = stablehlo.reshape %v2258 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2260 = stablehlo.broadcast_in_dim %b4_bt1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2261 = stablehlo.add %v2259, %v2260 : tensor<32x197x768xf32>
    %v2262 = stablehlo.reshape %v2261 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2263 = stablehlo.reshape %v2262 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2264 = stablehlo.dot_general %v2263, %b4_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v2265 = stablehlo.broadcast_in_dim %b4_bq, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2266 = stablehlo.add %v2264, %v2265 : tensor<32x197x768xf32>
    %v2267 = stablehlo.reshape %v2266 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2268 = stablehlo.reshape %v2262 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2269 = stablehlo.dot_general %v2268, %b4_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v2270 = stablehlo.broadcast_in_dim %b4_bk, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2271 = stablehlo.add %v2269, %v2270 : tensor<32x197x768xf32>
    %v2272 = stablehlo.reshape %v2271 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2273 = stablehlo.reshape %v2262 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2274 = stablehlo.dot_general %v2273, %b4_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v2275 = stablehlo.broadcast_in_dim %b4_bv, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2276 = stablehlo.add %v2274, %v2275 : tensor<32x197x768xf32>
    %v2277 = stablehlo.reshape %v2276 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2278 = stablehlo.reshape %v2267 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2279 = stablehlo.slice %v2278 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2280 = stablehlo.reshape %v2279 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2281 = stablehlo.reshape %v2272 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2282 = stablehlo.slice %v2281 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2283 = stablehlo.reshape %v2282 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2284 = stablehlo.reshape %v2277 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2285 = stablehlo.slice %v2284 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2286 = stablehlo.reshape %v2285 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2287 = stablehlo.reshape %v2283 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2288 = stablehlo.transpose %v2287, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2289 = stablehlo.reshape %v2288 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2290 = stablehlo.reshape %v2280 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2291 = stablehlo.reshape %v2289 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2292 = stablehlo.dot_general %v2290, %v2291, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2293 = stablehlo.reshape %v2292 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2294 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2295 = stablehlo.multiply %v2293, %v2294 : tensor<32x38809xf32>
    %v2296 = stablehlo.reshape %v2295 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2297 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2298 = stablehlo.reduce(%v2296 init: %v2297) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2299 = stablehlo.broadcast_in_dim %v2298, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2300 = stablehlo.subtract %v2296, %v2299 : tensor<32x197x197xf32>
    %v2301 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2302 = stablehlo.exponential %v2300 : tensor<32x197x197xf32>
    %v2303 = stablehlo.reduce(%v2302 init: %v2301) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2304 = stablehlo.broadcast_in_dim %v2303, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2305 = stablehlo.divide %v2302, %v2304 : tensor<32x197x197xf32>
    %v2306 = stablehlo.reshape %v2305 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2307 = stablehlo.reshape %v2306 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2308 = stablehlo.reshape %v2286 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2309 = stablehlo.dot_general %v2307, %v2308, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2310 = stablehlo.reshape %v2309 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2311 = stablehlo.reshape %v2310 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2312 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2313 = stablehlo.pad %v2311, %v2312, low = [0, 0, 0], high = [0, 0, 704], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2314 = stablehlo.reshape %v2313 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2315 = stablehlo.reshape %v2267 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2316 = stablehlo.slice %v2315 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2317 = stablehlo.reshape %v2316 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2318 = stablehlo.reshape %v2272 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2319 = stablehlo.slice %v2318 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2320 = stablehlo.reshape %v2319 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2321 = stablehlo.reshape %v2277 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2322 = stablehlo.slice %v2321 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2323 = stablehlo.reshape %v2322 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2324 = stablehlo.reshape %v2320 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2325 = stablehlo.transpose %v2324, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2326 = stablehlo.reshape %v2325 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2327 = stablehlo.reshape %v2317 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2328 = stablehlo.reshape %v2326 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2329 = stablehlo.dot_general %v2327, %v2328, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2330 = stablehlo.reshape %v2329 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2331 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2332 = stablehlo.multiply %v2330, %v2331 : tensor<32x38809xf32>
    %v2333 = stablehlo.reshape %v2332 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2334 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2335 = stablehlo.reduce(%v2333 init: %v2334) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2336 = stablehlo.broadcast_in_dim %v2335, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2337 = stablehlo.subtract %v2333, %v2336 : tensor<32x197x197xf32>
    %v2338 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2339 = stablehlo.exponential %v2337 : tensor<32x197x197xf32>
    %v2340 = stablehlo.reduce(%v2339 init: %v2338) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2341 = stablehlo.broadcast_in_dim %v2340, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2342 = stablehlo.divide %v2339, %v2341 : tensor<32x197x197xf32>
    %v2343 = stablehlo.reshape %v2342 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2344 = stablehlo.reshape %v2343 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2345 = stablehlo.reshape %v2323 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2346 = stablehlo.dot_general %v2344, %v2345, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2347 = stablehlo.reshape %v2346 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2348 = stablehlo.reshape %v2347 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2349 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2350 = stablehlo.pad %v2348, %v2349, low = [0, 0, 64], high = [0, 0, 640], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2351 = stablehlo.reshape %v2350 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2352 = stablehlo.add %v2314, %v2351 : tensor<32x151296xf32>
    %v2353 = stablehlo.reshape %v2267 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2354 = stablehlo.slice %v2353 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2355 = stablehlo.reshape %v2354 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2356 = stablehlo.reshape %v2272 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2357 = stablehlo.slice %v2356 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2358 = stablehlo.reshape %v2357 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2359 = stablehlo.reshape %v2277 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2360 = stablehlo.slice %v2359 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2361 = stablehlo.reshape %v2360 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2362 = stablehlo.reshape %v2358 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2363 = stablehlo.transpose %v2362, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2364 = stablehlo.reshape %v2363 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2365 = stablehlo.reshape %v2355 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2366 = stablehlo.reshape %v2364 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2367 = stablehlo.dot_general %v2365, %v2366, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2368 = stablehlo.reshape %v2367 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2369 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2370 = stablehlo.multiply %v2368, %v2369 : tensor<32x38809xf32>
    %v2371 = stablehlo.reshape %v2370 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2372 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2373 = stablehlo.reduce(%v2371 init: %v2372) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2374 = stablehlo.broadcast_in_dim %v2373, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2375 = stablehlo.subtract %v2371, %v2374 : tensor<32x197x197xf32>
    %v2376 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2377 = stablehlo.exponential %v2375 : tensor<32x197x197xf32>
    %v2378 = stablehlo.reduce(%v2377 init: %v2376) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2379 = stablehlo.broadcast_in_dim %v2378, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2380 = stablehlo.divide %v2377, %v2379 : tensor<32x197x197xf32>
    %v2381 = stablehlo.reshape %v2380 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2382 = stablehlo.reshape %v2381 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2383 = stablehlo.reshape %v2361 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2384 = stablehlo.dot_general %v2382, %v2383, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2385 = stablehlo.reshape %v2384 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2386 = stablehlo.reshape %v2385 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2387 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2388 = stablehlo.pad %v2386, %v2387, low = [0, 0, 128], high = [0, 0, 576], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2389 = stablehlo.reshape %v2388 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2390 = stablehlo.add %v2352, %v2389 : tensor<32x151296xf32>
    %v2391 = stablehlo.reshape %v2267 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2392 = stablehlo.slice %v2391 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2393 = stablehlo.reshape %v2392 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2394 = stablehlo.reshape %v2272 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2395 = stablehlo.slice %v2394 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2396 = stablehlo.reshape %v2395 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2397 = stablehlo.reshape %v2277 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2398 = stablehlo.slice %v2397 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2399 = stablehlo.reshape %v2398 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2400 = stablehlo.reshape %v2396 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2401 = stablehlo.transpose %v2400, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2402 = stablehlo.reshape %v2401 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2403 = stablehlo.reshape %v2393 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2404 = stablehlo.reshape %v2402 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2405 = stablehlo.dot_general %v2403, %v2404, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2406 = stablehlo.reshape %v2405 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2407 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2408 = stablehlo.multiply %v2406, %v2407 : tensor<32x38809xf32>
    %v2409 = stablehlo.reshape %v2408 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2410 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2411 = stablehlo.reduce(%v2409 init: %v2410) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2412 = stablehlo.broadcast_in_dim %v2411, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2413 = stablehlo.subtract %v2409, %v2412 : tensor<32x197x197xf32>
    %v2414 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2415 = stablehlo.exponential %v2413 : tensor<32x197x197xf32>
    %v2416 = stablehlo.reduce(%v2415 init: %v2414) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2417 = stablehlo.broadcast_in_dim %v2416, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2418 = stablehlo.divide %v2415, %v2417 : tensor<32x197x197xf32>
    %v2419 = stablehlo.reshape %v2418 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2420 = stablehlo.reshape %v2419 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2421 = stablehlo.reshape %v2399 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2422 = stablehlo.dot_general %v2420, %v2421, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2423 = stablehlo.reshape %v2422 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2424 = stablehlo.reshape %v2423 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2425 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2426 = stablehlo.pad %v2424, %v2425, low = [0, 0, 192], high = [0, 0, 512], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2427 = stablehlo.reshape %v2426 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2428 = stablehlo.add %v2390, %v2427 : tensor<32x151296xf32>
    %v2429 = stablehlo.reshape %v2267 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2430 = stablehlo.slice %v2429 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2431 = stablehlo.reshape %v2430 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2432 = stablehlo.reshape %v2272 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2433 = stablehlo.slice %v2432 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2434 = stablehlo.reshape %v2433 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2435 = stablehlo.reshape %v2277 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2436 = stablehlo.slice %v2435 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2437 = stablehlo.reshape %v2436 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2438 = stablehlo.reshape %v2434 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2439 = stablehlo.transpose %v2438, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2440 = stablehlo.reshape %v2439 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2441 = stablehlo.reshape %v2431 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2442 = stablehlo.reshape %v2440 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2443 = stablehlo.dot_general %v2441, %v2442, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2444 = stablehlo.reshape %v2443 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2445 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2446 = stablehlo.multiply %v2444, %v2445 : tensor<32x38809xf32>
    %v2447 = stablehlo.reshape %v2446 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2448 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2449 = stablehlo.reduce(%v2447 init: %v2448) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2450 = stablehlo.broadcast_in_dim %v2449, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2451 = stablehlo.subtract %v2447, %v2450 : tensor<32x197x197xf32>
    %v2452 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2453 = stablehlo.exponential %v2451 : tensor<32x197x197xf32>
    %v2454 = stablehlo.reduce(%v2453 init: %v2452) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2455 = stablehlo.broadcast_in_dim %v2454, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2456 = stablehlo.divide %v2453, %v2455 : tensor<32x197x197xf32>
    %v2457 = stablehlo.reshape %v2456 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2458 = stablehlo.reshape %v2457 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2459 = stablehlo.reshape %v2437 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2460 = stablehlo.dot_general %v2458, %v2459, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2461 = stablehlo.reshape %v2460 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2462 = stablehlo.reshape %v2461 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2463 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2464 = stablehlo.pad %v2462, %v2463, low = [0, 0, 256], high = [0, 0, 448], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2465 = stablehlo.reshape %v2464 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2466 = stablehlo.add %v2428, %v2465 : tensor<32x151296xf32>
    %v2467 = stablehlo.reshape %v2267 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2468 = stablehlo.slice %v2467 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2469 = stablehlo.reshape %v2468 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2470 = stablehlo.reshape %v2272 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2471 = stablehlo.slice %v2470 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2472 = stablehlo.reshape %v2471 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2473 = stablehlo.reshape %v2277 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2474 = stablehlo.slice %v2473 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2475 = stablehlo.reshape %v2474 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2476 = stablehlo.reshape %v2472 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2477 = stablehlo.transpose %v2476, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2478 = stablehlo.reshape %v2477 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2479 = stablehlo.reshape %v2469 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2480 = stablehlo.reshape %v2478 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2481 = stablehlo.dot_general %v2479, %v2480, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2482 = stablehlo.reshape %v2481 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2483 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2484 = stablehlo.multiply %v2482, %v2483 : tensor<32x38809xf32>
    %v2485 = stablehlo.reshape %v2484 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2486 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2487 = stablehlo.reduce(%v2485 init: %v2486) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2488 = stablehlo.broadcast_in_dim %v2487, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2489 = stablehlo.subtract %v2485, %v2488 : tensor<32x197x197xf32>
    %v2490 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2491 = stablehlo.exponential %v2489 : tensor<32x197x197xf32>
    %v2492 = stablehlo.reduce(%v2491 init: %v2490) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2493 = stablehlo.broadcast_in_dim %v2492, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2494 = stablehlo.divide %v2491, %v2493 : tensor<32x197x197xf32>
    %v2495 = stablehlo.reshape %v2494 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2496 = stablehlo.reshape %v2495 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2497 = stablehlo.reshape %v2475 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2498 = stablehlo.dot_general %v2496, %v2497, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2499 = stablehlo.reshape %v2498 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2500 = stablehlo.reshape %v2499 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2501 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2502 = stablehlo.pad %v2500, %v2501, low = [0, 0, 320], high = [0, 0, 384], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2503 = stablehlo.reshape %v2502 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2504 = stablehlo.add %v2466, %v2503 : tensor<32x151296xf32>
    %v2505 = stablehlo.reshape %v2267 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2506 = stablehlo.slice %v2505 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2507 = stablehlo.reshape %v2506 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2508 = stablehlo.reshape %v2272 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2509 = stablehlo.slice %v2508 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2510 = stablehlo.reshape %v2509 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2511 = stablehlo.reshape %v2277 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2512 = stablehlo.slice %v2511 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2513 = stablehlo.reshape %v2512 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2514 = stablehlo.reshape %v2510 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2515 = stablehlo.transpose %v2514, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2516 = stablehlo.reshape %v2515 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2517 = stablehlo.reshape %v2507 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2518 = stablehlo.reshape %v2516 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2519 = stablehlo.dot_general %v2517, %v2518, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2520 = stablehlo.reshape %v2519 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2521 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2522 = stablehlo.multiply %v2520, %v2521 : tensor<32x38809xf32>
    %v2523 = stablehlo.reshape %v2522 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2524 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2525 = stablehlo.reduce(%v2523 init: %v2524) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2526 = stablehlo.broadcast_in_dim %v2525, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2527 = stablehlo.subtract %v2523, %v2526 : tensor<32x197x197xf32>
    %v2528 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2529 = stablehlo.exponential %v2527 : tensor<32x197x197xf32>
    %v2530 = stablehlo.reduce(%v2529 init: %v2528) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2531 = stablehlo.broadcast_in_dim %v2530, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2532 = stablehlo.divide %v2529, %v2531 : tensor<32x197x197xf32>
    %v2533 = stablehlo.reshape %v2532 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2534 = stablehlo.reshape %v2533 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2535 = stablehlo.reshape %v2513 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2536 = stablehlo.dot_general %v2534, %v2535, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2537 = stablehlo.reshape %v2536 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2538 = stablehlo.reshape %v2537 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2539 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2540 = stablehlo.pad %v2538, %v2539, low = [0, 0, 384], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2541 = stablehlo.reshape %v2540 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2542 = stablehlo.add %v2504, %v2541 : tensor<32x151296xf32>
    %v2543 = stablehlo.reshape %v2267 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2544 = stablehlo.slice %v2543 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2545 = stablehlo.reshape %v2544 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2546 = stablehlo.reshape %v2272 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2547 = stablehlo.slice %v2546 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2548 = stablehlo.reshape %v2547 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2549 = stablehlo.reshape %v2277 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2550 = stablehlo.slice %v2549 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2551 = stablehlo.reshape %v2550 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2552 = stablehlo.reshape %v2548 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2553 = stablehlo.transpose %v2552, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2554 = stablehlo.reshape %v2553 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2555 = stablehlo.reshape %v2545 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2556 = stablehlo.reshape %v2554 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2557 = stablehlo.dot_general %v2555, %v2556, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2558 = stablehlo.reshape %v2557 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2559 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2560 = stablehlo.multiply %v2558, %v2559 : tensor<32x38809xf32>
    %v2561 = stablehlo.reshape %v2560 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2562 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2563 = stablehlo.reduce(%v2561 init: %v2562) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2564 = stablehlo.broadcast_in_dim %v2563, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2565 = stablehlo.subtract %v2561, %v2564 : tensor<32x197x197xf32>
    %v2566 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2567 = stablehlo.exponential %v2565 : tensor<32x197x197xf32>
    %v2568 = stablehlo.reduce(%v2567 init: %v2566) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2569 = stablehlo.broadcast_in_dim %v2568, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2570 = stablehlo.divide %v2567, %v2569 : tensor<32x197x197xf32>
    %v2571 = stablehlo.reshape %v2570 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2572 = stablehlo.reshape %v2571 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2573 = stablehlo.reshape %v2551 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2574 = stablehlo.dot_general %v2572, %v2573, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2575 = stablehlo.reshape %v2574 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2576 = stablehlo.reshape %v2575 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2577 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2578 = stablehlo.pad %v2576, %v2577, low = [0, 0, 448], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2579 = stablehlo.reshape %v2578 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2580 = stablehlo.add %v2542, %v2579 : tensor<32x151296xf32>
    %v2581 = stablehlo.reshape %v2267 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2582 = stablehlo.slice %v2581 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2583 = stablehlo.reshape %v2582 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2584 = stablehlo.reshape %v2272 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2585 = stablehlo.slice %v2584 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2586 = stablehlo.reshape %v2585 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2587 = stablehlo.reshape %v2277 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2588 = stablehlo.slice %v2587 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2589 = stablehlo.reshape %v2588 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2590 = stablehlo.reshape %v2586 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2591 = stablehlo.transpose %v2590, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2592 = stablehlo.reshape %v2591 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2593 = stablehlo.reshape %v2583 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2594 = stablehlo.reshape %v2592 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2595 = stablehlo.dot_general %v2593, %v2594, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2596 = stablehlo.reshape %v2595 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2597 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2598 = stablehlo.multiply %v2596, %v2597 : tensor<32x38809xf32>
    %v2599 = stablehlo.reshape %v2598 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2600 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2601 = stablehlo.reduce(%v2599 init: %v2600) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2602 = stablehlo.broadcast_in_dim %v2601, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2603 = stablehlo.subtract %v2599, %v2602 : tensor<32x197x197xf32>
    %v2604 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2605 = stablehlo.exponential %v2603 : tensor<32x197x197xf32>
    %v2606 = stablehlo.reduce(%v2605 init: %v2604) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2607 = stablehlo.broadcast_in_dim %v2606, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2608 = stablehlo.divide %v2605, %v2607 : tensor<32x197x197xf32>
    %v2609 = stablehlo.reshape %v2608 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2610 = stablehlo.reshape %v2609 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2611 = stablehlo.reshape %v2589 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2612 = stablehlo.dot_general %v2610, %v2611, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2613 = stablehlo.reshape %v2612 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2614 = stablehlo.reshape %v2613 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2615 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2616 = stablehlo.pad %v2614, %v2615, low = [0, 0, 512], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2617 = stablehlo.reshape %v2616 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2618 = stablehlo.add %v2580, %v2617 : tensor<32x151296xf32>
    %v2619 = stablehlo.reshape %v2267 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2620 = stablehlo.slice %v2619 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2621 = stablehlo.reshape %v2620 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2622 = stablehlo.reshape %v2272 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2623 = stablehlo.slice %v2622 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2624 = stablehlo.reshape %v2623 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2625 = stablehlo.reshape %v2277 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2626 = stablehlo.slice %v2625 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2627 = stablehlo.reshape %v2626 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2628 = stablehlo.reshape %v2624 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2629 = stablehlo.transpose %v2628, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2630 = stablehlo.reshape %v2629 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2631 = stablehlo.reshape %v2621 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2632 = stablehlo.reshape %v2630 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2633 = stablehlo.dot_general %v2631, %v2632, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2634 = stablehlo.reshape %v2633 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2635 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2636 = stablehlo.multiply %v2634, %v2635 : tensor<32x38809xf32>
    %v2637 = stablehlo.reshape %v2636 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2638 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2639 = stablehlo.reduce(%v2637 init: %v2638) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2640 = stablehlo.broadcast_in_dim %v2639, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2641 = stablehlo.subtract %v2637, %v2640 : tensor<32x197x197xf32>
    %v2642 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2643 = stablehlo.exponential %v2641 : tensor<32x197x197xf32>
    %v2644 = stablehlo.reduce(%v2643 init: %v2642) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2645 = stablehlo.broadcast_in_dim %v2644, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2646 = stablehlo.divide %v2643, %v2645 : tensor<32x197x197xf32>
    %v2647 = stablehlo.reshape %v2646 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2648 = stablehlo.reshape %v2647 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2649 = stablehlo.reshape %v2627 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2650 = stablehlo.dot_general %v2648, %v2649, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2651 = stablehlo.reshape %v2650 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2652 = stablehlo.reshape %v2651 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2653 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2654 = stablehlo.pad %v2652, %v2653, low = [0, 0, 576], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2655 = stablehlo.reshape %v2654 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2656 = stablehlo.add %v2618, %v2655 : tensor<32x151296xf32>
    %v2657 = stablehlo.reshape %v2267 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2658 = stablehlo.slice %v2657 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2659 = stablehlo.reshape %v2658 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2660 = stablehlo.reshape %v2272 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2661 = stablehlo.slice %v2660 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2662 = stablehlo.reshape %v2661 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2663 = stablehlo.reshape %v2277 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2664 = stablehlo.slice %v2663 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2665 = stablehlo.reshape %v2664 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2666 = stablehlo.reshape %v2662 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2667 = stablehlo.transpose %v2666, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2668 = stablehlo.reshape %v2667 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2669 = stablehlo.reshape %v2659 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2670 = stablehlo.reshape %v2668 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2671 = stablehlo.dot_general %v2669, %v2670, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2672 = stablehlo.reshape %v2671 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2673 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2674 = stablehlo.multiply %v2672, %v2673 : tensor<32x38809xf32>
    %v2675 = stablehlo.reshape %v2674 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2676 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2677 = stablehlo.reduce(%v2675 init: %v2676) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2678 = stablehlo.broadcast_in_dim %v2677, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2679 = stablehlo.subtract %v2675, %v2678 : tensor<32x197x197xf32>
    %v2680 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2681 = stablehlo.exponential %v2679 : tensor<32x197x197xf32>
    %v2682 = stablehlo.reduce(%v2681 init: %v2680) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2683 = stablehlo.broadcast_in_dim %v2682, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2684 = stablehlo.divide %v2681, %v2683 : tensor<32x197x197xf32>
    %v2685 = stablehlo.reshape %v2684 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2686 = stablehlo.reshape %v2685 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2687 = stablehlo.reshape %v2665 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2688 = stablehlo.dot_general %v2686, %v2687, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2689 = stablehlo.reshape %v2688 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2690 = stablehlo.reshape %v2689 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2691 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2692 = stablehlo.pad %v2690, %v2691, low = [0, 0, 640], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2693 = stablehlo.reshape %v2692 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2694 = stablehlo.add %v2656, %v2693 : tensor<32x151296xf32>
    %v2695 = stablehlo.reshape %v2267 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2696 = stablehlo.slice %v2695 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2697 = stablehlo.reshape %v2696 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2698 = stablehlo.reshape %v2272 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2699 = stablehlo.slice %v2698 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2700 = stablehlo.reshape %v2699 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2701 = stablehlo.reshape %v2277 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2702 = stablehlo.slice %v2701 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2703 = stablehlo.reshape %v2702 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2704 = stablehlo.reshape %v2700 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2705 = stablehlo.transpose %v2704, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2706 = stablehlo.reshape %v2705 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2707 = stablehlo.reshape %v2697 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2708 = stablehlo.reshape %v2706 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2709 = stablehlo.dot_general %v2707, %v2708, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2710 = stablehlo.reshape %v2709 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2711 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2712 = stablehlo.multiply %v2710, %v2711 : tensor<32x38809xf32>
    %v2713 = stablehlo.reshape %v2712 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2714 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2715 = stablehlo.reduce(%v2713 init: %v2714) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2716 = stablehlo.broadcast_in_dim %v2715, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2717 = stablehlo.subtract %v2713, %v2716 : tensor<32x197x197xf32>
    %v2718 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2719 = stablehlo.exponential %v2717 : tensor<32x197x197xf32>
    %v2720 = stablehlo.reduce(%v2719 init: %v2718) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2721 = stablehlo.broadcast_in_dim %v2720, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2722 = stablehlo.divide %v2719, %v2721 : tensor<32x197x197xf32>
    %v2723 = stablehlo.reshape %v2722 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2724 = stablehlo.reshape %v2723 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2725 = stablehlo.reshape %v2703 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2726 = stablehlo.dot_general %v2724, %v2725, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2727 = stablehlo.reshape %v2726 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2728 = stablehlo.reshape %v2727 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2729 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2730 = stablehlo.pad %v2728, %v2729, low = [0, 0, 704], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2731 = stablehlo.reshape %v2730 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2732 = stablehlo.add %v2694, %v2731 : tensor<32x151296xf32>
    %v2733 = stablehlo.reshape %v2732 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2734 = stablehlo.dot_general %v2733, %b4_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v2735 = stablehlo.broadcast_in_dim %b4_bo, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2736 = stablehlo.add %v2734, %v2735 : tensor<32x197x768xf32>
    %v2737 = stablehlo.reshape %v2736 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2738 = stablehlo.add %v2234, %v2737 : tensor<32x151296xf32>
    %v2739 = stablehlo.reshape %v2738 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2740 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2741 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v2742 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v2743 = stablehlo.reduce(%v2739 init: %v2740) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2744 = stablehlo.broadcast_in_dim %v2743, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v2745 = stablehlo.divide %v2744, %v2741 : tensor<32x197x768xf32>
    %v2746 = stablehlo.subtract %v2739, %v2745 : tensor<32x197x768xf32>
    %v2747 = stablehlo.multiply %v2746, %v2746 : tensor<32x197x768xf32>
    %v2748 = stablehlo.reduce(%v2747 init: %v2740) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2749 = stablehlo.broadcast_in_dim %v2748, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v2750 = stablehlo.divide %v2749, %v2741 : tensor<32x197x768xf32>
    %v2751 = stablehlo.add %v2750, %v2742 : tensor<32x197x768xf32>
    %v2752 = stablehlo.rsqrt %v2751 : tensor<32x197x768xf32>
    %v2753 = stablehlo.multiply %v2746, %v2752 : tensor<32x197x768xf32>
    %v2754 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v2755 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v2756 = stablehlo.multiply %v2753, %v2754 : tensor<32x197x768xf32>
    %v2757 = stablehlo.add %v2756, %v2755 : tensor<32x197x768xf32>
    %v2758 = stablehlo.reshape %v2757 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2759 = stablehlo.reshape %v2758 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2760 = stablehlo.broadcast_in_dim %b4_g2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2761 = stablehlo.multiply %v2759, %v2760 : tensor<32x197x768xf32>
    %v2762 = stablehlo.reshape %v2761 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2763 = stablehlo.reshape %v2762 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2764 = stablehlo.broadcast_in_dim %b4_bt2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2765 = stablehlo.add %v2763, %v2764 : tensor<32x197x768xf32>
    %v2766 = stablehlo.reshape %v2765 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2767 = stablehlo.reshape %v2766 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2768 = stablehlo.dot_general %v2767, %b4_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x3072xf32>) -> tensor<32x197x3072xf32>
    %v2769 = stablehlo.broadcast_in_dim %b4_bfc1, dims = [2] : (tensor<3072xf32>) -> tensor<32x197x3072xf32>
    %v2770 = stablehlo.add %v2768, %v2769 : tensor<32x197x3072xf32>
    %v2771 = stablehlo.reshape %v2770 : (tensor<32x197x3072xf32>) -> tensor<32x605184xf32>
    %v2772 = stablehlo.multiply %v2771, %v2771 : tensor<32x605184xf32>
    %v2773 = stablehlo.multiply %v2772, %v2771 : tensor<32x605184xf32>
    %v2774 = stablehlo.constant dense<0.044715> : tensor<32x605184xf32>
    %v2775 = stablehlo.multiply %v2774, %v2773 : tensor<32x605184xf32>
    %v2776 = stablehlo.add %v2771, %v2775 : tensor<32x605184xf32>
    %v2777 = stablehlo.constant dense<0.7978845608028654> : tensor<32x605184xf32>
    %v2778 = stablehlo.multiply %v2777, %v2776 : tensor<32x605184xf32>
    %v2779 = stablehlo.tanh %v2778 : tensor<32x605184xf32>
    %v2780 = stablehlo.constant dense<1.0> : tensor<32x605184xf32>
    %v2781 = stablehlo.add %v2780, %v2779 : tensor<32x605184xf32>
    %v2782 = stablehlo.constant dense<0.5> : tensor<32x605184xf32>
    %v2783 = stablehlo.multiply %v2782, %v2771 : tensor<32x605184xf32>
    %v2784 = stablehlo.multiply %v2783, %v2781 : tensor<32x605184xf32>
    %v2785 = stablehlo.reshape %v2784 : (tensor<32x605184xf32>) -> tensor<32x197x3072xf32>
    %v2786 = stablehlo.dot_general %v2785, %b4_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x3072xf32>, tensor<3072x768xf32>) -> tensor<32x197x768xf32>
    %v2787 = stablehlo.broadcast_in_dim %b4_bfc2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2788 = stablehlo.add %v2786, %v2787 : tensor<32x197x768xf32>
    %v2789 = stablehlo.reshape %v2788 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2790 = stablehlo.add %v2738, %v2789 : tensor<32x151296xf32>
    %v2791 = stablehlo.reshape %v2790 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2792 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2793 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v2794 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v2795 = stablehlo.reduce(%v2791 init: %v2792) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2796 = stablehlo.broadcast_in_dim %v2795, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v2797 = stablehlo.divide %v2796, %v2793 : tensor<32x197x768xf32>
    %v2798 = stablehlo.subtract %v2791, %v2797 : tensor<32x197x768xf32>
    %v2799 = stablehlo.multiply %v2798, %v2798 : tensor<32x197x768xf32>
    %v2800 = stablehlo.reduce(%v2799 init: %v2792) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2801 = stablehlo.broadcast_in_dim %v2800, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v2802 = stablehlo.divide %v2801, %v2793 : tensor<32x197x768xf32>
    %v2803 = stablehlo.add %v2802, %v2794 : tensor<32x197x768xf32>
    %v2804 = stablehlo.rsqrt %v2803 : tensor<32x197x768xf32>
    %v2805 = stablehlo.multiply %v2798, %v2804 : tensor<32x197x768xf32>
    %v2806 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v2807 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v2808 = stablehlo.multiply %v2805, %v2806 : tensor<32x197x768xf32>
    %v2809 = stablehlo.add %v2808, %v2807 : tensor<32x197x768xf32>
    %v2810 = stablehlo.reshape %v2809 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2811 = stablehlo.reshape %v2810 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2812 = stablehlo.broadcast_in_dim %b5_g1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2813 = stablehlo.multiply %v2811, %v2812 : tensor<32x197x768xf32>
    %v2814 = stablehlo.reshape %v2813 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2815 = stablehlo.reshape %v2814 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2816 = stablehlo.broadcast_in_dim %b5_bt1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2817 = stablehlo.add %v2815, %v2816 : tensor<32x197x768xf32>
    %v2818 = stablehlo.reshape %v2817 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2819 = stablehlo.reshape %v2818 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2820 = stablehlo.dot_general %v2819, %b5_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v2821 = stablehlo.broadcast_in_dim %b5_bq, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2822 = stablehlo.add %v2820, %v2821 : tensor<32x197x768xf32>
    %v2823 = stablehlo.reshape %v2822 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2824 = stablehlo.reshape %v2818 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2825 = stablehlo.dot_general %v2824, %b5_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v2826 = stablehlo.broadcast_in_dim %b5_bk, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2827 = stablehlo.add %v2825, %v2826 : tensor<32x197x768xf32>
    %v2828 = stablehlo.reshape %v2827 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2829 = stablehlo.reshape %v2818 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2830 = stablehlo.dot_general %v2829, %b5_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v2831 = stablehlo.broadcast_in_dim %b5_bv, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v2832 = stablehlo.add %v2830, %v2831 : tensor<32x197x768xf32>
    %v2833 = stablehlo.reshape %v2832 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2834 = stablehlo.reshape %v2823 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2835 = stablehlo.slice %v2834 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2836 = stablehlo.reshape %v2835 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2837 = stablehlo.reshape %v2828 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2838 = stablehlo.slice %v2837 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2839 = stablehlo.reshape %v2838 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2840 = stablehlo.reshape %v2833 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2841 = stablehlo.slice %v2840 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2842 = stablehlo.reshape %v2841 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2843 = stablehlo.reshape %v2839 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2844 = stablehlo.transpose %v2843, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2845 = stablehlo.reshape %v2844 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2846 = stablehlo.reshape %v2836 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2847 = stablehlo.reshape %v2845 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2848 = stablehlo.dot_general %v2846, %v2847, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2849 = stablehlo.reshape %v2848 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2850 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2851 = stablehlo.multiply %v2849, %v2850 : tensor<32x38809xf32>
    %v2852 = stablehlo.reshape %v2851 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2853 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2854 = stablehlo.reduce(%v2852 init: %v2853) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2855 = stablehlo.broadcast_in_dim %v2854, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2856 = stablehlo.subtract %v2852, %v2855 : tensor<32x197x197xf32>
    %v2857 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2858 = stablehlo.exponential %v2856 : tensor<32x197x197xf32>
    %v2859 = stablehlo.reduce(%v2858 init: %v2857) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2860 = stablehlo.broadcast_in_dim %v2859, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2861 = stablehlo.divide %v2858, %v2860 : tensor<32x197x197xf32>
    %v2862 = stablehlo.reshape %v2861 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2863 = stablehlo.reshape %v2862 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2864 = stablehlo.reshape %v2842 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2865 = stablehlo.dot_general %v2863, %v2864, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2866 = stablehlo.reshape %v2865 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2867 = stablehlo.reshape %v2866 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2868 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2869 = stablehlo.pad %v2867, %v2868, low = [0, 0, 0], high = [0, 0, 704], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2870 = stablehlo.reshape %v2869 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2871 = stablehlo.reshape %v2823 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2872 = stablehlo.slice %v2871 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2873 = stablehlo.reshape %v2872 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2874 = stablehlo.reshape %v2828 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2875 = stablehlo.slice %v2874 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2876 = stablehlo.reshape %v2875 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2877 = stablehlo.reshape %v2833 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2878 = stablehlo.slice %v2877 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2879 = stablehlo.reshape %v2878 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2880 = stablehlo.reshape %v2876 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2881 = stablehlo.transpose %v2880, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2882 = stablehlo.reshape %v2881 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2883 = stablehlo.reshape %v2873 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2884 = stablehlo.reshape %v2882 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2885 = stablehlo.dot_general %v2883, %v2884, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2886 = stablehlo.reshape %v2885 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2887 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2888 = stablehlo.multiply %v2886, %v2887 : tensor<32x38809xf32>
    %v2889 = stablehlo.reshape %v2888 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2890 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2891 = stablehlo.reduce(%v2889 init: %v2890) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2892 = stablehlo.broadcast_in_dim %v2891, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2893 = stablehlo.subtract %v2889, %v2892 : tensor<32x197x197xf32>
    %v2894 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2895 = stablehlo.exponential %v2893 : tensor<32x197x197xf32>
    %v2896 = stablehlo.reduce(%v2895 init: %v2894) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2897 = stablehlo.broadcast_in_dim %v2896, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2898 = stablehlo.divide %v2895, %v2897 : tensor<32x197x197xf32>
    %v2899 = stablehlo.reshape %v2898 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2900 = stablehlo.reshape %v2899 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2901 = stablehlo.reshape %v2879 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2902 = stablehlo.dot_general %v2900, %v2901, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2903 = stablehlo.reshape %v2902 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2904 = stablehlo.reshape %v2903 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2905 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2906 = stablehlo.pad %v2904, %v2905, low = [0, 0, 64], high = [0, 0, 640], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2907 = stablehlo.reshape %v2906 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2908 = stablehlo.add %v2870, %v2907 : tensor<32x151296xf32>
    %v2909 = stablehlo.reshape %v2823 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2910 = stablehlo.slice %v2909 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2911 = stablehlo.reshape %v2910 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2912 = stablehlo.reshape %v2828 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2913 = stablehlo.slice %v2912 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2914 = stablehlo.reshape %v2913 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2915 = stablehlo.reshape %v2833 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2916 = stablehlo.slice %v2915 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2917 = stablehlo.reshape %v2916 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2918 = stablehlo.reshape %v2914 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2919 = stablehlo.transpose %v2918, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2920 = stablehlo.reshape %v2919 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2921 = stablehlo.reshape %v2911 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2922 = stablehlo.reshape %v2920 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2923 = stablehlo.dot_general %v2921, %v2922, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2924 = stablehlo.reshape %v2923 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2925 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2926 = stablehlo.multiply %v2924, %v2925 : tensor<32x38809xf32>
    %v2927 = stablehlo.reshape %v2926 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2928 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2929 = stablehlo.reduce(%v2927 init: %v2928) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2930 = stablehlo.broadcast_in_dim %v2929, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2931 = stablehlo.subtract %v2927, %v2930 : tensor<32x197x197xf32>
    %v2932 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2933 = stablehlo.exponential %v2931 : tensor<32x197x197xf32>
    %v2934 = stablehlo.reduce(%v2933 init: %v2932) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2935 = stablehlo.broadcast_in_dim %v2934, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2936 = stablehlo.divide %v2933, %v2935 : tensor<32x197x197xf32>
    %v2937 = stablehlo.reshape %v2936 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2938 = stablehlo.reshape %v2937 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2939 = stablehlo.reshape %v2917 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2940 = stablehlo.dot_general %v2938, %v2939, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2941 = stablehlo.reshape %v2940 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2942 = stablehlo.reshape %v2941 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2943 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2944 = stablehlo.pad %v2942, %v2943, low = [0, 0, 128], high = [0, 0, 576], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2945 = stablehlo.reshape %v2944 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2946 = stablehlo.add %v2908, %v2945 : tensor<32x151296xf32>
    %v2947 = stablehlo.reshape %v2823 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2948 = stablehlo.slice %v2947 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2949 = stablehlo.reshape %v2948 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2950 = stablehlo.reshape %v2828 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2951 = stablehlo.slice %v2950 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2952 = stablehlo.reshape %v2951 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2953 = stablehlo.reshape %v2833 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2954 = stablehlo.slice %v2953 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2955 = stablehlo.reshape %v2954 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2956 = stablehlo.reshape %v2952 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2957 = stablehlo.transpose %v2956, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2958 = stablehlo.reshape %v2957 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2959 = stablehlo.reshape %v2949 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2960 = stablehlo.reshape %v2958 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2961 = stablehlo.dot_general %v2959, %v2960, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v2962 = stablehlo.reshape %v2961 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2963 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v2964 = stablehlo.multiply %v2962, %v2963 : tensor<32x38809xf32>
    %v2965 = stablehlo.reshape %v2964 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2966 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2967 = stablehlo.reduce(%v2965 init: %v2966) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2968 = stablehlo.broadcast_in_dim %v2967, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2969 = stablehlo.subtract %v2965, %v2968 : tensor<32x197x197xf32>
    %v2970 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2971 = stablehlo.exponential %v2969 : tensor<32x197x197xf32>
    %v2972 = stablehlo.reduce(%v2971 init: %v2970) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v2973 = stablehlo.broadcast_in_dim %v2972, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v2974 = stablehlo.divide %v2971, %v2973 : tensor<32x197x197xf32>
    %v2975 = stablehlo.reshape %v2974 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v2976 = stablehlo.reshape %v2975 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v2977 = stablehlo.reshape %v2955 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2978 = stablehlo.dot_general %v2976, %v2977, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v2979 = stablehlo.reshape %v2978 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2980 = stablehlo.reshape %v2979 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2981 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2982 = stablehlo.pad %v2980, %v2981, low = [0, 0, 192], high = [0, 0, 512], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v2983 = stablehlo.reshape %v2982 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v2984 = stablehlo.add %v2946, %v2983 : tensor<32x151296xf32>
    %v2985 = stablehlo.reshape %v2823 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2986 = stablehlo.slice %v2985 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2987 = stablehlo.reshape %v2986 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2988 = stablehlo.reshape %v2828 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2989 = stablehlo.slice %v2988 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2990 = stablehlo.reshape %v2989 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2991 = stablehlo.reshape %v2833 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v2992 = stablehlo.slice %v2991 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v2993 = stablehlo.reshape %v2992 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v2994 = stablehlo.reshape %v2990 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2995 = stablehlo.transpose %v2994, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v2996 = stablehlo.reshape %v2995 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v2997 = stablehlo.reshape %v2987 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v2998 = stablehlo.reshape %v2996 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v2999 = stablehlo.dot_general %v2997, %v2998, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3000 = stablehlo.reshape %v2999 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3001 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3002 = stablehlo.multiply %v3000, %v3001 : tensor<32x38809xf32>
    %v3003 = stablehlo.reshape %v3002 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3004 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3005 = stablehlo.reduce(%v3003 init: %v3004) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3006 = stablehlo.broadcast_in_dim %v3005, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3007 = stablehlo.subtract %v3003, %v3006 : tensor<32x197x197xf32>
    %v3008 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3009 = stablehlo.exponential %v3007 : tensor<32x197x197xf32>
    %v3010 = stablehlo.reduce(%v3009 init: %v3008) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3011 = stablehlo.broadcast_in_dim %v3010, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3012 = stablehlo.divide %v3009, %v3011 : tensor<32x197x197xf32>
    %v3013 = stablehlo.reshape %v3012 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3014 = stablehlo.reshape %v3013 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3015 = stablehlo.reshape %v2993 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3016 = stablehlo.dot_general %v3014, %v3015, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3017 = stablehlo.reshape %v3016 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3018 = stablehlo.reshape %v3017 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3019 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3020 = stablehlo.pad %v3018, %v3019, low = [0, 0, 256], high = [0, 0, 448], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3021 = stablehlo.reshape %v3020 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3022 = stablehlo.add %v2984, %v3021 : tensor<32x151296xf32>
    %v3023 = stablehlo.reshape %v2823 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3024 = stablehlo.slice %v3023 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3025 = stablehlo.reshape %v3024 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3026 = stablehlo.reshape %v2828 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3027 = stablehlo.slice %v3026 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3028 = stablehlo.reshape %v3027 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3029 = stablehlo.reshape %v2833 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3030 = stablehlo.slice %v3029 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3031 = stablehlo.reshape %v3030 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3032 = stablehlo.reshape %v3028 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3033 = stablehlo.transpose %v3032, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3034 = stablehlo.reshape %v3033 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3035 = stablehlo.reshape %v3025 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3036 = stablehlo.reshape %v3034 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3037 = stablehlo.dot_general %v3035, %v3036, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3038 = stablehlo.reshape %v3037 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3039 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3040 = stablehlo.multiply %v3038, %v3039 : tensor<32x38809xf32>
    %v3041 = stablehlo.reshape %v3040 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3042 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3043 = stablehlo.reduce(%v3041 init: %v3042) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3044 = stablehlo.broadcast_in_dim %v3043, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3045 = stablehlo.subtract %v3041, %v3044 : tensor<32x197x197xf32>
    %v3046 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3047 = stablehlo.exponential %v3045 : tensor<32x197x197xf32>
    %v3048 = stablehlo.reduce(%v3047 init: %v3046) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3049 = stablehlo.broadcast_in_dim %v3048, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3050 = stablehlo.divide %v3047, %v3049 : tensor<32x197x197xf32>
    %v3051 = stablehlo.reshape %v3050 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3052 = stablehlo.reshape %v3051 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3053 = stablehlo.reshape %v3031 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3054 = stablehlo.dot_general %v3052, %v3053, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3055 = stablehlo.reshape %v3054 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3056 = stablehlo.reshape %v3055 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3057 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3058 = stablehlo.pad %v3056, %v3057, low = [0, 0, 320], high = [0, 0, 384], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3059 = stablehlo.reshape %v3058 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3060 = stablehlo.add %v3022, %v3059 : tensor<32x151296xf32>
    %v3061 = stablehlo.reshape %v2823 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3062 = stablehlo.slice %v3061 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3063 = stablehlo.reshape %v3062 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3064 = stablehlo.reshape %v2828 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3065 = stablehlo.slice %v3064 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3066 = stablehlo.reshape %v3065 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3067 = stablehlo.reshape %v2833 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3068 = stablehlo.slice %v3067 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3069 = stablehlo.reshape %v3068 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3070 = stablehlo.reshape %v3066 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3071 = stablehlo.transpose %v3070, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3072 = stablehlo.reshape %v3071 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3073 = stablehlo.reshape %v3063 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3074 = stablehlo.reshape %v3072 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3075 = stablehlo.dot_general %v3073, %v3074, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3076 = stablehlo.reshape %v3075 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3077 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3078 = stablehlo.multiply %v3076, %v3077 : tensor<32x38809xf32>
    %v3079 = stablehlo.reshape %v3078 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3080 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3081 = stablehlo.reduce(%v3079 init: %v3080) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3082 = stablehlo.broadcast_in_dim %v3081, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3083 = stablehlo.subtract %v3079, %v3082 : tensor<32x197x197xf32>
    %v3084 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3085 = stablehlo.exponential %v3083 : tensor<32x197x197xf32>
    %v3086 = stablehlo.reduce(%v3085 init: %v3084) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3087 = stablehlo.broadcast_in_dim %v3086, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3088 = stablehlo.divide %v3085, %v3087 : tensor<32x197x197xf32>
    %v3089 = stablehlo.reshape %v3088 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3090 = stablehlo.reshape %v3089 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3091 = stablehlo.reshape %v3069 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3092 = stablehlo.dot_general %v3090, %v3091, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3093 = stablehlo.reshape %v3092 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3094 = stablehlo.reshape %v3093 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3095 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3096 = stablehlo.pad %v3094, %v3095, low = [0, 0, 384], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3097 = stablehlo.reshape %v3096 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3098 = stablehlo.add %v3060, %v3097 : tensor<32x151296xf32>
    %v3099 = stablehlo.reshape %v2823 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3100 = stablehlo.slice %v3099 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3101 = stablehlo.reshape %v3100 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3102 = stablehlo.reshape %v2828 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3103 = stablehlo.slice %v3102 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3104 = stablehlo.reshape %v3103 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3105 = stablehlo.reshape %v2833 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3106 = stablehlo.slice %v3105 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3107 = stablehlo.reshape %v3106 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3108 = stablehlo.reshape %v3104 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3109 = stablehlo.transpose %v3108, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3110 = stablehlo.reshape %v3109 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3111 = stablehlo.reshape %v3101 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3112 = stablehlo.reshape %v3110 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3113 = stablehlo.dot_general %v3111, %v3112, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3114 = stablehlo.reshape %v3113 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3115 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3116 = stablehlo.multiply %v3114, %v3115 : tensor<32x38809xf32>
    %v3117 = stablehlo.reshape %v3116 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3118 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3119 = stablehlo.reduce(%v3117 init: %v3118) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3120 = stablehlo.broadcast_in_dim %v3119, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3121 = stablehlo.subtract %v3117, %v3120 : tensor<32x197x197xf32>
    %v3122 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3123 = stablehlo.exponential %v3121 : tensor<32x197x197xf32>
    %v3124 = stablehlo.reduce(%v3123 init: %v3122) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3125 = stablehlo.broadcast_in_dim %v3124, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3126 = stablehlo.divide %v3123, %v3125 : tensor<32x197x197xf32>
    %v3127 = stablehlo.reshape %v3126 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3128 = stablehlo.reshape %v3127 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3129 = stablehlo.reshape %v3107 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3130 = stablehlo.dot_general %v3128, %v3129, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3131 = stablehlo.reshape %v3130 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3132 = stablehlo.reshape %v3131 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3133 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3134 = stablehlo.pad %v3132, %v3133, low = [0, 0, 448], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3135 = stablehlo.reshape %v3134 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3136 = stablehlo.add %v3098, %v3135 : tensor<32x151296xf32>
    %v3137 = stablehlo.reshape %v2823 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3138 = stablehlo.slice %v3137 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3139 = stablehlo.reshape %v3138 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3140 = stablehlo.reshape %v2828 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3141 = stablehlo.slice %v3140 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3142 = stablehlo.reshape %v3141 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3143 = stablehlo.reshape %v2833 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3144 = stablehlo.slice %v3143 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3145 = stablehlo.reshape %v3144 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3146 = stablehlo.reshape %v3142 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3147 = stablehlo.transpose %v3146, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3148 = stablehlo.reshape %v3147 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3149 = stablehlo.reshape %v3139 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3150 = stablehlo.reshape %v3148 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3151 = stablehlo.dot_general %v3149, %v3150, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3152 = stablehlo.reshape %v3151 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3153 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3154 = stablehlo.multiply %v3152, %v3153 : tensor<32x38809xf32>
    %v3155 = stablehlo.reshape %v3154 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3156 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3157 = stablehlo.reduce(%v3155 init: %v3156) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3158 = stablehlo.broadcast_in_dim %v3157, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3159 = stablehlo.subtract %v3155, %v3158 : tensor<32x197x197xf32>
    %v3160 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3161 = stablehlo.exponential %v3159 : tensor<32x197x197xf32>
    %v3162 = stablehlo.reduce(%v3161 init: %v3160) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3163 = stablehlo.broadcast_in_dim %v3162, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3164 = stablehlo.divide %v3161, %v3163 : tensor<32x197x197xf32>
    %v3165 = stablehlo.reshape %v3164 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3166 = stablehlo.reshape %v3165 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3167 = stablehlo.reshape %v3145 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3168 = stablehlo.dot_general %v3166, %v3167, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3169 = stablehlo.reshape %v3168 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3170 = stablehlo.reshape %v3169 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3171 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3172 = stablehlo.pad %v3170, %v3171, low = [0, 0, 512], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3173 = stablehlo.reshape %v3172 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3174 = stablehlo.add %v3136, %v3173 : tensor<32x151296xf32>
    %v3175 = stablehlo.reshape %v2823 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3176 = stablehlo.slice %v3175 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3177 = stablehlo.reshape %v3176 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3178 = stablehlo.reshape %v2828 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3179 = stablehlo.slice %v3178 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3180 = stablehlo.reshape %v3179 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3181 = stablehlo.reshape %v2833 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3182 = stablehlo.slice %v3181 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3183 = stablehlo.reshape %v3182 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3184 = stablehlo.reshape %v3180 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3185 = stablehlo.transpose %v3184, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3186 = stablehlo.reshape %v3185 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3187 = stablehlo.reshape %v3177 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3188 = stablehlo.reshape %v3186 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3189 = stablehlo.dot_general %v3187, %v3188, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3190 = stablehlo.reshape %v3189 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3191 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3192 = stablehlo.multiply %v3190, %v3191 : tensor<32x38809xf32>
    %v3193 = stablehlo.reshape %v3192 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3194 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3195 = stablehlo.reduce(%v3193 init: %v3194) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3196 = stablehlo.broadcast_in_dim %v3195, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3197 = stablehlo.subtract %v3193, %v3196 : tensor<32x197x197xf32>
    %v3198 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3199 = stablehlo.exponential %v3197 : tensor<32x197x197xf32>
    %v3200 = stablehlo.reduce(%v3199 init: %v3198) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3201 = stablehlo.broadcast_in_dim %v3200, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3202 = stablehlo.divide %v3199, %v3201 : tensor<32x197x197xf32>
    %v3203 = stablehlo.reshape %v3202 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3204 = stablehlo.reshape %v3203 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3205 = stablehlo.reshape %v3183 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3206 = stablehlo.dot_general %v3204, %v3205, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3207 = stablehlo.reshape %v3206 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3208 = stablehlo.reshape %v3207 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3209 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3210 = stablehlo.pad %v3208, %v3209, low = [0, 0, 576], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3211 = stablehlo.reshape %v3210 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3212 = stablehlo.add %v3174, %v3211 : tensor<32x151296xf32>
    %v3213 = stablehlo.reshape %v2823 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3214 = stablehlo.slice %v3213 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3215 = stablehlo.reshape %v3214 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3216 = stablehlo.reshape %v2828 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3217 = stablehlo.slice %v3216 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3218 = stablehlo.reshape %v3217 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3219 = stablehlo.reshape %v2833 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3220 = stablehlo.slice %v3219 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3221 = stablehlo.reshape %v3220 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3222 = stablehlo.reshape %v3218 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3223 = stablehlo.transpose %v3222, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3224 = stablehlo.reshape %v3223 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3225 = stablehlo.reshape %v3215 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3226 = stablehlo.reshape %v3224 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3227 = stablehlo.dot_general %v3225, %v3226, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3228 = stablehlo.reshape %v3227 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3229 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3230 = stablehlo.multiply %v3228, %v3229 : tensor<32x38809xf32>
    %v3231 = stablehlo.reshape %v3230 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3232 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3233 = stablehlo.reduce(%v3231 init: %v3232) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3234 = stablehlo.broadcast_in_dim %v3233, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3235 = stablehlo.subtract %v3231, %v3234 : tensor<32x197x197xf32>
    %v3236 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3237 = stablehlo.exponential %v3235 : tensor<32x197x197xf32>
    %v3238 = stablehlo.reduce(%v3237 init: %v3236) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3239 = stablehlo.broadcast_in_dim %v3238, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3240 = stablehlo.divide %v3237, %v3239 : tensor<32x197x197xf32>
    %v3241 = stablehlo.reshape %v3240 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3242 = stablehlo.reshape %v3241 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3243 = stablehlo.reshape %v3221 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3244 = stablehlo.dot_general %v3242, %v3243, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3245 = stablehlo.reshape %v3244 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3246 = stablehlo.reshape %v3245 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3247 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3248 = stablehlo.pad %v3246, %v3247, low = [0, 0, 640], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3249 = stablehlo.reshape %v3248 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3250 = stablehlo.add %v3212, %v3249 : tensor<32x151296xf32>
    %v3251 = stablehlo.reshape %v2823 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3252 = stablehlo.slice %v3251 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3253 = stablehlo.reshape %v3252 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3254 = stablehlo.reshape %v2828 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3255 = stablehlo.slice %v3254 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3256 = stablehlo.reshape %v3255 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3257 = stablehlo.reshape %v2833 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3258 = stablehlo.slice %v3257 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3259 = stablehlo.reshape %v3258 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3260 = stablehlo.reshape %v3256 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3261 = stablehlo.transpose %v3260, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3262 = stablehlo.reshape %v3261 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3263 = stablehlo.reshape %v3253 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3264 = stablehlo.reshape %v3262 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3265 = stablehlo.dot_general %v3263, %v3264, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3266 = stablehlo.reshape %v3265 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3267 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3268 = stablehlo.multiply %v3266, %v3267 : tensor<32x38809xf32>
    %v3269 = stablehlo.reshape %v3268 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3270 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3271 = stablehlo.reduce(%v3269 init: %v3270) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3272 = stablehlo.broadcast_in_dim %v3271, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3273 = stablehlo.subtract %v3269, %v3272 : tensor<32x197x197xf32>
    %v3274 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3275 = stablehlo.exponential %v3273 : tensor<32x197x197xf32>
    %v3276 = stablehlo.reduce(%v3275 init: %v3274) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3277 = stablehlo.broadcast_in_dim %v3276, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3278 = stablehlo.divide %v3275, %v3277 : tensor<32x197x197xf32>
    %v3279 = stablehlo.reshape %v3278 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3280 = stablehlo.reshape %v3279 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3281 = stablehlo.reshape %v3259 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3282 = stablehlo.dot_general %v3280, %v3281, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3283 = stablehlo.reshape %v3282 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3284 = stablehlo.reshape %v3283 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3285 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3286 = stablehlo.pad %v3284, %v3285, low = [0, 0, 704], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3287 = stablehlo.reshape %v3286 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3288 = stablehlo.add %v3250, %v3287 : tensor<32x151296xf32>
    %v3289 = stablehlo.reshape %v3288 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3290 = stablehlo.dot_general %v3289, %b5_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v3291 = stablehlo.broadcast_in_dim %b5_bo, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3292 = stablehlo.add %v3290, %v3291 : tensor<32x197x768xf32>
    %v3293 = stablehlo.reshape %v3292 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3294 = stablehlo.add %v2790, %v3293 : tensor<32x151296xf32>
    %v3295 = stablehlo.reshape %v3294 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3296 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3297 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v3298 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v3299 = stablehlo.reduce(%v3295 init: %v3296) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3300 = stablehlo.broadcast_in_dim %v3299, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v3301 = stablehlo.divide %v3300, %v3297 : tensor<32x197x768xf32>
    %v3302 = stablehlo.subtract %v3295, %v3301 : tensor<32x197x768xf32>
    %v3303 = stablehlo.multiply %v3302, %v3302 : tensor<32x197x768xf32>
    %v3304 = stablehlo.reduce(%v3303 init: %v3296) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3305 = stablehlo.broadcast_in_dim %v3304, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v3306 = stablehlo.divide %v3305, %v3297 : tensor<32x197x768xf32>
    %v3307 = stablehlo.add %v3306, %v3298 : tensor<32x197x768xf32>
    %v3308 = stablehlo.rsqrt %v3307 : tensor<32x197x768xf32>
    %v3309 = stablehlo.multiply %v3302, %v3308 : tensor<32x197x768xf32>
    %v3310 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v3311 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v3312 = stablehlo.multiply %v3309, %v3310 : tensor<32x197x768xf32>
    %v3313 = stablehlo.add %v3312, %v3311 : tensor<32x197x768xf32>
    %v3314 = stablehlo.reshape %v3313 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3315 = stablehlo.reshape %v3314 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3316 = stablehlo.broadcast_in_dim %b5_g2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3317 = stablehlo.multiply %v3315, %v3316 : tensor<32x197x768xf32>
    %v3318 = stablehlo.reshape %v3317 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3319 = stablehlo.reshape %v3318 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3320 = stablehlo.broadcast_in_dim %b5_bt2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3321 = stablehlo.add %v3319, %v3320 : tensor<32x197x768xf32>
    %v3322 = stablehlo.reshape %v3321 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3323 = stablehlo.reshape %v3322 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3324 = stablehlo.dot_general %v3323, %b5_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x3072xf32>) -> tensor<32x197x3072xf32>
    %v3325 = stablehlo.broadcast_in_dim %b5_bfc1, dims = [2] : (tensor<3072xf32>) -> tensor<32x197x3072xf32>
    %v3326 = stablehlo.add %v3324, %v3325 : tensor<32x197x3072xf32>
    %v3327 = stablehlo.reshape %v3326 : (tensor<32x197x3072xf32>) -> tensor<32x605184xf32>
    %v3328 = stablehlo.multiply %v3327, %v3327 : tensor<32x605184xf32>
    %v3329 = stablehlo.multiply %v3328, %v3327 : tensor<32x605184xf32>
    %v3330 = stablehlo.constant dense<0.044715> : tensor<32x605184xf32>
    %v3331 = stablehlo.multiply %v3330, %v3329 : tensor<32x605184xf32>
    %v3332 = stablehlo.add %v3327, %v3331 : tensor<32x605184xf32>
    %v3333 = stablehlo.constant dense<0.7978845608028654> : tensor<32x605184xf32>
    %v3334 = stablehlo.multiply %v3333, %v3332 : tensor<32x605184xf32>
    %v3335 = stablehlo.tanh %v3334 : tensor<32x605184xf32>
    %v3336 = stablehlo.constant dense<1.0> : tensor<32x605184xf32>
    %v3337 = stablehlo.add %v3336, %v3335 : tensor<32x605184xf32>
    %v3338 = stablehlo.constant dense<0.5> : tensor<32x605184xf32>
    %v3339 = stablehlo.multiply %v3338, %v3327 : tensor<32x605184xf32>
    %v3340 = stablehlo.multiply %v3339, %v3337 : tensor<32x605184xf32>
    %v3341 = stablehlo.reshape %v3340 : (tensor<32x605184xf32>) -> tensor<32x197x3072xf32>
    %v3342 = stablehlo.dot_general %v3341, %b5_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x3072xf32>, tensor<3072x768xf32>) -> tensor<32x197x768xf32>
    %v3343 = stablehlo.broadcast_in_dim %b5_bfc2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3344 = stablehlo.add %v3342, %v3343 : tensor<32x197x768xf32>
    %v3345 = stablehlo.reshape %v3344 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3346 = stablehlo.add %v3294, %v3345 : tensor<32x151296xf32>
    %v3347 = stablehlo.reshape %v3346 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3348 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3349 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v3350 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v3351 = stablehlo.reduce(%v3347 init: %v3348) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3352 = stablehlo.broadcast_in_dim %v3351, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v3353 = stablehlo.divide %v3352, %v3349 : tensor<32x197x768xf32>
    %v3354 = stablehlo.subtract %v3347, %v3353 : tensor<32x197x768xf32>
    %v3355 = stablehlo.multiply %v3354, %v3354 : tensor<32x197x768xf32>
    %v3356 = stablehlo.reduce(%v3355 init: %v3348) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3357 = stablehlo.broadcast_in_dim %v3356, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v3358 = stablehlo.divide %v3357, %v3349 : tensor<32x197x768xf32>
    %v3359 = stablehlo.add %v3358, %v3350 : tensor<32x197x768xf32>
    %v3360 = stablehlo.rsqrt %v3359 : tensor<32x197x768xf32>
    %v3361 = stablehlo.multiply %v3354, %v3360 : tensor<32x197x768xf32>
    %v3362 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v3363 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v3364 = stablehlo.multiply %v3361, %v3362 : tensor<32x197x768xf32>
    %v3365 = stablehlo.add %v3364, %v3363 : tensor<32x197x768xf32>
    %v3366 = stablehlo.reshape %v3365 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3367 = stablehlo.reshape %v3366 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3368 = stablehlo.broadcast_in_dim %b6_g1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3369 = stablehlo.multiply %v3367, %v3368 : tensor<32x197x768xf32>
    %v3370 = stablehlo.reshape %v3369 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3371 = stablehlo.reshape %v3370 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3372 = stablehlo.broadcast_in_dim %b6_bt1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3373 = stablehlo.add %v3371, %v3372 : tensor<32x197x768xf32>
    %v3374 = stablehlo.reshape %v3373 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3375 = stablehlo.reshape %v3374 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3376 = stablehlo.dot_general %v3375, %b6_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v3377 = stablehlo.broadcast_in_dim %b6_bq, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3378 = stablehlo.add %v3376, %v3377 : tensor<32x197x768xf32>
    %v3379 = stablehlo.reshape %v3378 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3380 = stablehlo.reshape %v3374 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3381 = stablehlo.dot_general %v3380, %b6_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v3382 = stablehlo.broadcast_in_dim %b6_bk, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3383 = stablehlo.add %v3381, %v3382 : tensor<32x197x768xf32>
    %v3384 = stablehlo.reshape %v3383 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3385 = stablehlo.reshape %v3374 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3386 = stablehlo.dot_general %v3385, %b6_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v3387 = stablehlo.broadcast_in_dim %b6_bv, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3388 = stablehlo.add %v3386, %v3387 : tensor<32x197x768xf32>
    %v3389 = stablehlo.reshape %v3388 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3390 = stablehlo.reshape %v3379 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3391 = stablehlo.slice %v3390 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3392 = stablehlo.reshape %v3391 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3393 = stablehlo.reshape %v3384 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3394 = stablehlo.slice %v3393 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3395 = stablehlo.reshape %v3394 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3396 = stablehlo.reshape %v3389 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3397 = stablehlo.slice %v3396 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3398 = stablehlo.reshape %v3397 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3399 = stablehlo.reshape %v3395 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3400 = stablehlo.transpose %v3399, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3401 = stablehlo.reshape %v3400 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3402 = stablehlo.reshape %v3392 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3403 = stablehlo.reshape %v3401 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3404 = stablehlo.dot_general %v3402, %v3403, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3405 = stablehlo.reshape %v3404 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3406 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3407 = stablehlo.multiply %v3405, %v3406 : tensor<32x38809xf32>
    %v3408 = stablehlo.reshape %v3407 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3409 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3410 = stablehlo.reduce(%v3408 init: %v3409) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3411 = stablehlo.broadcast_in_dim %v3410, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3412 = stablehlo.subtract %v3408, %v3411 : tensor<32x197x197xf32>
    %v3413 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3414 = stablehlo.exponential %v3412 : tensor<32x197x197xf32>
    %v3415 = stablehlo.reduce(%v3414 init: %v3413) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3416 = stablehlo.broadcast_in_dim %v3415, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3417 = stablehlo.divide %v3414, %v3416 : tensor<32x197x197xf32>
    %v3418 = stablehlo.reshape %v3417 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3419 = stablehlo.reshape %v3418 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3420 = stablehlo.reshape %v3398 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3421 = stablehlo.dot_general %v3419, %v3420, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3422 = stablehlo.reshape %v3421 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3423 = stablehlo.reshape %v3422 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3424 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3425 = stablehlo.pad %v3423, %v3424, low = [0, 0, 0], high = [0, 0, 704], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3426 = stablehlo.reshape %v3425 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3427 = stablehlo.reshape %v3379 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3428 = stablehlo.slice %v3427 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3429 = stablehlo.reshape %v3428 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3430 = stablehlo.reshape %v3384 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3431 = stablehlo.slice %v3430 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3432 = stablehlo.reshape %v3431 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3433 = stablehlo.reshape %v3389 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3434 = stablehlo.slice %v3433 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3435 = stablehlo.reshape %v3434 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3436 = stablehlo.reshape %v3432 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3437 = stablehlo.transpose %v3436, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3438 = stablehlo.reshape %v3437 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3439 = stablehlo.reshape %v3429 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3440 = stablehlo.reshape %v3438 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3441 = stablehlo.dot_general %v3439, %v3440, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3442 = stablehlo.reshape %v3441 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3443 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3444 = stablehlo.multiply %v3442, %v3443 : tensor<32x38809xf32>
    %v3445 = stablehlo.reshape %v3444 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3446 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3447 = stablehlo.reduce(%v3445 init: %v3446) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3448 = stablehlo.broadcast_in_dim %v3447, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3449 = stablehlo.subtract %v3445, %v3448 : tensor<32x197x197xf32>
    %v3450 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3451 = stablehlo.exponential %v3449 : tensor<32x197x197xf32>
    %v3452 = stablehlo.reduce(%v3451 init: %v3450) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3453 = stablehlo.broadcast_in_dim %v3452, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3454 = stablehlo.divide %v3451, %v3453 : tensor<32x197x197xf32>
    %v3455 = stablehlo.reshape %v3454 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3456 = stablehlo.reshape %v3455 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3457 = stablehlo.reshape %v3435 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3458 = stablehlo.dot_general %v3456, %v3457, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3459 = stablehlo.reshape %v3458 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3460 = stablehlo.reshape %v3459 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3461 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3462 = stablehlo.pad %v3460, %v3461, low = [0, 0, 64], high = [0, 0, 640], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3463 = stablehlo.reshape %v3462 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3464 = stablehlo.add %v3426, %v3463 : tensor<32x151296xf32>
    %v3465 = stablehlo.reshape %v3379 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3466 = stablehlo.slice %v3465 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3467 = stablehlo.reshape %v3466 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3468 = stablehlo.reshape %v3384 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3469 = stablehlo.slice %v3468 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3470 = stablehlo.reshape %v3469 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3471 = stablehlo.reshape %v3389 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3472 = stablehlo.slice %v3471 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3473 = stablehlo.reshape %v3472 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3474 = stablehlo.reshape %v3470 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3475 = stablehlo.transpose %v3474, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3476 = stablehlo.reshape %v3475 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3477 = stablehlo.reshape %v3467 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3478 = stablehlo.reshape %v3476 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3479 = stablehlo.dot_general %v3477, %v3478, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3480 = stablehlo.reshape %v3479 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3481 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3482 = stablehlo.multiply %v3480, %v3481 : tensor<32x38809xf32>
    %v3483 = stablehlo.reshape %v3482 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3484 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3485 = stablehlo.reduce(%v3483 init: %v3484) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3486 = stablehlo.broadcast_in_dim %v3485, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3487 = stablehlo.subtract %v3483, %v3486 : tensor<32x197x197xf32>
    %v3488 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3489 = stablehlo.exponential %v3487 : tensor<32x197x197xf32>
    %v3490 = stablehlo.reduce(%v3489 init: %v3488) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3491 = stablehlo.broadcast_in_dim %v3490, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3492 = stablehlo.divide %v3489, %v3491 : tensor<32x197x197xf32>
    %v3493 = stablehlo.reshape %v3492 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3494 = stablehlo.reshape %v3493 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3495 = stablehlo.reshape %v3473 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3496 = stablehlo.dot_general %v3494, %v3495, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3497 = stablehlo.reshape %v3496 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3498 = stablehlo.reshape %v3497 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3499 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3500 = stablehlo.pad %v3498, %v3499, low = [0, 0, 128], high = [0, 0, 576], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3501 = stablehlo.reshape %v3500 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3502 = stablehlo.add %v3464, %v3501 : tensor<32x151296xf32>
    %v3503 = stablehlo.reshape %v3379 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3504 = stablehlo.slice %v3503 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3505 = stablehlo.reshape %v3504 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3506 = stablehlo.reshape %v3384 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3507 = stablehlo.slice %v3506 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3508 = stablehlo.reshape %v3507 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3509 = stablehlo.reshape %v3389 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3510 = stablehlo.slice %v3509 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3511 = stablehlo.reshape %v3510 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3512 = stablehlo.reshape %v3508 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3513 = stablehlo.transpose %v3512, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3514 = stablehlo.reshape %v3513 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3515 = stablehlo.reshape %v3505 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3516 = stablehlo.reshape %v3514 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3517 = stablehlo.dot_general %v3515, %v3516, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3518 = stablehlo.reshape %v3517 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3519 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3520 = stablehlo.multiply %v3518, %v3519 : tensor<32x38809xf32>
    %v3521 = stablehlo.reshape %v3520 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3522 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3523 = stablehlo.reduce(%v3521 init: %v3522) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3524 = stablehlo.broadcast_in_dim %v3523, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3525 = stablehlo.subtract %v3521, %v3524 : tensor<32x197x197xf32>
    %v3526 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3527 = stablehlo.exponential %v3525 : tensor<32x197x197xf32>
    %v3528 = stablehlo.reduce(%v3527 init: %v3526) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3529 = stablehlo.broadcast_in_dim %v3528, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3530 = stablehlo.divide %v3527, %v3529 : tensor<32x197x197xf32>
    %v3531 = stablehlo.reshape %v3530 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3532 = stablehlo.reshape %v3531 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3533 = stablehlo.reshape %v3511 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3534 = stablehlo.dot_general %v3532, %v3533, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3535 = stablehlo.reshape %v3534 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3536 = stablehlo.reshape %v3535 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3537 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3538 = stablehlo.pad %v3536, %v3537, low = [0, 0, 192], high = [0, 0, 512], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3539 = stablehlo.reshape %v3538 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3540 = stablehlo.add %v3502, %v3539 : tensor<32x151296xf32>
    %v3541 = stablehlo.reshape %v3379 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3542 = stablehlo.slice %v3541 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3543 = stablehlo.reshape %v3542 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3544 = stablehlo.reshape %v3384 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3545 = stablehlo.slice %v3544 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3546 = stablehlo.reshape %v3545 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3547 = stablehlo.reshape %v3389 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3548 = stablehlo.slice %v3547 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3549 = stablehlo.reshape %v3548 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3550 = stablehlo.reshape %v3546 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3551 = stablehlo.transpose %v3550, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3552 = stablehlo.reshape %v3551 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3553 = stablehlo.reshape %v3543 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3554 = stablehlo.reshape %v3552 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3555 = stablehlo.dot_general %v3553, %v3554, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3556 = stablehlo.reshape %v3555 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3557 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3558 = stablehlo.multiply %v3556, %v3557 : tensor<32x38809xf32>
    %v3559 = stablehlo.reshape %v3558 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3560 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3561 = stablehlo.reduce(%v3559 init: %v3560) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3562 = stablehlo.broadcast_in_dim %v3561, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3563 = stablehlo.subtract %v3559, %v3562 : tensor<32x197x197xf32>
    %v3564 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3565 = stablehlo.exponential %v3563 : tensor<32x197x197xf32>
    %v3566 = stablehlo.reduce(%v3565 init: %v3564) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3567 = stablehlo.broadcast_in_dim %v3566, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3568 = stablehlo.divide %v3565, %v3567 : tensor<32x197x197xf32>
    %v3569 = stablehlo.reshape %v3568 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3570 = stablehlo.reshape %v3569 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3571 = stablehlo.reshape %v3549 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3572 = stablehlo.dot_general %v3570, %v3571, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3573 = stablehlo.reshape %v3572 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3574 = stablehlo.reshape %v3573 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3575 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3576 = stablehlo.pad %v3574, %v3575, low = [0, 0, 256], high = [0, 0, 448], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3577 = stablehlo.reshape %v3576 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3578 = stablehlo.add %v3540, %v3577 : tensor<32x151296xf32>
    %v3579 = stablehlo.reshape %v3379 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3580 = stablehlo.slice %v3579 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3581 = stablehlo.reshape %v3580 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3582 = stablehlo.reshape %v3384 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3583 = stablehlo.slice %v3582 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3584 = stablehlo.reshape %v3583 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3585 = stablehlo.reshape %v3389 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3586 = stablehlo.slice %v3585 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3587 = stablehlo.reshape %v3586 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3588 = stablehlo.reshape %v3584 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3589 = stablehlo.transpose %v3588, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3590 = stablehlo.reshape %v3589 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3591 = stablehlo.reshape %v3581 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3592 = stablehlo.reshape %v3590 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3593 = stablehlo.dot_general %v3591, %v3592, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3594 = stablehlo.reshape %v3593 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3595 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3596 = stablehlo.multiply %v3594, %v3595 : tensor<32x38809xf32>
    %v3597 = stablehlo.reshape %v3596 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3598 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3599 = stablehlo.reduce(%v3597 init: %v3598) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3600 = stablehlo.broadcast_in_dim %v3599, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3601 = stablehlo.subtract %v3597, %v3600 : tensor<32x197x197xf32>
    %v3602 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3603 = stablehlo.exponential %v3601 : tensor<32x197x197xf32>
    %v3604 = stablehlo.reduce(%v3603 init: %v3602) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3605 = stablehlo.broadcast_in_dim %v3604, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3606 = stablehlo.divide %v3603, %v3605 : tensor<32x197x197xf32>
    %v3607 = stablehlo.reshape %v3606 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3608 = stablehlo.reshape %v3607 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3609 = stablehlo.reshape %v3587 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3610 = stablehlo.dot_general %v3608, %v3609, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3611 = stablehlo.reshape %v3610 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3612 = stablehlo.reshape %v3611 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3613 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3614 = stablehlo.pad %v3612, %v3613, low = [0, 0, 320], high = [0, 0, 384], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3615 = stablehlo.reshape %v3614 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3616 = stablehlo.add %v3578, %v3615 : tensor<32x151296xf32>
    %v3617 = stablehlo.reshape %v3379 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3618 = stablehlo.slice %v3617 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3619 = stablehlo.reshape %v3618 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3620 = stablehlo.reshape %v3384 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3621 = stablehlo.slice %v3620 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3622 = stablehlo.reshape %v3621 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3623 = stablehlo.reshape %v3389 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3624 = stablehlo.slice %v3623 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3625 = stablehlo.reshape %v3624 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3626 = stablehlo.reshape %v3622 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3627 = stablehlo.transpose %v3626, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3628 = stablehlo.reshape %v3627 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3629 = stablehlo.reshape %v3619 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3630 = stablehlo.reshape %v3628 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3631 = stablehlo.dot_general %v3629, %v3630, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3632 = stablehlo.reshape %v3631 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3633 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3634 = stablehlo.multiply %v3632, %v3633 : tensor<32x38809xf32>
    %v3635 = stablehlo.reshape %v3634 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3636 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3637 = stablehlo.reduce(%v3635 init: %v3636) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3638 = stablehlo.broadcast_in_dim %v3637, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3639 = stablehlo.subtract %v3635, %v3638 : tensor<32x197x197xf32>
    %v3640 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3641 = stablehlo.exponential %v3639 : tensor<32x197x197xf32>
    %v3642 = stablehlo.reduce(%v3641 init: %v3640) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3643 = stablehlo.broadcast_in_dim %v3642, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3644 = stablehlo.divide %v3641, %v3643 : tensor<32x197x197xf32>
    %v3645 = stablehlo.reshape %v3644 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3646 = stablehlo.reshape %v3645 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3647 = stablehlo.reshape %v3625 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3648 = stablehlo.dot_general %v3646, %v3647, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3649 = stablehlo.reshape %v3648 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3650 = stablehlo.reshape %v3649 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3651 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3652 = stablehlo.pad %v3650, %v3651, low = [0, 0, 384], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3653 = stablehlo.reshape %v3652 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3654 = stablehlo.add %v3616, %v3653 : tensor<32x151296xf32>
    %v3655 = stablehlo.reshape %v3379 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3656 = stablehlo.slice %v3655 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3657 = stablehlo.reshape %v3656 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3658 = stablehlo.reshape %v3384 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3659 = stablehlo.slice %v3658 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3660 = stablehlo.reshape %v3659 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3661 = stablehlo.reshape %v3389 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3662 = stablehlo.slice %v3661 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3663 = stablehlo.reshape %v3662 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3664 = stablehlo.reshape %v3660 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3665 = stablehlo.transpose %v3664, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3666 = stablehlo.reshape %v3665 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3667 = stablehlo.reshape %v3657 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3668 = stablehlo.reshape %v3666 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3669 = stablehlo.dot_general %v3667, %v3668, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3670 = stablehlo.reshape %v3669 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3671 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3672 = stablehlo.multiply %v3670, %v3671 : tensor<32x38809xf32>
    %v3673 = stablehlo.reshape %v3672 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3674 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3675 = stablehlo.reduce(%v3673 init: %v3674) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3676 = stablehlo.broadcast_in_dim %v3675, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3677 = stablehlo.subtract %v3673, %v3676 : tensor<32x197x197xf32>
    %v3678 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3679 = stablehlo.exponential %v3677 : tensor<32x197x197xf32>
    %v3680 = stablehlo.reduce(%v3679 init: %v3678) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3681 = stablehlo.broadcast_in_dim %v3680, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3682 = stablehlo.divide %v3679, %v3681 : tensor<32x197x197xf32>
    %v3683 = stablehlo.reshape %v3682 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3684 = stablehlo.reshape %v3683 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3685 = stablehlo.reshape %v3663 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3686 = stablehlo.dot_general %v3684, %v3685, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3687 = stablehlo.reshape %v3686 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3688 = stablehlo.reshape %v3687 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3689 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3690 = stablehlo.pad %v3688, %v3689, low = [0, 0, 448], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3691 = stablehlo.reshape %v3690 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3692 = stablehlo.add %v3654, %v3691 : tensor<32x151296xf32>
    %v3693 = stablehlo.reshape %v3379 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3694 = stablehlo.slice %v3693 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3695 = stablehlo.reshape %v3694 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3696 = stablehlo.reshape %v3384 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3697 = stablehlo.slice %v3696 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3698 = stablehlo.reshape %v3697 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3699 = stablehlo.reshape %v3389 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3700 = stablehlo.slice %v3699 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3701 = stablehlo.reshape %v3700 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3702 = stablehlo.reshape %v3698 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3703 = stablehlo.transpose %v3702, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3704 = stablehlo.reshape %v3703 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3705 = stablehlo.reshape %v3695 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3706 = stablehlo.reshape %v3704 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3707 = stablehlo.dot_general %v3705, %v3706, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3708 = stablehlo.reshape %v3707 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3709 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3710 = stablehlo.multiply %v3708, %v3709 : tensor<32x38809xf32>
    %v3711 = stablehlo.reshape %v3710 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3712 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3713 = stablehlo.reduce(%v3711 init: %v3712) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3714 = stablehlo.broadcast_in_dim %v3713, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3715 = stablehlo.subtract %v3711, %v3714 : tensor<32x197x197xf32>
    %v3716 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3717 = stablehlo.exponential %v3715 : tensor<32x197x197xf32>
    %v3718 = stablehlo.reduce(%v3717 init: %v3716) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3719 = stablehlo.broadcast_in_dim %v3718, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3720 = stablehlo.divide %v3717, %v3719 : tensor<32x197x197xf32>
    %v3721 = stablehlo.reshape %v3720 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3722 = stablehlo.reshape %v3721 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3723 = stablehlo.reshape %v3701 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3724 = stablehlo.dot_general %v3722, %v3723, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3725 = stablehlo.reshape %v3724 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3726 = stablehlo.reshape %v3725 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3727 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3728 = stablehlo.pad %v3726, %v3727, low = [0, 0, 512], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3729 = stablehlo.reshape %v3728 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3730 = stablehlo.add %v3692, %v3729 : tensor<32x151296xf32>
    %v3731 = stablehlo.reshape %v3379 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3732 = stablehlo.slice %v3731 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3733 = stablehlo.reshape %v3732 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3734 = stablehlo.reshape %v3384 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3735 = stablehlo.slice %v3734 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3736 = stablehlo.reshape %v3735 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3737 = stablehlo.reshape %v3389 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3738 = stablehlo.slice %v3737 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3739 = stablehlo.reshape %v3738 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3740 = stablehlo.reshape %v3736 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3741 = stablehlo.transpose %v3740, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3742 = stablehlo.reshape %v3741 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3743 = stablehlo.reshape %v3733 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3744 = stablehlo.reshape %v3742 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3745 = stablehlo.dot_general %v3743, %v3744, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3746 = stablehlo.reshape %v3745 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3747 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3748 = stablehlo.multiply %v3746, %v3747 : tensor<32x38809xf32>
    %v3749 = stablehlo.reshape %v3748 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3750 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3751 = stablehlo.reduce(%v3749 init: %v3750) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3752 = stablehlo.broadcast_in_dim %v3751, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3753 = stablehlo.subtract %v3749, %v3752 : tensor<32x197x197xf32>
    %v3754 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3755 = stablehlo.exponential %v3753 : tensor<32x197x197xf32>
    %v3756 = stablehlo.reduce(%v3755 init: %v3754) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3757 = stablehlo.broadcast_in_dim %v3756, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3758 = stablehlo.divide %v3755, %v3757 : tensor<32x197x197xf32>
    %v3759 = stablehlo.reshape %v3758 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3760 = stablehlo.reshape %v3759 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3761 = stablehlo.reshape %v3739 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3762 = stablehlo.dot_general %v3760, %v3761, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3763 = stablehlo.reshape %v3762 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3764 = stablehlo.reshape %v3763 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3765 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3766 = stablehlo.pad %v3764, %v3765, low = [0, 0, 576], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3767 = stablehlo.reshape %v3766 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3768 = stablehlo.add %v3730, %v3767 : tensor<32x151296xf32>
    %v3769 = stablehlo.reshape %v3379 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3770 = stablehlo.slice %v3769 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3771 = stablehlo.reshape %v3770 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3772 = stablehlo.reshape %v3384 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3773 = stablehlo.slice %v3772 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3774 = stablehlo.reshape %v3773 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3775 = stablehlo.reshape %v3389 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3776 = stablehlo.slice %v3775 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3777 = stablehlo.reshape %v3776 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3778 = stablehlo.reshape %v3774 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3779 = stablehlo.transpose %v3778, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3780 = stablehlo.reshape %v3779 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3781 = stablehlo.reshape %v3771 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3782 = stablehlo.reshape %v3780 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3783 = stablehlo.dot_general %v3781, %v3782, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3784 = stablehlo.reshape %v3783 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3785 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3786 = stablehlo.multiply %v3784, %v3785 : tensor<32x38809xf32>
    %v3787 = stablehlo.reshape %v3786 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3788 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3789 = stablehlo.reduce(%v3787 init: %v3788) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3790 = stablehlo.broadcast_in_dim %v3789, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3791 = stablehlo.subtract %v3787, %v3790 : tensor<32x197x197xf32>
    %v3792 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3793 = stablehlo.exponential %v3791 : tensor<32x197x197xf32>
    %v3794 = stablehlo.reduce(%v3793 init: %v3792) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3795 = stablehlo.broadcast_in_dim %v3794, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3796 = stablehlo.divide %v3793, %v3795 : tensor<32x197x197xf32>
    %v3797 = stablehlo.reshape %v3796 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3798 = stablehlo.reshape %v3797 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3799 = stablehlo.reshape %v3777 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3800 = stablehlo.dot_general %v3798, %v3799, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3801 = stablehlo.reshape %v3800 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3802 = stablehlo.reshape %v3801 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3803 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3804 = stablehlo.pad %v3802, %v3803, low = [0, 0, 640], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3805 = stablehlo.reshape %v3804 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3806 = stablehlo.add %v3768, %v3805 : tensor<32x151296xf32>
    %v3807 = stablehlo.reshape %v3379 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3808 = stablehlo.slice %v3807 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3809 = stablehlo.reshape %v3808 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3810 = stablehlo.reshape %v3384 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3811 = stablehlo.slice %v3810 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3812 = stablehlo.reshape %v3811 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3813 = stablehlo.reshape %v3389 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3814 = stablehlo.slice %v3813 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3815 = stablehlo.reshape %v3814 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3816 = stablehlo.reshape %v3812 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3817 = stablehlo.transpose %v3816, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3818 = stablehlo.reshape %v3817 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3819 = stablehlo.reshape %v3809 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3820 = stablehlo.reshape %v3818 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3821 = stablehlo.dot_general %v3819, %v3820, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3822 = stablehlo.reshape %v3821 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3823 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3824 = stablehlo.multiply %v3822, %v3823 : tensor<32x38809xf32>
    %v3825 = stablehlo.reshape %v3824 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3826 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3827 = stablehlo.reduce(%v3825 init: %v3826) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3828 = stablehlo.broadcast_in_dim %v3827, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3829 = stablehlo.subtract %v3825, %v3828 : tensor<32x197x197xf32>
    %v3830 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3831 = stablehlo.exponential %v3829 : tensor<32x197x197xf32>
    %v3832 = stablehlo.reduce(%v3831 init: %v3830) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3833 = stablehlo.broadcast_in_dim %v3832, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3834 = stablehlo.divide %v3831, %v3833 : tensor<32x197x197xf32>
    %v3835 = stablehlo.reshape %v3834 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3836 = stablehlo.reshape %v3835 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3837 = stablehlo.reshape %v3815 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3838 = stablehlo.dot_general %v3836, %v3837, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3839 = stablehlo.reshape %v3838 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3840 = stablehlo.reshape %v3839 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3841 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3842 = stablehlo.pad %v3840, %v3841, low = [0, 0, 704], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3843 = stablehlo.reshape %v3842 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3844 = stablehlo.add %v3806, %v3843 : tensor<32x151296xf32>
    %v3845 = stablehlo.reshape %v3844 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3846 = stablehlo.dot_general %v3845, %b6_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v3847 = stablehlo.broadcast_in_dim %b6_bo, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3848 = stablehlo.add %v3846, %v3847 : tensor<32x197x768xf32>
    %v3849 = stablehlo.reshape %v3848 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3850 = stablehlo.add %v3346, %v3849 : tensor<32x151296xf32>
    %v3851 = stablehlo.reshape %v3850 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3852 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3853 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v3854 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v3855 = stablehlo.reduce(%v3851 init: %v3852) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3856 = stablehlo.broadcast_in_dim %v3855, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v3857 = stablehlo.divide %v3856, %v3853 : tensor<32x197x768xf32>
    %v3858 = stablehlo.subtract %v3851, %v3857 : tensor<32x197x768xf32>
    %v3859 = stablehlo.multiply %v3858, %v3858 : tensor<32x197x768xf32>
    %v3860 = stablehlo.reduce(%v3859 init: %v3852) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3861 = stablehlo.broadcast_in_dim %v3860, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v3862 = stablehlo.divide %v3861, %v3853 : tensor<32x197x768xf32>
    %v3863 = stablehlo.add %v3862, %v3854 : tensor<32x197x768xf32>
    %v3864 = stablehlo.rsqrt %v3863 : tensor<32x197x768xf32>
    %v3865 = stablehlo.multiply %v3858, %v3864 : tensor<32x197x768xf32>
    %v3866 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v3867 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v3868 = stablehlo.multiply %v3865, %v3866 : tensor<32x197x768xf32>
    %v3869 = stablehlo.add %v3868, %v3867 : tensor<32x197x768xf32>
    %v3870 = stablehlo.reshape %v3869 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3871 = stablehlo.reshape %v3870 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3872 = stablehlo.broadcast_in_dim %b6_g2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3873 = stablehlo.multiply %v3871, %v3872 : tensor<32x197x768xf32>
    %v3874 = stablehlo.reshape %v3873 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3875 = stablehlo.reshape %v3874 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3876 = stablehlo.broadcast_in_dim %b6_bt2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3877 = stablehlo.add %v3875, %v3876 : tensor<32x197x768xf32>
    %v3878 = stablehlo.reshape %v3877 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3879 = stablehlo.reshape %v3878 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3880 = stablehlo.dot_general %v3879, %b6_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x3072xf32>) -> tensor<32x197x3072xf32>
    %v3881 = stablehlo.broadcast_in_dim %b6_bfc1, dims = [2] : (tensor<3072xf32>) -> tensor<32x197x3072xf32>
    %v3882 = stablehlo.add %v3880, %v3881 : tensor<32x197x3072xf32>
    %v3883 = stablehlo.reshape %v3882 : (tensor<32x197x3072xf32>) -> tensor<32x605184xf32>
    %v3884 = stablehlo.multiply %v3883, %v3883 : tensor<32x605184xf32>
    %v3885 = stablehlo.multiply %v3884, %v3883 : tensor<32x605184xf32>
    %v3886 = stablehlo.constant dense<0.044715> : tensor<32x605184xf32>
    %v3887 = stablehlo.multiply %v3886, %v3885 : tensor<32x605184xf32>
    %v3888 = stablehlo.add %v3883, %v3887 : tensor<32x605184xf32>
    %v3889 = stablehlo.constant dense<0.7978845608028654> : tensor<32x605184xf32>
    %v3890 = stablehlo.multiply %v3889, %v3888 : tensor<32x605184xf32>
    %v3891 = stablehlo.tanh %v3890 : tensor<32x605184xf32>
    %v3892 = stablehlo.constant dense<1.0> : tensor<32x605184xf32>
    %v3893 = stablehlo.add %v3892, %v3891 : tensor<32x605184xf32>
    %v3894 = stablehlo.constant dense<0.5> : tensor<32x605184xf32>
    %v3895 = stablehlo.multiply %v3894, %v3883 : tensor<32x605184xf32>
    %v3896 = stablehlo.multiply %v3895, %v3893 : tensor<32x605184xf32>
    %v3897 = stablehlo.reshape %v3896 : (tensor<32x605184xf32>) -> tensor<32x197x3072xf32>
    %v3898 = stablehlo.dot_general %v3897, %b6_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x3072xf32>, tensor<3072x768xf32>) -> tensor<32x197x768xf32>
    %v3899 = stablehlo.broadcast_in_dim %b6_bfc2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3900 = stablehlo.add %v3898, %v3899 : tensor<32x197x768xf32>
    %v3901 = stablehlo.reshape %v3900 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3902 = stablehlo.add %v3850, %v3901 : tensor<32x151296xf32>
    %v3903 = stablehlo.reshape %v3902 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3904 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3905 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v3906 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v3907 = stablehlo.reduce(%v3903 init: %v3904) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3908 = stablehlo.broadcast_in_dim %v3907, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v3909 = stablehlo.divide %v3908, %v3905 : tensor<32x197x768xf32>
    %v3910 = stablehlo.subtract %v3903, %v3909 : tensor<32x197x768xf32>
    %v3911 = stablehlo.multiply %v3910, %v3910 : tensor<32x197x768xf32>
    %v3912 = stablehlo.reduce(%v3911 init: %v3904) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3913 = stablehlo.broadcast_in_dim %v3912, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v3914 = stablehlo.divide %v3913, %v3905 : tensor<32x197x768xf32>
    %v3915 = stablehlo.add %v3914, %v3906 : tensor<32x197x768xf32>
    %v3916 = stablehlo.rsqrt %v3915 : tensor<32x197x768xf32>
    %v3917 = stablehlo.multiply %v3910, %v3916 : tensor<32x197x768xf32>
    %v3918 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v3919 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v3920 = stablehlo.multiply %v3917, %v3918 : tensor<32x197x768xf32>
    %v3921 = stablehlo.add %v3920, %v3919 : tensor<32x197x768xf32>
    %v3922 = stablehlo.reshape %v3921 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3923 = stablehlo.reshape %v3922 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3924 = stablehlo.broadcast_in_dim %b7_g1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3925 = stablehlo.multiply %v3923, %v3924 : tensor<32x197x768xf32>
    %v3926 = stablehlo.reshape %v3925 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3927 = stablehlo.reshape %v3926 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3928 = stablehlo.broadcast_in_dim %b7_bt1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3929 = stablehlo.add %v3927, %v3928 : tensor<32x197x768xf32>
    %v3930 = stablehlo.reshape %v3929 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3931 = stablehlo.reshape %v3930 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3932 = stablehlo.dot_general %v3931, %b7_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v3933 = stablehlo.broadcast_in_dim %b7_bq, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3934 = stablehlo.add %v3932, %v3933 : tensor<32x197x768xf32>
    %v3935 = stablehlo.reshape %v3934 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3936 = stablehlo.reshape %v3930 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3937 = stablehlo.dot_general %v3936, %b7_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v3938 = stablehlo.broadcast_in_dim %b7_bk, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3939 = stablehlo.add %v3937, %v3938 : tensor<32x197x768xf32>
    %v3940 = stablehlo.reshape %v3939 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3941 = stablehlo.reshape %v3930 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3942 = stablehlo.dot_general %v3941, %b7_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v3943 = stablehlo.broadcast_in_dim %b7_bv, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v3944 = stablehlo.add %v3942, %v3943 : tensor<32x197x768xf32>
    %v3945 = stablehlo.reshape %v3944 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3946 = stablehlo.reshape %v3935 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3947 = stablehlo.slice %v3946 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3948 = stablehlo.reshape %v3947 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3949 = stablehlo.reshape %v3940 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3950 = stablehlo.slice %v3949 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3951 = stablehlo.reshape %v3950 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3952 = stablehlo.reshape %v3945 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3953 = stablehlo.slice %v3952 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3954 = stablehlo.reshape %v3953 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3955 = stablehlo.reshape %v3951 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3956 = stablehlo.transpose %v3955, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3957 = stablehlo.reshape %v3956 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3958 = stablehlo.reshape %v3948 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3959 = stablehlo.reshape %v3957 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3960 = stablehlo.dot_general %v3958, %v3959, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3961 = stablehlo.reshape %v3960 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3962 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v3963 = stablehlo.multiply %v3961, %v3962 : tensor<32x38809xf32>
    %v3964 = stablehlo.reshape %v3963 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3965 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3966 = stablehlo.reduce(%v3964 init: %v3965) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3967 = stablehlo.broadcast_in_dim %v3966, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3968 = stablehlo.subtract %v3964, %v3967 : tensor<32x197x197xf32>
    %v3969 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3970 = stablehlo.exponential %v3968 : tensor<32x197x197xf32>
    %v3971 = stablehlo.reduce(%v3970 init: %v3969) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v3972 = stablehlo.broadcast_in_dim %v3971, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v3973 = stablehlo.divide %v3970, %v3972 : tensor<32x197x197xf32>
    %v3974 = stablehlo.reshape %v3973 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3975 = stablehlo.reshape %v3974 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v3976 = stablehlo.reshape %v3954 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3977 = stablehlo.dot_general %v3975, %v3976, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v3978 = stablehlo.reshape %v3977 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3979 = stablehlo.reshape %v3978 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3980 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3981 = stablehlo.pad %v3979, %v3980, low = [0, 0, 0], high = [0, 0, 704], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v3982 = stablehlo.reshape %v3981 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v3983 = stablehlo.reshape %v3935 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3984 = stablehlo.slice %v3983 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3985 = stablehlo.reshape %v3984 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3986 = stablehlo.reshape %v3940 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3987 = stablehlo.slice %v3986 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3988 = stablehlo.reshape %v3987 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3989 = stablehlo.reshape %v3945 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v3990 = stablehlo.slice %v3989 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v3991 = stablehlo.reshape %v3990 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v3992 = stablehlo.reshape %v3988 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3993 = stablehlo.transpose %v3992, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v3994 = stablehlo.reshape %v3993 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v3995 = stablehlo.reshape %v3985 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v3996 = stablehlo.reshape %v3994 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v3997 = stablehlo.dot_general %v3995, %v3996, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v3998 = stablehlo.reshape %v3997 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v3999 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4000 = stablehlo.multiply %v3998, %v3999 : tensor<32x38809xf32>
    %v4001 = stablehlo.reshape %v4000 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4002 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4003 = stablehlo.reduce(%v4001 init: %v4002) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4004 = stablehlo.broadcast_in_dim %v4003, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4005 = stablehlo.subtract %v4001, %v4004 : tensor<32x197x197xf32>
    %v4006 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4007 = stablehlo.exponential %v4005 : tensor<32x197x197xf32>
    %v4008 = stablehlo.reduce(%v4007 init: %v4006) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4009 = stablehlo.broadcast_in_dim %v4008, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4010 = stablehlo.divide %v4007, %v4009 : tensor<32x197x197xf32>
    %v4011 = stablehlo.reshape %v4010 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4012 = stablehlo.reshape %v4011 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4013 = stablehlo.reshape %v3991 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4014 = stablehlo.dot_general %v4012, %v4013, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4015 = stablehlo.reshape %v4014 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4016 = stablehlo.reshape %v4015 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4017 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4018 = stablehlo.pad %v4016, %v4017, low = [0, 0, 64], high = [0, 0, 640], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4019 = stablehlo.reshape %v4018 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4020 = stablehlo.add %v3982, %v4019 : tensor<32x151296xf32>
    %v4021 = stablehlo.reshape %v3935 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4022 = stablehlo.slice %v4021 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4023 = stablehlo.reshape %v4022 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4024 = stablehlo.reshape %v3940 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4025 = stablehlo.slice %v4024 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4026 = stablehlo.reshape %v4025 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4027 = stablehlo.reshape %v3945 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4028 = stablehlo.slice %v4027 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4029 = stablehlo.reshape %v4028 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4030 = stablehlo.reshape %v4026 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4031 = stablehlo.transpose %v4030, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4032 = stablehlo.reshape %v4031 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4033 = stablehlo.reshape %v4023 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4034 = stablehlo.reshape %v4032 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4035 = stablehlo.dot_general %v4033, %v4034, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4036 = stablehlo.reshape %v4035 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4037 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4038 = stablehlo.multiply %v4036, %v4037 : tensor<32x38809xf32>
    %v4039 = stablehlo.reshape %v4038 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4040 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4041 = stablehlo.reduce(%v4039 init: %v4040) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4042 = stablehlo.broadcast_in_dim %v4041, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4043 = stablehlo.subtract %v4039, %v4042 : tensor<32x197x197xf32>
    %v4044 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4045 = stablehlo.exponential %v4043 : tensor<32x197x197xf32>
    %v4046 = stablehlo.reduce(%v4045 init: %v4044) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4047 = stablehlo.broadcast_in_dim %v4046, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4048 = stablehlo.divide %v4045, %v4047 : tensor<32x197x197xf32>
    %v4049 = stablehlo.reshape %v4048 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4050 = stablehlo.reshape %v4049 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4051 = stablehlo.reshape %v4029 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4052 = stablehlo.dot_general %v4050, %v4051, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4053 = stablehlo.reshape %v4052 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4054 = stablehlo.reshape %v4053 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4055 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4056 = stablehlo.pad %v4054, %v4055, low = [0, 0, 128], high = [0, 0, 576], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4057 = stablehlo.reshape %v4056 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4058 = stablehlo.add %v4020, %v4057 : tensor<32x151296xf32>
    %v4059 = stablehlo.reshape %v3935 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4060 = stablehlo.slice %v4059 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4061 = stablehlo.reshape %v4060 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4062 = stablehlo.reshape %v3940 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4063 = stablehlo.slice %v4062 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4064 = stablehlo.reshape %v4063 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4065 = stablehlo.reshape %v3945 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4066 = stablehlo.slice %v4065 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4067 = stablehlo.reshape %v4066 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4068 = stablehlo.reshape %v4064 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4069 = stablehlo.transpose %v4068, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4070 = stablehlo.reshape %v4069 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4071 = stablehlo.reshape %v4061 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4072 = stablehlo.reshape %v4070 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4073 = stablehlo.dot_general %v4071, %v4072, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4074 = stablehlo.reshape %v4073 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4075 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4076 = stablehlo.multiply %v4074, %v4075 : tensor<32x38809xf32>
    %v4077 = stablehlo.reshape %v4076 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4078 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4079 = stablehlo.reduce(%v4077 init: %v4078) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4080 = stablehlo.broadcast_in_dim %v4079, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4081 = stablehlo.subtract %v4077, %v4080 : tensor<32x197x197xf32>
    %v4082 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4083 = stablehlo.exponential %v4081 : tensor<32x197x197xf32>
    %v4084 = stablehlo.reduce(%v4083 init: %v4082) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4085 = stablehlo.broadcast_in_dim %v4084, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4086 = stablehlo.divide %v4083, %v4085 : tensor<32x197x197xf32>
    %v4087 = stablehlo.reshape %v4086 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4088 = stablehlo.reshape %v4087 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4089 = stablehlo.reshape %v4067 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4090 = stablehlo.dot_general %v4088, %v4089, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4091 = stablehlo.reshape %v4090 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4092 = stablehlo.reshape %v4091 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4093 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4094 = stablehlo.pad %v4092, %v4093, low = [0, 0, 192], high = [0, 0, 512], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4095 = stablehlo.reshape %v4094 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4096 = stablehlo.add %v4058, %v4095 : tensor<32x151296xf32>
    %v4097 = stablehlo.reshape %v3935 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4098 = stablehlo.slice %v4097 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4099 = stablehlo.reshape %v4098 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4100 = stablehlo.reshape %v3940 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4101 = stablehlo.slice %v4100 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4102 = stablehlo.reshape %v4101 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4103 = stablehlo.reshape %v3945 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4104 = stablehlo.slice %v4103 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4105 = stablehlo.reshape %v4104 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4106 = stablehlo.reshape %v4102 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4107 = stablehlo.transpose %v4106, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4108 = stablehlo.reshape %v4107 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4109 = stablehlo.reshape %v4099 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4110 = stablehlo.reshape %v4108 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4111 = stablehlo.dot_general %v4109, %v4110, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4112 = stablehlo.reshape %v4111 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4113 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4114 = stablehlo.multiply %v4112, %v4113 : tensor<32x38809xf32>
    %v4115 = stablehlo.reshape %v4114 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4116 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4117 = stablehlo.reduce(%v4115 init: %v4116) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4118 = stablehlo.broadcast_in_dim %v4117, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4119 = stablehlo.subtract %v4115, %v4118 : tensor<32x197x197xf32>
    %v4120 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4121 = stablehlo.exponential %v4119 : tensor<32x197x197xf32>
    %v4122 = stablehlo.reduce(%v4121 init: %v4120) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4123 = stablehlo.broadcast_in_dim %v4122, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4124 = stablehlo.divide %v4121, %v4123 : tensor<32x197x197xf32>
    %v4125 = stablehlo.reshape %v4124 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4126 = stablehlo.reshape %v4125 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4127 = stablehlo.reshape %v4105 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4128 = stablehlo.dot_general %v4126, %v4127, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4129 = stablehlo.reshape %v4128 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4130 = stablehlo.reshape %v4129 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4131 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4132 = stablehlo.pad %v4130, %v4131, low = [0, 0, 256], high = [0, 0, 448], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4133 = stablehlo.reshape %v4132 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4134 = stablehlo.add %v4096, %v4133 : tensor<32x151296xf32>
    %v4135 = stablehlo.reshape %v3935 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4136 = stablehlo.slice %v4135 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4137 = stablehlo.reshape %v4136 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4138 = stablehlo.reshape %v3940 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4139 = stablehlo.slice %v4138 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4140 = stablehlo.reshape %v4139 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4141 = stablehlo.reshape %v3945 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4142 = stablehlo.slice %v4141 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4143 = stablehlo.reshape %v4142 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4144 = stablehlo.reshape %v4140 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4145 = stablehlo.transpose %v4144, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4146 = stablehlo.reshape %v4145 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4147 = stablehlo.reshape %v4137 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4148 = stablehlo.reshape %v4146 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4149 = stablehlo.dot_general %v4147, %v4148, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4150 = stablehlo.reshape %v4149 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4151 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4152 = stablehlo.multiply %v4150, %v4151 : tensor<32x38809xf32>
    %v4153 = stablehlo.reshape %v4152 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4154 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4155 = stablehlo.reduce(%v4153 init: %v4154) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4156 = stablehlo.broadcast_in_dim %v4155, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4157 = stablehlo.subtract %v4153, %v4156 : tensor<32x197x197xf32>
    %v4158 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4159 = stablehlo.exponential %v4157 : tensor<32x197x197xf32>
    %v4160 = stablehlo.reduce(%v4159 init: %v4158) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4161 = stablehlo.broadcast_in_dim %v4160, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4162 = stablehlo.divide %v4159, %v4161 : tensor<32x197x197xf32>
    %v4163 = stablehlo.reshape %v4162 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4164 = stablehlo.reshape %v4163 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4165 = stablehlo.reshape %v4143 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4166 = stablehlo.dot_general %v4164, %v4165, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4167 = stablehlo.reshape %v4166 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4168 = stablehlo.reshape %v4167 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4169 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4170 = stablehlo.pad %v4168, %v4169, low = [0, 0, 320], high = [0, 0, 384], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4171 = stablehlo.reshape %v4170 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4172 = stablehlo.add %v4134, %v4171 : tensor<32x151296xf32>
    %v4173 = stablehlo.reshape %v3935 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4174 = stablehlo.slice %v4173 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4175 = stablehlo.reshape %v4174 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4176 = stablehlo.reshape %v3940 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4177 = stablehlo.slice %v4176 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4178 = stablehlo.reshape %v4177 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4179 = stablehlo.reshape %v3945 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4180 = stablehlo.slice %v4179 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4181 = stablehlo.reshape %v4180 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4182 = stablehlo.reshape %v4178 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4183 = stablehlo.transpose %v4182, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4184 = stablehlo.reshape %v4183 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4185 = stablehlo.reshape %v4175 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4186 = stablehlo.reshape %v4184 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4187 = stablehlo.dot_general %v4185, %v4186, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4188 = stablehlo.reshape %v4187 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4189 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4190 = stablehlo.multiply %v4188, %v4189 : tensor<32x38809xf32>
    %v4191 = stablehlo.reshape %v4190 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4192 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4193 = stablehlo.reduce(%v4191 init: %v4192) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4194 = stablehlo.broadcast_in_dim %v4193, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4195 = stablehlo.subtract %v4191, %v4194 : tensor<32x197x197xf32>
    %v4196 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4197 = stablehlo.exponential %v4195 : tensor<32x197x197xf32>
    %v4198 = stablehlo.reduce(%v4197 init: %v4196) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4199 = stablehlo.broadcast_in_dim %v4198, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4200 = stablehlo.divide %v4197, %v4199 : tensor<32x197x197xf32>
    %v4201 = stablehlo.reshape %v4200 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4202 = stablehlo.reshape %v4201 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4203 = stablehlo.reshape %v4181 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4204 = stablehlo.dot_general %v4202, %v4203, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4205 = stablehlo.reshape %v4204 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4206 = stablehlo.reshape %v4205 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4207 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4208 = stablehlo.pad %v4206, %v4207, low = [0, 0, 384], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4209 = stablehlo.reshape %v4208 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4210 = stablehlo.add %v4172, %v4209 : tensor<32x151296xf32>
    %v4211 = stablehlo.reshape %v3935 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4212 = stablehlo.slice %v4211 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4213 = stablehlo.reshape %v4212 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4214 = stablehlo.reshape %v3940 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4215 = stablehlo.slice %v4214 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4216 = stablehlo.reshape %v4215 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4217 = stablehlo.reshape %v3945 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4218 = stablehlo.slice %v4217 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4219 = stablehlo.reshape %v4218 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4220 = stablehlo.reshape %v4216 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4221 = stablehlo.transpose %v4220, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4222 = stablehlo.reshape %v4221 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4223 = stablehlo.reshape %v4213 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4224 = stablehlo.reshape %v4222 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4225 = stablehlo.dot_general %v4223, %v4224, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4226 = stablehlo.reshape %v4225 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4227 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4228 = stablehlo.multiply %v4226, %v4227 : tensor<32x38809xf32>
    %v4229 = stablehlo.reshape %v4228 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4230 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4231 = stablehlo.reduce(%v4229 init: %v4230) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4232 = stablehlo.broadcast_in_dim %v4231, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4233 = stablehlo.subtract %v4229, %v4232 : tensor<32x197x197xf32>
    %v4234 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4235 = stablehlo.exponential %v4233 : tensor<32x197x197xf32>
    %v4236 = stablehlo.reduce(%v4235 init: %v4234) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4237 = stablehlo.broadcast_in_dim %v4236, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4238 = stablehlo.divide %v4235, %v4237 : tensor<32x197x197xf32>
    %v4239 = stablehlo.reshape %v4238 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4240 = stablehlo.reshape %v4239 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4241 = stablehlo.reshape %v4219 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4242 = stablehlo.dot_general %v4240, %v4241, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4243 = stablehlo.reshape %v4242 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4244 = stablehlo.reshape %v4243 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4245 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4246 = stablehlo.pad %v4244, %v4245, low = [0, 0, 448], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4247 = stablehlo.reshape %v4246 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4248 = stablehlo.add %v4210, %v4247 : tensor<32x151296xf32>
    %v4249 = stablehlo.reshape %v3935 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4250 = stablehlo.slice %v4249 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4251 = stablehlo.reshape %v4250 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4252 = stablehlo.reshape %v3940 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4253 = stablehlo.slice %v4252 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4254 = stablehlo.reshape %v4253 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4255 = stablehlo.reshape %v3945 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4256 = stablehlo.slice %v4255 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4257 = stablehlo.reshape %v4256 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4258 = stablehlo.reshape %v4254 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4259 = stablehlo.transpose %v4258, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4260 = stablehlo.reshape %v4259 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4261 = stablehlo.reshape %v4251 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4262 = stablehlo.reshape %v4260 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4263 = stablehlo.dot_general %v4261, %v4262, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4264 = stablehlo.reshape %v4263 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4265 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4266 = stablehlo.multiply %v4264, %v4265 : tensor<32x38809xf32>
    %v4267 = stablehlo.reshape %v4266 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4268 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4269 = stablehlo.reduce(%v4267 init: %v4268) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4270 = stablehlo.broadcast_in_dim %v4269, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4271 = stablehlo.subtract %v4267, %v4270 : tensor<32x197x197xf32>
    %v4272 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4273 = stablehlo.exponential %v4271 : tensor<32x197x197xf32>
    %v4274 = stablehlo.reduce(%v4273 init: %v4272) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4275 = stablehlo.broadcast_in_dim %v4274, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4276 = stablehlo.divide %v4273, %v4275 : tensor<32x197x197xf32>
    %v4277 = stablehlo.reshape %v4276 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4278 = stablehlo.reshape %v4277 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4279 = stablehlo.reshape %v4257 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4280 = stablehlo.dot_general %v4278, %v4279, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4281 = stablehlo.reshape %v4280 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4282 = stablehlo.reshape %v4281 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4283 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4284 = stablehlo.pad %v4282, %v4283, low = [0, 0, 512], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4285 = stablehlo.reshape %v4284 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4286 = stablehlo.add %v4248, %v4285 : tensor<32x151296xf32>
    %v4287 = stablehlo.reshape %v3935 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4288 = stablehlo.slice %v4287 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4289 = stablehlo.reshape %v4288 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4290 = stablehlo.reshape %v3940 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4291 = stablehlo.slice %v4290 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4292 = stablehlo.reshape %v4291 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4293 = stablehlo.reshape %v3945 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4294 = stablehlo.slice %v4293 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4295 = stablehlo.reshape %v4294 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4296 = stablehlo.reshape %v4292 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4297 = stablehlo.transpose %v4296, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4298 = stablehlo.reshape %v4297 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4299 = stablehlo.reshape %v4289 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4300 = stablehlo.reshape %v4298 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4301 = stablehlo.dot_general %v4299, %v4300, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4302 = stablehlo.reshape %v4301 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4303 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4304 = stablehlo.multiply %v4302, %v4303 : tensor<32x38809xf32>
    %v4305 = stablehlo.reshape %v4304 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4306 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4307 = stablehlo.reduce(%v4305 init: %v4306) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4308 = stablehlo.broadcast_in_dim %v4307, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4309 = stablehlo.subtract %v4305, %v4308 : tensor<32x197x197xf32>
    %v4310 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4311 = stablehlo.exponential %v4309 : tensor<32x197x197xf32>
    %v4312 = stablehlo.reduce(%v4311 init: %v4310) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4313 = stablehlo.broadcast_in_dim %v4312, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4314 = stablehlo.divide %v4311, %v4313 : tensor<32x197x197xf32>
    %v4315 = stablehlo.reshape %v4314 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4316 = stablehlo.reshape %v4315 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4317 = stablehlo.reshape %v4295 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4318 = stablehlo.dot_general %v4316, %v4317, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4319 = stablehlo.reshape %v4318 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4320 = stablehlo.reshape %v4319 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4321 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4322 = stablehlo.pad %v4320, %v4321, low = [0, 0, 576], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4323 = stablehlo.reshape %v4322 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4324 = stablehlo.add %v4286, %v4323 : tensor<32x151296xf32>
    %v4325 = stablehlo.reshape %v3935 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4326 = stablehlo.slice %v4325 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4327 = stablehlo.reshape %v4326 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4328 = stablehlo.reshape %v3940 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4329 = stablehlo.slice %v4328 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4330 = stablehlo.reshape %v4329 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4331 = stablehlo.reshape %v3945 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4332 = stablehlo.slice %v4331 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4333 = stablehlo.reshape %v4332 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4334 = stablehlo.reshape %v4330 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4335 = stablehlo.transpose %v4334, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4336 = stablehlo.reshape %v4335 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4337 = stablehlo.reshape %v4327 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4338 = stablehlo.reshape %v4336 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4339 = stablehlo.dot_general %v4337, %v4338, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4340 = stablehlo.reshape %v4339 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4341 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4342 = stablehlo.multiply %v4340, %v4341 : tensor<32x38809xf32>
    %v4343 = stablehlo.reshape %v4342 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4344 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4345 = stablehlo.reduce(%v4343 init: %v4344) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4346 = stablehlo.broadcast_in_dim %v4345, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4347 = stablehlo.subtract %v4343, %v4346 : tensor<32x197x197xf32>
    %v4348 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4349 = stablehlo.exponential %v4347 : tensor<32x197x197xf32>
    %v4350 = stablehlo.reduce(%v4349 init: %v4348) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4351 = stablehlo.broadcast_in_dim %v4350, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4352 = stablehlo.divide %v4349, %v4351 : tensor<32x197x197xf32>
    %v4353 = stablehlo.reshape %v4352 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4354 = stablehlo.reshape %v4353 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4355 = stablehlo.reshape %v4333 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4356 = stablehlo.dot_general %v4354, %v4355, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4357 = stablehlo.reshape %v4356 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4358 = stablehlo.reshape %v4357 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4359 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4360 = stablehlo.pad %v4358, %v4359, low = [0, 0, 640], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4361 = stablehlo.reshape %v4360 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4362 = stablehlo.add %v4324, %v4361 : tensor<32x151296xf32>
    %v4363 = stablehlo.reshape %v3935 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4364 = stablehlo.slice %v4363 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4365 = stablehlo.reshape %v4364 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4366 = stablehlo.reshape %v3940 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4367 = stablehlo.slice %v4366 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4368 = stablehlo.reshape %v4367 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4369 = stablehlo.reshape %v3945 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4370 = stablehlo.slice %v4369 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4371 = stablehlo.reshape %v4370 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4372 = stablehlo.reshape %v4368 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4373 = stablehlo.transpose %v4372, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4374 = stablehlo.reshape %v4373 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4375 = stablehlo.reshape %v4365 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4376 = stablehlo.reshape %v4374 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4377 = stablehlo.dot_general %v4375, %v4376, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4378 = stablehlo.reshape %v4377 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4379 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4380 = stablehlo.multiply %v4378, %v4379 : tensor<32x38809xf32>
    %v4381 = stablehlo.reshape %v4380 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4382 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4383 = stablehlo.reduce(%v4381 init: %v4382) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4384 = stablehlo.broadcast_in_dim %v4383, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4385 = stablehlo.subtract %v4381, %v4384 : tensor<32x197x197xf32>
    %v4386 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4387 = stablehlo.exponential %v4385 : tensor<32x197x197xf32>
    %v4388 = stablehlo.reduce(%v4387 init: %v4386) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4389 = stablehlo.broadcast_in_dim %v4388, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4390 = stablehlo.divide %v4387, %v4389 : tensor<32x197x197xf32>
    %v4391 = stablehlo.reshape %v4390 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4392 = stablehlo.reshape %v4391 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4393 = stablehlo.reshape %v4371 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4394 = stablehlo.dot_general %v4392, %v4393, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4395 = stablehlo.reshape %v4394 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4396 = stablehlo.reshape %v4395 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4397 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4398 = stablehlo.pad %v4396, %v4397, low = [0, 0, 704], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4399 = stablehlo.reshape %v4398 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4400 = stablehlo.add %v4362, %v4399 : tensor<32x151296xf32>
    %v4401 = stablehlo.reshape %v4400 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4402 = stablehlo.dot_general %v4401, %b7_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v4403 = stablehlo.broadcast_in_dim %b7_bo, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v4404 = stablehlo.add %v4402, %v4403 : tensor<32x197x768xf32>
    %v4405 = stablehlo.reshape %v4404 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4406 = stablehlo.add %v3902, %v4405 : tensor<32x151296xf32>
    %v4407 = stablehlo.reshape %v4406 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4408 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4409 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v4410 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v4411 = stablehlo.reduce(%v4407 init: %v4408) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4412 = stablehlo.broadcast_in_dim %v4411, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v4413 = stablehlo.divide %v4412, %v4409 : tensor<32x197x768xf32>
    %v4414 = stablehlo.subtract %v4407, %v4413 : tensor<32x197x768xf32>
    %v4415 = stablehlo.multiply %v4414, %v4414 : tensor<32x197x768xf32>
    %v4416 = stablehlo.reduce(%v4415 init: %v4408) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4417 = stablehlo.broadcast_in_dim %v4416, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v4418 = stablehlo.divide %v4417, %v4409 : tensor<32x197x768xf32>
    %v4419 = stablehlo.add %v4418, %v4410 : tensor<32x197x768xf32>
    %v4420 = stablehlo.rsqrt %v4419 : tensor<32x197x768xf32>
    %v4421 = stablehlo.multiply %v4414, %v4420 : tensor<32x197x768xf32>
    %v4422 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v4423 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v4424 = stablehlo.multiply %v4421, %v4422 : tensor<32x197x768xf32>
    %v4425 = stablehlo.add %v4424, %v4423 : tensor<32x197x768xf32>
    %v4426 = stablehlo.reshape %v4425 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4427 = stablehlo.reshape %v4426 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4428 = stablehlo.broadcast_in_dim %b7_g2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v4429 = stablehlo.multiply %v4427, %v4428 : tensor<32x197x768xf32>
    %v4430 = stablehlo.reshape %v4429 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4431 = stablehlo.reshape %v4430 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4432 = stablehlo.broadcast_in_dim %b7_bt2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v4433 = stablehlo.add %v4431, %v4432 : tensor<32x197x768xf32>
    %v4434 = stablehlo.reshape %v4433 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4435 = stablehlo.reshape %v4434 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4436 = stablehlo.dot_general %v4435, %b7_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x3072xf32>) -> tensor<32x197x3072xf32>
    %v4437 = stablehlo.broadcast_in_dim %b7_bfc1, dims = [2] : (tensor<3072xf32>) -> tensor<32x197x3072xf32>
    %v4438 = stablehlo.add %v4436, %v4437 : tensor<32x197x3072xf32>
    %v4439 = stablehlo.reshape %v4438 : (tensor<32x197x3072xf32>) -> tensor<32x605184xf32>
    %v4440 = stablehlo.multiply %v4439, %v4439 : tensor<32x605184xf32>
    %v4441 = stablehlo.multiply %v4440, %v4439 : tensor<32x605184xf32>
    %v4442 = stablehlo.constant dense<0.044715> : tensor<32x605184xf32>
    %v4443 = stablehlo.multiply %v4442, %v4441 : tensor<32x605184xf32>
    %v4444 = stablehlo.add %v4439, %v4443 : tensor<32x605184xf32>
    %v4445 = stablehlo.constant dense<0.7978845608028654> : tensor<32x605184xf32>
    %v4446 = stablehlo.multiply %v4445, %v4444 : tensor<32x605184xf32>
    %v4447 = stablehlo.tanh %v4446 : tensor<32x605184xf32>
    %v4448 = stablehlo.constant dense<1.0> : tensor<32x605184xf32>
    %v4449 = stablehlo.add %v4448, %v4447 : tensor<32x605184xf32>
    %v4450 = stablehlo.constant dense<0.5> : tensor<32x605184xf32>
    %v4451 = stablehlo.multiply %v4450, %v4439 : tensor<32x605184xf32>
    %v4452 = stablehlo.multiply %v4451, %v4449 : tensor<32x605184xf32>
    %v4453 = stablehlo.reshape %v4452 : (tensor<32x605184xf32>) -> tensor<32x197x3072xf32>
    %v4454 = stablehlo.dot_general %v4453, %b7_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x3072xf32>, tensor<3072x768xf32>) -> tensor<32x197x768xf32>
    %v4455 = stablehlo.broadcast_in_dim %b7_bfc2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v4456 = stablehlo.add %v4454, %v4455 : tensor<32x197x768xf32>
    %v4457 = stablehlo.reshape %v4456 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4458 = stablehlo.add %v4406, %v4457 : tensor<32x151296xf32>
    %v4459 = stablehlo.reshape %v4458 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4460 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4461 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v4462 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v4463 = stablehlo.reduce(%v4459 init: %v4460) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4464 = stablehlo.broadcast_in_dim %v4463, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v4465 = stablehlo.divide %v4464, %v4461 : tensor<32x197x768xf32>
    %v4466 = stablehlo.subtract %v4459, %v4465 : tensor<32x197x768xf32>
    %v4467 = stablehlo.multiply %v4466, %v4466 : tensor<32x197x768xf32>
    %v4468 = stablehlo.reduce(%v4467 init: %v4460) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4469 = stablehlo.broadcast_in_dim %v4468, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v4470 = stablehlo.divide %v4469, %v4461 : tensor<32x197x768xf32>
    %v4471 = stablehlo.add %v4470, %v4462 : tensor<32x197x768xf32>
    %v4472 = stablehlo.rsqrt %v4471 : tensor<32x197x768xf32>
    %v4473 = stablehlo.multiply %v4466, %v4472 : tensor<32x197x768xf32>
    %v4474 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v4475 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v4476 = stablehlo.multiply %v4473, %v4474 : tensor<32x197x768xf32>
    %v4477 = stablehlo.add %v4476, %v4475 : tensor<32x197x768xf32>
    %v4478 = stablehlo.reshape %v4477 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4479 = stablehlo.reshape %v4478 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4480 = stablehlo.broadcast_in_dim %b8_g1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v4481 = stablehlo.multiply %v4479, %v4480 : tensor<32x197x768xf32>
    %v4482 = stablehlo.reshape %v4481 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4483 = stablehlo.reshape %v4482 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4484 = stablehlo.broadcast_in_dim %b8_bt1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v4485 = stablehlo.add %v4483, %v4484 : tensor<32x197x768xf32>
    %v4486 = stablehlo.reshape %v4485 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4487 = stablehlo.reshape %v4486 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4488 = stablehlo.dot_general %v4487, %b8_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v4489 = stablehlo.broadcast_in_dim %b8_bq, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v4490 = stablehlo.add %v4488, %v4489 : tensor<32x197x768xf32>
    %v4491 = stablehlo.reshape %v4490 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4492 = stablehlo.reshape %v4486 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4493 = stablehlo.dot_general %v4492, %b8_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v4494 = stablehlo.broadcast_in_dim %b8_bk, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v4495 = stablehlo.add %v4493, %v4494 : tensor<32x197x768xf32>
    %v4496 = stablehlo.reshape %v4495 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4497 = stablehlo.reshape %v4486 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4498 = stablehlo.dot_general %v4497, %b8_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v4499 = stablehlo.broadcast_in_dim %b8_bv, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v4500 = stablehlo.add %v4498, %v4499 : tensor<32x197x768xf32>
    %v4501 = stablehlo.reshape %v4500 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4502 = stablehlo.reshape %v4491 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4503 = stablehlo.slice %v4502 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4504 = stablehlo.reshape %v4503 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4505 = stablehlo.reshape %v4496 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4506 = stablehlo.slice %v4505 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4507 = stablehlo.reshape %v4506 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4508 = stablehlo.reshape %v4501 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4509 = stablehlo.slice %v4508 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4510 = stablehlo.reshape %v4509 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4511 = stablehlo.reshape %v4507 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4512 = stablehlo.transpose %v4511, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4513 = stablehlo.reshape %v4512 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4514 = stablehlo.reshape %v4504 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4515 = stablehlo.reshape %v4513 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4516 = stablehlo.dot_general %v4514, %v4515, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4517 = stablehlo.reshape %v4516 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4518 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4519 = stablehlo.multiply %v4517, %v4518 : tensor<32x38809xf32>
    %v4520 = stablehlo.reshape %v4519 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4521 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4522 = stablehlo.reduce(%v4520 init: %v4521) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4523 = stablehlo.broadcast_in_dim %v4522, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4524 = stablehlo.subtract %v4520, %v4523 : tensor<32x197x197xf32>
    %v4525 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4526 = stablehlo.exponential %v4524 : tensor<32x197x197xf32>
    %v4527 = stablehlo.reduce(%v4526 init: %v4525) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4528 = stablehlo.broadcast_in_dim %v4527, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4529 = stablehlo.divide %v4526, %v4528 : tensor<32x197x197xf32>
    %v4530 = stablehlo.reshape %v4529 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4531 = stablehlo.reshape %v4530 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4532 = stablehlo.reshape %v4510 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4533 = stablehlo.dot_general %v4531, %v4532, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4534 = stablehlo.reshape %v4533 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4535 = stablehlo.reshape %v4534 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4536 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4537 = stablehlo.pad %v4535, %v4536, low = [0, 0, 0], high = [0, 0, 704], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4538 = stablehlo.reshape %v4537 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4539 = stablehlo.reshape %v4491 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4540 = stablehlo.slice %v4539 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4541 = stablehlo.reshape %v4540 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4542 = stablehlo.reshape %v4496 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4543 = stablehlo.slice %v4542 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4544 = stablehlo.reshape %v4543 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4545 = stablehlo.reshape %v4501 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4546 = stablehlo.slice %v4545 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4547 = stablehlo.reshape %v4546 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4548 = stablehlo.reshape %v4544 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4549 = stablehlo.transpose %v4548, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4550 = stablehlo.reshape %v4549 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4551 = stablehlo.reshape %v4541 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4552 = stablehlo.reshape %v4550 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4553 = stablehlo.dot_general %v4551, %v4552, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4554 = stablehlo.reshape %v4553 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4555 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4556 = stablehlo.multiply %v4554, %v4555 : tensor<32x38809xf32>
    %v4557 = stablehlo.reshape %v4556 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4558 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4559 = stablehlo.reduce(%v4557 init: %v4558) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4560 = stablehlo.broadcast_in_dim %v4559, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4561 = stablehlo.subtract %v4557, %v4560 : tensor<32x197x197xf32>
    %v4562 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4563 = stablehlo.exponential %v4561 : tensor<32x197x197xf32>
    %v4564 = stablehlo.reduce(%v4563 init: %v4562) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4565 = stablehlo.broadcast_in_dim %v4564, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4566 = stablehlo.divide %v4563, %v4565 : tensor<32x197x197xf32>
    %v4567 = stablehlo.reshape %v4566 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4568 = stablehlo.reshape %v4567 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4569 = stablehlo.reshape %v4547 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4570 = stablehlo.dot_general %v4568, %v4569, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4571 = stablehlo.reshape %v4570 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4572 = stablehlo.reshape %v4571 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4573 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4574 = stablehlo.pad %v4572, %v4573, low = [0, 0, 64], high = [0, 0, 640], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4575 = stablehlo.reshape %v4574 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4576 = stablehlo.add %v4538, %v4575 : tensor<32x151296xf32>
    %v4577 = stablehlo.reshape %v4491 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4578 = stablehlo.slice %v4577 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4579 = stablehlo.reshape %v4578 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4580 = stablehlo.reshape %v4496 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4581 = stablehlo.slice %v4580 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4582 = stablehlo.reshape %v4581 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4583 = stablehlo.reshape %v4501 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4584 = stablehlo.slice %v4583 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4585 = stablehlo.reshape %v4584 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4586 = stablehlo.reshape %v4582 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4587 = stablehlo.transpose %v4586, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4588 = stablehlo.reshape %v4587 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4589 = stablehlo.reshape %v4579 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4590 = stablehlo.reshape %v4588 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4591 = stablehlo.dot_general %v4589, %v4590, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4592 = stablehlo.reshape %v4591 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4593 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4594 = stablehlo.multiply %v4592, %v4593 : tensor<32x38809xf32>
    %v4595 = stablehlo.reshape %v4594 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4596 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4597 = stablehlo.reduce(%v4595 init: %v4596) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4598 = stablehlo.broadcast_in_dim %v4597, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4599 = stablehlo.subtract %v4595, %v4598 : tensor<32x197x197xf32>
    %v4600 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4601 = stablehlo.exponential %v4599 : tensor<32x197x197xf32>
    %v4602 = stablehlo.reduce(%v4601 init: %v4600) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4603 = stablehlo.broadcast_in_dim %v4602, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4604 = stablehlo.divide %v4601, %v4603 : tensor<32x197x197xf32>
    %v4605 = stablehlo.reshape %v4604 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4606 = stablehlo.reshape %v4605 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4607 = stablehlo.reshape %v4585 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4608 = stablehlo.dot_general %v4606, %v4607, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4609 = stablehlo.reshape %v4608 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4610 = stablehlo.reshape %v4609 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4611 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4612 = stablehlo.pad %v4610, %v4611, low = [0, 0, 128], high = [0, 0, 576], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4613 = stablehlo.reshape %v4612 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4614 = stablehlo.add %v4576, %v4613 : tensor<32x151296xf32>
    %v4615 = stablehlo.reshape %v4491 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4616 = stablehlo.slice %v4615 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4617 = stablehlo.reshape %v4616 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4618 = stablehlo.reshape %v4496 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4619 = stablehlo.slice %v4618 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4620 = stablehlo.reshape %v4619 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4621 = stablehlo.reshape %v4501 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4622 = stablehlo.slice %v4621 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4623 = stablehlo.reshape %v4622 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4624 = stablehlo.reshape %v4620 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4625 = stablehlo.transpose %v4624, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4626 = stablehlo.reshape %v4625 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4627 = stablehlo.reshape %v4617 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4628 = stablehlo.reshape %v4626 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4629 = stablehlo.dot_general %v4627, %v4628, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4630 = stablehlo.reshape %v4629 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4631 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4632 = stablehlo.multiply %v4630, %v4631 : tensor<32x38809xf32>
    %v4633 = stablehlo.reshape %v4632 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4634 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4635 = stablehlo.reduce(%v4633 init: %v4634) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4636 = stablehlo.broadcast_in_dim %v4635, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4637 = stablehlo.subtract %v4633, %v4636 : tensor<32x197x197xf32>
    %v4638 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4639 = stablehlo.exponential %v4637 : tensor<32x197x197xf32>
    %v4640 = stablehlo.reduce(%v4639 init: %v4638) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4641 = stablehlo.broadcast_in_dim %v4640, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4642 = stablehlo.divide %v4639, %v4641 : tensor<32x197x197xf32>
    %v4643 = stablehlo.reshape %v4642 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4644 = stablehlo.reshape %v4643 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4645 = stablehlo.reshape %v4623 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4646 = stablehlo.dot_general %v4644, %v4645, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4647 = stablehlo.reshape %v4646 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4648 = stablehlo.reshape %v4647 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4649 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4650 = stablehlo.pad %v4648, %v4649, low = [0, 0, 192], high = [0, 0, 512], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4651 = stablehlo.reshape %v4650 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4652 = stablehlo.add %v4614, %v4651 : tensor<32x151296xf32>
    %v4653 = stablehlo.reshape %v4491 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4654 = stablehlo.slice %v4653 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4655 = stablehlo.reshape %v4654 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4656 = stablehlo.reshape %v4496 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4657 = stablehlo.slice %v4656 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4658 = stablehlo.reshape %v4657 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4659 = stablehlo.reshape %v4501 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4660 = stablehlo.slice %v4659 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4661 = stablehlo.reshape %v4660 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4662 = stablehlo.reshape %v4658 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4663 = stablehlo.transpose %v4662, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4664 = stablehlo.reshape %v4663 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4665 = stablehlo.reshape %v4655 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4666 = stablehlo.reshape %v4664 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4667 = stablehlo.dot_general %v4665, %v4666, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4668 = stablehlo.reshape %v4667 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4669 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4670 = stablehlo.multiply %v4668, %v4669 : tensor<32x38809xf32>
    %v4671 = stablehlo.reshape %v4670 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4672 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4673 = stablehlo.reduce(%v4671 init: %v4672) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4674 = stablehlo.broadcast_in_dim %v4673, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4675 = stablehlo.subtract %v4671, %v4674 : tensor<32x197x197xf32>
    %v4676 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4677 = stablehlo.exponential %v4675 : tensor<32x197x197xf32>
    %v4678 = stablehlo.reduce(%v4677 init: %v4676) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4679 = stablehlo.broadcast_in_dim %v4678, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4680 = stablehlo.divide %v4677, %v4679 : tensor<32x197x197xf32>
    %v4681 = stablehlo.reshape %v4680 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4682 = stablehlo.reshape %v4681 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4683 = stablehlo.reshape %v4661 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4684 = stablehlo.dot_general %v4682, %v4683, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4685 = stablehlo.reshape %v4684 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4686 = stablehlo.reshape %v4685 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4687 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4688 = stablehlo.pad %v4686, %v4687, low = [0, 0, 256], high = [0, 0, 448], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4689 = stablehlo.reshape %v4688 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4690 = stablehlo.add %v4652, %v4689 : tensor<32x151296xf32>
    %v4691 = stablehlo.reshape %v4491 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4692 = stablehlo.slice %v4691 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4693 = stablehlo.reshape %v4692 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4694 = stablehlo.reshape %v4496 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4695 = stablehlo.slice %v4694 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4696 = stablehlo.reshape %v4695 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4697 = stablehlo.reshape %v4501 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4698 = stablehlo.slice %v4697 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4699 = stablehlo.reshape %v4698 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4700 = stablehlo.reshape %v4696 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4701 = stablehlo.transpose %v4700, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4702 = stablehlo.reshape %v4701 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4703 = stablehlo.reshape %v4693 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4704 = stablehlo.reshape %v4702 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4705 = stablehlo.dot_general %v4703, %v4704, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4706 = stablehlo.reshape %v4705 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4707 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4708 = stablehlo.multiply %v4706, %v4707 : tensor<32x38809xf32>
    %v4709 = stablehlo.reshape %v4708 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4710 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4711 = stablehlo.reduce(%v4709 init: %v4710) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4712 = stablehlo.broadcast_in_dim %v4711, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4713 = stablehlo.subtract %v4709, %v4712 : tensor<32x197x197xf32>
    %v4714 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4715 = stablehlo.exponential %v4713 : tensor<32x197x197xf32>
    %v4716 = stablehlo.reduce(%v4715 init: %v4714) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4717 = stablehlo.broadcast_in_dim %v4716, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4718 = stablehlo.divide %v4715, %v4717 : tensor<32x197x197xf32>
    %v4719 = stablehlo.reshape %v4718 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4720 = stablehlo.reshape %v4719 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4721 = stablehlo.reshape %v4699 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4722 = stablehlo.dot_general %v4720, %v4721, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4723 = stablehlo.reshape %v4722 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4724 = stablehlo.reshape %v4723 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4725 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4726 = stablehlo.pad %v4724, %v4725, low = [0, 0, 320], high = [0, 0, 384], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4727 = stablehlo.reshape %v4726 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4728 = stablehlo.add %v4690, %v4727 : tensor<32x151296xf32>
    %v4729 = stablehlo.reshape %v4491 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4730 = stablehlo.slice %v4729 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4731 = stablehlo.reshape %v4730 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4732 = stablehlo.reshape %v4496 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4733 = stablehlo.slice %v4732 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4734 = stablehlo.reshape %v4733 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4735 = stablehlo.reshape %v4501 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4736 = stablehlo.slice %v4735 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4737 = stablehlo.reshape %v4736 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4738 = stablehlo.reshape %v4734 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4739 = stablehlo.transpose %v4738, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4740 = stablehlo.reshape %v4739 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4741 = stablehlo.reshape %v4731 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4742 = stablehlo.reshape %v4740 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4743 = stablehlo.dot_general %v4741, %v4742, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4744 = stablehlo.reshape %v4743 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4745 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4746 = stablehlo.multiply %v4744, %v4745 : tensor<32x38809xf32>
    %v4747 = stablehlo.reshape %v4746 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4748 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4749 = stablehlo.reduce(%v4747 init: %v4748) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4750 = stablehlo.broadcast_in_dim %v4749, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4751 = stablehlo.subtract %v4747, %v4750 : tensor<32x197x197xf32>
    %v4752 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4753 = stablehlo.exponential %v4751 : tensor<32x197x197xf32>
    %v4754 = stablehlo.reduce(%v4753 init: %v4752) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4755 = stablehlo.broadcast_in_dim %v4754, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4756 = stablehlo.divide %v4753, %v4755 : tensor<32x197x197xf32>
    %v4757 = stablehlo.reshape %v4756 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4758 = stablehlo.reshape %v4757 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4759 = stablehlo.reshape %v4737 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4760 = stablehlo.dot_general %v4758, %v4759, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4761 = stablehlo.reshape %v4760 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4762 = stablehlo.reshape %v4761 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4763 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4764 = stablehlo.pad %v4762, %v4763, low = [0, 0, 384], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4765 = stablehlo.reshape %v4764 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4766 = stablehlo.add %v4728, %v4765 : tensor<32x151296xf32>
    %v4767 = stablehlo.reshape %v4491 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4768 = stablehlo.slice %v4767 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4769 = stablehlo.reshape %v4768 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4770 = stablehlo.reshape %v4496 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4771 = stablehlo.slice %v4770 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4772 = stablehlo.reshape %v4771 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4773 = stablehlo.reshape %v4501 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4774 = stablehlo.slice %v4773 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4775 = stablehlo.reshape %v4774 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4776 = stablehlo.reshape %v4772 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4777 = stablehlo.transpose %v4776, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4778 = stablehlo.reshape %v4777 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4779 = stablehlo.reshape %v4769 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4780 = stablehlo.reshape %v4778 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4781 = stablehlo.dot_general %v4779, %v4780, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4782 = stablehlo.reshape %v4781 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4783 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4784 = stablehlo.multiply %v4782, %v4783 : tensor<32x38809xf32>
    %v4785 = stablehlo.reshape %v4784 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4786 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4787 = stablehlo.reduce(%v4785 init: %v4786) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4788 = stablehlo.broadcast_in_dim %v4787, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4789 = stablehlo.subtract %v4785, %v4788 : tensor<32x197x197xf32>
    %v4790 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4791 = stablehlo.exponential %v4789 : tensor<32x197x197xf32>
    %v4792 = stablehlo.reduce(%v4791 init: %v4790) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4793 = stablehlo.broadcast_in_dim %v4792, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4794 = stablehlo.divide %v4791, %v4793 : tensor<32x197x197xf32>
    %v4795 = stablehlo.reshape %v4794 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4796 = stablehlo.reshape %v4795 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4797 = stablehlo.reshape %v4775 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4798 = stablehlo.dot_general %v4796, %v4797, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4799 = stablehlo.reshape %v4798 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4800 = stablehlo.reshape %v4799 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4801 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4802 = stablehlo.pad %v4800, %v4801, low = [0, 0, 448], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4803 = stablehlo.reshape %v4802 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4804 = stablehlo.add %v4766, %v4803 : tensor<32x151296xf32>
    %v4805 = stablehlo.reshape %v4491 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4806 = stablehlo.slice %v4805 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4807 = stablehlo.reshape %v4806 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4808 = stablehlo.reshape %v4496 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4809 = stablehlo.slice %v4808 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4810 = stablehlo.reshape %v4809 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4811 = stablehlo.reshape %v4501 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4812 = stablehlo.slice %v4811 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4813 = stablehlo.reshape %v4812 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4814 = stablehlo.reshape %v4810 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4815 = stablehlo.transpose %v4814, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4816 = stablehlo.reshape %v4815 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4817 = stablehlo.reshape %v4807 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4818 = stablehlo.reshape %v4816 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4819 = stablehlo.dot_general %v4817, %v4818, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4820 = stablehlo.reshape %v4819 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4821 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4822 = stablehlo.multiply %v4820, %v4821 : tensor<32x38809xf32>
    %v4823 = stablehlo.reshape %v4822 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4824 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4825 = stablehlo.reduce(%v4823 init: %v4824) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4826 = stablehlo.broadcast_in_dim %v4825, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4827 = stablehlo.subtract %v4823, %v4826 : tensor<32x197x197xf32>
    %v4828 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4829 = stablehlo.exponential %v4827 : tensor<32x197x197xf32>
    %v4830 = stablehlo.reduce(%v4829 init: %v4828) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4831 = stablehlo.broadcast_in_dim %v4830, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4832 = stablehlo.divide %v4829, %v4831 : tensor<32x197x197xf32>
    %v4833 = stablehlo.reshape %v4832 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4834 = stablehlo.reshape %v4833 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4835 = stablehlo.reshape %v4813 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4836 = stablehlo.dot_general %v4834, %v4835, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4837 = stablehlo.reshape %v4836 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4838 = stablehlo.reshape %v4837 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4839 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4840 = stablehlo.pad %v4838, %v4839, low = [0, 0, 512], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4841 = stablehlo.reshape %v4840 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4842 = stablehlo.add %v4804, %v4841 : tensor<32x151296xf32>
    %v4843 = stablehlo.reshape %v4491 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4844 = stablehlo.slice %v4843 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4845 = stablehlo.reshape %v4844 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4846 = stablehlo.reshape %v4496 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4847 = stablehlo.slice %v4846 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4848 = stablehlo.reshape %v4847 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4849 = stablehlo.reshape %v4501 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4850 = stablehlo.slice %v4849 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4851 = stablehlo.reshape %v4850 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4852 = stablehlo.reshape %v4848 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4853 = stablehlo.transpose %v4852, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4854 = stablehlo.reshape %v4853 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4855 = stablehlo.reshape %v4845 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4856 = stablehlo.reshape %v4854 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4857 = stablehlo.dot_general %v4855, %v4856, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4858 = stablehlo.reshape %v4857 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4859 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4860 = stablehlo.multiply %v4858, %v4859 : tensor<32x38809xf32>
    %v4861 = stablehlo.reshape %v4860 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4862 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4863 = stablehlo.reduce(%v4861 init: %v4862) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4864 = stablehlo.broadcast_in_dim %v4863, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4865 = stablehlo.subtract %v4861, %v4864 : tensor<32x197x197xf32>
    %v4866 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4867 = stablehlo.exponential %v4865 : tensor<32x197x197xf32>
    %v4868 = stablehlo.reduce(%v4867 init: %v4866) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4869 = stablehlo.broadcast_in_dim %v4868, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4870 = stablehlo.divide %v4867, %v4869 : tensor<32x197x197xf32>
    %v4871 = stablehlo.reshape %v4870 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4872 = stablehlo.reshape %v4871 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4873 = stablehlo.reshape %v4851 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4874 = stablehlo.dot_general %v4872, %v4873, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4875 = stablehlo.reshape %v4874 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4876 = stablehlo.reshape %v4875 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4877 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4878 = stablehlo.pad %v4876, %v4877, low = [0, 0, 576], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4879 = stablehlo.reshape %v4878 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4880 = stablehlo.add %v4842, %v4879 : tensor<32x151296xf32>
    %v4881 = stablehlo.reshape %v4491 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4882 = stablehlo.slice %v4881 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4883 = stablehlo.reshape %v4882 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4884 = stablehlo.reshape %v4496 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4885 = stablehlo.slice %v4884 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4886 = stablehlo.reshape %v4885 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4887 = stablehlo.reshape %v4501 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4888 = stablehlo.slice %v4887 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4889 = stablehlo.reshape %v4888 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4890 = stablehlo.reshape %v4886 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4891 = stablehlo.transpose %v4890, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4892 = stablehlo.reshape %v4891 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4893 = stablehlo.reshape %v4883 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4894 = stablehlo.reshape %v4892 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4895 = stablehlo.dot_general %v4893, %v4894, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4896 = stablehlo.reshape %v4895 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4897 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4898 = stablehlo.multiply %v4896, %v4897 : tensor<32x38809xf32>
    %v4899 = stablehlo.reshape %v4898 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4900 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4901 = stablehlo.reduce(%v4899 init: %v4900) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4902 = stablehlo.broadcast_in_dim %v4901, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4903 = stablehlo.subtract %v4899, %v4902 : tensor<32x197x197xf32>
    %v4904 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4905 = stablehlo.exponential %v4903 : tensor<32x197x197xf32>
    %v4906 = stablehlo.reduce(%v4905 init: %v4904) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4907 = stablehlo.broadcast_in_dim %v4906, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4908 = stablehlo.divide %v4905, %v4907 : tensor<32x197x197xf32>
    %v4909 = stablehlo.reshape %v4908 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4910 = stablehlo.reshape %v4909 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4911 = stablehlo.reshape %v4889 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4912 = stablehlo.dot_general %v4910, %v4911, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4913 = stablehlo.reshape %v4912 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4914 = stablehlo.reshape %v4913 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4915 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4916 = stablehlo.pad %v4914, %v4915, low = [0, 0, 640], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4917 = stablehlo.reshape %v4916 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4918 = stablehlo.add %v4880, %v4917 : tensor<32x151296xf32>
    %v4919 = stablehlo.reshape %v4491 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4920 = stablehlo.slice %v4919 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4921 = stablehlo.reshape %v4920 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4922 = stablehlo.reshape %v4496 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4923 = stablehlo.slice %v4922 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4924 = stablehlo.reshape %v4923 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4925 = stablehlo.reshape %v4501 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4926 = stablehlo.slice %v4925 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v4927 = stablehlo.reshape %v4926 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4928 = stablehlo.reshape %v4924 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4929 = stablehlo.transpose %v4928, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v4930 = stablehlo.reshape %v4929 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v4931 = stablehlo.reshape %v4921 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4932 = stablehlo.reshape %v4930 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v4933 = stablehlo.dot_general %v4931, %v4932, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v4934 = stablehlo.reshape %v4933 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4935 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v4936 = stablehlo.multiply %v4934, %v4935 : tensor<32x38809xf32>
    %v4937 = stablehlo.reshape %v4936 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4938 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v4939 = stablehlo.reduce(%v4937 init: %v4938) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4940 = stablehlo.broadcast_in_dim %v4939, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4941 = stablehlo.subtract %v4937, %v4940 : tensor<32x197x197xf32>
    %v4942 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4943 = stablehlo.exponential %v4941 : tensor<32x197x197xf32>
    %v4944 = stablehlo.reduce(%v4943 init: %v4942) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4945 = stablehlo.broadcast_in_dim %v4944, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v4946 = stablehlo.divide %v4943, %v4945 : tensor<32x197x197xf32>
    %v4947 = stablehlo.reshape %v4946 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v4948 = stablehlo.reshape %v4947 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v4949 = stablehlo.reshape %v4927 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4950 = stablehlo.dot_general %v4948, %v4949, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v4951 = stablehlo.reshape %v4950 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v4952 = stablehlo.reshape %v4951 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v4953 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4954 = stablehlo.pad %v4952, %v4953, low = [0, 0, 704], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v4955 = stablehlo.reshape %v4954 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4956 = stablehlo.add %v4918, %v4955 : tensor<32x151296xf32>
    %v4957 = stablehlo.reshape %v4956 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4958 = stablehlo.dot_general %v4957, %b8_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v4959 = stablehlo.broadcast_in_dim %b8_bo, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v4960 = stablehlo.add %v4958, %v4959 : tensor<32x197x768xf32>
    %v4961 = stablehlo.reshape %v4960 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4962 = stablehlo.add %v4458, %v4961 : tensor<32x151296xf32>
    %v4963 = stablehlo.reshape %v4962 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4964 = stablehlo.constant dense<0.0> : tensor<f32>
    %v4965 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v4966 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v4967 = stablehlo.reduce(%v4963 init: %v4964) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4968 = stablehlo.broadcast_in_dim %v4967, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v4969 = stablehlo.divide %v4968, %v4965 : tensor<32x197x768xf32>
    %v4970 = stablehlo.subtract %v4963, %v4969 : tensor<32x197x768xf32>
    %v4971 = stablehlo.multiply %v4970, %v4970 : tensor<32x197x768xf32>
    %v4972 = stablehlo.reduce(%v4971 init: %v4964) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v4973 = stablehlo.broadcast_in_dim %v4972, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v4974 = stablehlo.divide %v4973, %v4965 : tensor<32x197x768xf32>
    %v4975 = stablehlo.add %v4974, %v4966 : tensor<32x197x768xf32>
    %v4976 = stablehlo.rsqrt %v4975 : tensor<32x197x768xf32>
    %v4977 = stablehlo.multiply %v4970, %v4976 : tensor<32x197x768xf32>
    %v4978 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v4979 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v4980 = stablehlo.multiply %v4977, %v4978 : tensor<32x197x768xf32>
    %v4981 = stablehlo.add %v4980, %v4979 : tensor<32x197x768xf32>
    %v4982 = stablehlo.reshape %v4981 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4983 = stablehlo.reshape %v4982 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4984 = stablehlo.broadcast_in_dim %b8_g2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v4985 = stablehlo.multiply %v4983, %v4984 : tensor<32x197x768xf32>
    %v4986 = stablehlo.reshape %v4985 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4987 = stablehlo.reshape %v4986 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4988 = stablehlo.broadcast_in_dim %b8_bt2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v4989 = stablehlo.add %v4987, %v4988 : tensor<32x197x768xf32>
    %v4990 = stablehlo.reshape %v4989 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v4991 = stablehlo.reshape %v4990 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v4992 = stablehlo.dot_general %v4991, %b8_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x3072xf32>) -> tensor<32x197x3072xf32>
    %v4993 = stablehlo.broadcast_in_dim %b8_bfc1, dims = [2] : (tensor<3072xf32>) -> tensor<32x197x3072xf32>
    %v4994 = stablehlo.add %v4992, %v4993 : tensor<32x197x3072xf32>
    %v4995 = stablehlo.reshape %v4994 : (tensor<32x197x3072xf32>) -> tensor<32x605184xf32>
    %v4996 = stablehlo.multiply %v4995, %v4995 : tensor<32x605184xf32>
    %v4997 = stablehlo.multiply %v4996, %v4995 : tensor<32x605184xf32>
    %v4998 = stablehlo.constant dense<0.044715> : tensor<32x605184xf32>
    %v4999 = stablehlo.multiply %v4998, %v4997 : tensor<32x605184xf32>
    %v5000 = stablehlo.add %v4995, %v4999 : tensor<32x605184xf32>
    %v5001 = stablehlo.constant dense<0.7978845608028654> : tensor<32x605184xf32>
    %v5002 = stablehlo.multiply %v5001, %v5000 : tensor<32x605184xf32>
    %v5003 = stablehlo.tanh %v5002 : tensor<32x605184xf32>
    %v5004 = stablehlo.constant dense<1.0> : tensor<32x605184xf32>
    %v5005 = stablehlo.add %v5004, %v5003 : tensor<32x605184xf32>
    %v5006 = stablehlo.constant dense<0.5> : tensor<32x605184xf32>
    %v5007 = stablehlo.multiply %v5006, %v4995 : tensor<32x605184xf32>
    %v5008 = stablehlo.multiply %v5007, %v5005 : tensor<32x605184xf32>
    %v5009 = stablehlo.reshape %v5008 : (tensor<32x605184xf32>) -> tensor<32x197x3072xf32>
    %v5010 = stablehlo.dot_general %v5009, %b8_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x3072xf32>, tensor<3072x768xf32>) -> tensor<32x197x768xf32>
    %v5011 = stablehlo.broadcast_in_dim %b8_bfc2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5012 = stablehlo.add %v5010, %v5011 : tensor<32x197x768xf32>
    %v5013 = stablehlo.reshape %v5012 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5014 = stablehlo.add %v4962, %v5013 : tensor<32x151296xf32>
    %v5015 = stablehlo.reshape %v5014 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5016 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5017 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v5018 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v5019 = stablehlo.reduce(%v5015 init: %v5016) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5020 = stablehlo.broadcast_in_dim %v5019, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v5021 = stablehlo.divide %v5020, %v5017 : tensor<32x197x768xf32>
    %v5022 = stablehlo.subtract %v5015, %v5021 : tensor<32x197x768xf32>
    %v5023 = stablehlo.multiply %v5022, %v5022 : tensor<32x197x768xf32>
    %v5024 = stablehlo.reduce(%v5023 init: %v5016) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5025 = stablehlo.broadcast_in_dim %v5024, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v5026 = stablehlo.divide %v5025, %v5017 : tensor<32x197x768xf32>
    %v5027 = stablehlo.add %v5026, %v5018 : tensor<32x197x768xf32>
    %v5028 = stablehlo.rsqrt %v5027 : tensor<32x197x768xf32>
    %v5029 = stablehlo.multiply %v5022, %v5028 : tensor<32x197x768xf32>
    %v5030 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v5031 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v5032 = stablehlo.multiply %v5029, %v5030 : tensor<32x197x768xf32>
    %v5033 = stablehlo.add %v5032, %v5031 : tensor<32x197x768xf32>
    %v5034 = stablehlo.reshape %v5033 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5035 = stablehlo.reshape %v5034 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5036 = stablehlo.broadcast_in_dim %b9_g1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5037 = stablehlo.multiply %v5035, %v5036 : tensor<32x197x768xf32>
    %v5038 = stablehlo.reshape %v5037 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5039 = stablehlo.reshape %v5038 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5040 = stablehlo.broadcast_in_dim %b9_bt1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5041 = stablehlo.add %v5039, %v5040 : tensor<32x197x768xf32>
    %v5042 = stablehlo.reshape %v5041 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5043 = stablehlo.reshape %v5042 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5044 = stablehlo.dot_general %v5043, %b9_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v5045 = stablehlo.broadcast_in_dim %b9_bq, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5046 = stablehlo.add %v5044, %v5045 : tensor<32x197x768xf32>
    %v5047 = stablehlo.reshape %v5046 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5048 = stablehlo.reshape %v5042 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5049 = stablehlo.dot_general %v5048, %b9_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v5050 = stablehlo.broadcast_in_dim %b9_bk, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5051 = stablehlo.add %v5049, %v5050 : tensor<32x197x768xf32>
    %v5052 = stablehlo.reshape %v5051 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5053 = stablehlo.reshape %v5042 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5054 = stablehlo.dot_general %v5053, %b9_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v5055 = stablehlo.broadcast_in_dim %b9_bv, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5056 = stablehlo.add %v5054, %v5055 : tensor<32x197x768xf32>
    %v5057 = stablehlo.reshape %v5056 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5058 = stablehlo.reshape %v5047 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5059 = stablehlo.slice %v5058 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5060 = stablehlo.reshape %v5059 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5061 = stablehlo.reshape %v5052 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5062 = stablehlo.slice %v5061 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5063 = stablehlo.reshape %v5062 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5064 = stablehlo.reshape %v5057 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5065 = stablehlo.slice %v5064 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5066 = stablehlo.reshape %v5065 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5067 = stablehlo.reshape %v5063 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5068 = stablehlo.transpose %v5067, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5069 = stablehlo.reshape %v5068 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5070 = stablehlo.reshape %v5060 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5071 = stablehlo.reshape %v5069 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5072 = stablehlo.dot_general %v5070, %v5071, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5073 = stablehlo.reshape %v5072 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5074 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5075 = stablehlo.multiply %v5073, %v5074 : tensor<32x38809xf32>
    %v5076 = stablehlo.reshape %v5075 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5077 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5078 = stablehlo.reduce(%v5076 init: %v5077) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5079 = stablehlo.broadcast_in_dim %v5078, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5080 = stablehlo.subtract %v5076, %v5079 : tensor<32x197x197xf32>
    %v5081 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5082 = stablehlo.exponential %v5080 : tensor<32x197x197xf32>
    %v5083 = stablehlo.reduce(%v5082 init: %v5081) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5084 = stablehlo.broadcast_in_dim %v5083, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5085 = stablehlo.divide %v5082, %v5084 : tensor<32x197x197xf32>
    %v5086 = stablehlo.reshape %v5085 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5087 = stablehlo.reshape %v5086 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5088 = stablehlo.reshape %v5066 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5089 = stablehlo.dot_general %v5087, %v5088, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5090 = stablehlo.reshape %v5089 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5091 = stablehlo.reshape %v5090 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5092 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5093 = stablehlo.pad %v5091, %v5092, low = [0, 0, 0], high = [0, 0, 704], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5094 = stablehlo.reshape %v5093 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5095 = stablehlo.reshape %v5047 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5096 = stablehlo.slice %v5095 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5097 = stablehlo.reshape %v5096 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5098 = stablehlo.reshape %v5052 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5099 = stablehlo.slice %v5098 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5100 = stablehlo.reshape %v5099 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5101 = stablehlo.reshape %v5057 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5102 = stablehlo.slice %v5101 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5103 = stablehlo.reshape %v5102 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5104 = stablehlo.reshape %v5100 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5105 = stablehlo.transpose %v5104, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5106 = stablehlo.reshape %v5105 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5107 = stablehlo.reshape %v5097 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5108 = stablehlo.reshape %v5106 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5109 = stablehlo.dot_general %v5107, %v5108, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5110 = stablehlo.reshape %v5109 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5111 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5112 = stablehlo.multiply %v5110, %v5111 : tensor<32x38809xf32>
    %v5113 = stablehlo.reshape %v5112 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5114 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5115 = stablehlo.reduce(%v5113 init: %v5114) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5116 = stablehlo.broadcast_in_dim %v5115, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5117 = stablehlo.subtract %v5113, %v5116 : tensor<32x197x197xf32>
    %v5118 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5119 = stablehlo.exponential %v5117 : tensor<32x197x197xf32>
    %v5120 = stablehlo.reduce(%v5119 init: %v5118) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5121 = stablehlo.broadcast_in_dim %v5120, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5122 = stablehlo.divide %v5119, %v5121 : tensor<32x197x197xf32>
    %v5123 = stablehlo.reshape %v5122 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5124 = stablehlo.reshape %v5123 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5125 = stablehlo.reshape %v5103 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5126 = stablehlo.dot_general %v5124, %v5125, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5127 = stablehlo.reshape %v5126 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5128 = stablehlo.reshape %v5127 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5129 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5130 = stablehlo.pad %v5128, %v5129, low = [0, 0, 64], high = [0, 0, 640], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5131 = stablehlo.reshape %v5130 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5132 = stablehlo.add %v5094, %v5131 : tensor<32x151296xf32>
    %v5133 = stablehlo.reshape %v5047 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5134 = stablehlo.slice %v5133 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5135 = stablehlo.reshape %v5134 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5136 = stablehlo.reshape %v5052 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5137 = stablehlo.slice %v5136 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5138 = stablehlo.reshape %v5137 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5139 = stablehlo.reshape %v5057 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5140 = stablehlo.slice %v5139 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5141 = stablehlo.reshape %v5140 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5142 = stablehlo.reshape %v5138 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5143 = stablehlo.transpose %v5142, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5144 = stablehlo.reshape %v5143 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5145 = stablehlo.reshape %v5135 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5146 = stablehlo.reshape %v5144 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5147 = stablehlo.dot_general %v5145, %v5146, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5148 = stablehlo.reshape %v5147 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5149 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5150 = stablehlo.multiply %v5148, %v5149 : tensor<32x38809xf32>
    %v5151 = stablehlo.reshape %v5150 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5152 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5153 = stablehlo.reduce(%v5151 init: %v5152) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5154 = stablehlo.broadcast_in_dim %v5153, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5155 = stablehlo.subtract %v5151, %v5154 : tensor<32x197x197xf32>
    %v5156 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5157 = stablehlo.exponential %v5155 : tensor<32x197x197xf32>
    %v5158 = stablehlo.reduce(%v5157 init: %v5156) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5159 = stablehlo.broadcast_in_dim %v5158, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5160 = stablehlo.divide %v5157, %v5159 : tensor<32x197x197xf32>
    %v5161 = stablehlo.reshape %v5160 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5162 = stablehlo.reshape %v5161 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5163 = stablehlo.reshape %v5141 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5164 = stablehlo.dot_general %v5162, %v5163, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5165 = stablehlo.reshape %v5164 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5166 = stablehlo.reshape %v5165 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5167 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5168 = stablehlo.pad %v5166, %v5167, low = [0, 0, 128], high = [0, 0, 576], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5169 = stablehlo.reshape %v5168 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5170 = stablehlo.add %v5132, %v5169 : tensor<32x151296xf32>
    %v5171 = stablehlo.reshape %v5047 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5172 = stablehlo.slice %v5171 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5173 = stablehlo.reshape %v5172 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5174 = stablehlo.reshape %v5052 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5175 = stablehlo.slice %v5174 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5176 = stablehlo.reshape %v5175 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5177 = stablehlo.reshape %v5057 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5178 = stablehlo.slice %v5177 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5179 = stablehlo.reshape %v5178 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5180 = stablehlo.reshape %v5176 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5181 = stablehlo.transpose %v5180, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5182 = stablehlo.reshape %v5181 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5183 = stablehlo.reshape %v5173 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5184 = stablehlo.reshape %v5182 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5185 = stablehlo.dot_general %v5183, %v5184, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5186 = stablehlo.reshape %v5185 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5187 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5188 = stablehlo.multiply %v5186, %v5187 : tensor<32x38809xf32>
    %v5189 = stablehlo.reshape %v5188 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5190 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5191 = stablehlo.reduce(%v5189 init: %v5190) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5192 = stablehlo.broadcast_in_dim %v5191, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5193 = stablehlo.subtract %v5189, %v5192 : tensor<32x197x197xf32>
    %v5194 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5195 = stablehlo.exponential %v5193 : tensor<32x197x197xf32>
    %v5196 = stablehlo.reduce(%v5195 init: %v5194) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5197 = stablehlo.broadcast_in_dim %v5196, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5198 = stablehlo.divide %v5195, %v5197 : tensor<32x197x197xf32>
    %v5199 = stablehlo.reshape %v5198 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5200 = stablehlo.reshape %v5199 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5201 = stablehlo.reshape %v5179 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5202 = stablehlo.dot_general %v5200, %v5201, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5203 = stablehlo.reshape %v5202 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5204 = stablehlo.reshape %v5203 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5205 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5206 = stablehlo.pad %v5204, %v5205, low = [0, 0, 192], high = [0, 0, 512], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5207 = stablehlo.reshape %v5206 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5208 = stablehlo.add %v5170, %v5207 : tensor<32x151296xf32>
    %v5209 = stablehlo.reshape %v5047 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5210 = stablehlo.slice %v5209 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5211 = stablehlo.reshape %v5210 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5212 = stablehlo.reshape %v5052 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5213 = stablehlo.slice %v5212 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5214 = stablehlo.reshape %v5213 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5215 = stablehlo.reshape %v5057 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5216 = stablehlo.slice %v5215 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5217 = stablehlo.reshape %v5216 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5218 = stablehlo.reshape %v5214 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5219 = stablehlo.transpose %v5218, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5220 = stablehlo.reshape %v5219 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5221 = stablehlo.reshape %v5211 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5222 = stablehlo.reshape %v5220 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5223 = stablehlo.dot_general %v5221, %v5222, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5224 = stablehlo.reshape %v5223 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5225 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5226 = stablehlo.multiply %v5224, %v5225 : tensor<32x38809xf32>
    %v5227 = stablehlo.reshape %v5226 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5228 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5229 = stablehlo.reduce(%v5227 init: %v5228) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5230 = stablehlo.broadcast_in_dim %v5229, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5231 = stablehlo.subtract %v5227, %v5230 : tensor<32x197x197xf32>
    %v5232 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5233 = stablehlo.exponential %v5231 : tensor<32x197x197xf32>
    %v5234 = stablehlo.reduce(%v5233 init: %v5232) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5235 = stablehlo.broadcast_in_dim %v5234, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5236 = stablehlo.divide %v5233, %v5235 : tensor<32x197x197xf32>
    %v5237 = stablehlo.reshape %v5236 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5238 = stablehlo.reshape %v5237 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5239 = stablehlo.reshape %v5217 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5240 = stablehlo.dot_general %v5238, %v5239, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5241 = stablehlo.reshape %v5240 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5242 = stablehlo.reshape %v5241 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5243 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5244 = stablehlo.pad %v5242, %v5243, low = [0, 0, 256], high = [0, 0, 448], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5245 = stablehlo.reshape %v5244 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5246 = stablehlo.add %v5208, %v5245 : tensor<32x151296xf32>
    %v5247 = stablehlo.reshape %v5047 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5248 = stablehlo.slice %v5247 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5249 = stablehlo.reshape %v5248 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5250 = stablehlo.reshape %v5052 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5251 = stablehlo.slice %v5250 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5252 = stablehlo.reshape %v5251 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5253 = stablehlo.reshape %v5057 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5254 = stablehlo.slice %v5253 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5255 = stablehlo.reshape %v5254 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5256 = stablehlo.reshape %v5252 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5257 = stablehlo.transpose %v5256, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5258 = stablehlo.reshape %v5257 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5259 = stablehlo.reshape %v5249 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5260 = stablehlo.reshape %v5258 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5261 = stablehlo.dot_general %v5259, %v5260, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5262 = stablehlo.reshape %v5261 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5263 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5264 = stablehlo.multiply %v5262, %v5263 : tensor<32x38809xf32>
    %v5265 = stablehlo.reshape %v5264 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5266 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5267 = stablehlo.reduce(%v5265 init: %v5266) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5268 = stablehlo.broadcast_in_dim %v5267, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5269 = stablehlo.subtract %v5265, %v5268 : tensor<32x197x197xf32>
    %v5270 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5271 = stablehlo.exponential %v5269 : tensor<32x197x197xf32>
    %v5272 = stablehlo.reduce(%v5271 init: %v5270) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5273 = stablehlo.broadcast_in_dim %v5272, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5274 = stablehlo.divide %v5271, %v5273 : tensor<32x197x197xf32>
    %v5275 = stablehlo.reshape %v5274 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5276 = stablehlo.reshape %v5275 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5277 = stablehlo.reshape %v5255 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5278 = stablehlo.dot_general %v5276, %v5277, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5279 = stablehlo.reshape %v5278 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5280 = stablehlo.reshape %v5279 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5281 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5282 = stablehlo.pad %v5280, %v5281, low = [0, 0, 320], high = [0, 0, 384], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5283 = stablehlo.reshape %v5282 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5284 = stablehlo.add %v5246, %v5283 : tensor<32x151296xf32>
    %v5285 = stablehlo.reshape %v5047 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5286 = stablehlo.slice %v5285 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5287 = stablehlo.reshape %v5286 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5288 = stablehlo.reshape %v5052 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5289 = stablehlo.slice %v5288 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5290 = stablehlo.reshape %v5289 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5291 = stablehlo.reshape %v5057 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5292 = stablehlo.slice %v5291 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5293 = stablehlo.reshape %v5292 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5294 = stablehlo.reshape %v5290 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5295 = stablehlo.transpose %v5294, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5296 = stablehlo.reshape %v5295 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5297 = stablehlo.reshape %v5287 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5298 = stablehlo.reshape %v5296 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5299 = stablehlo.dot_general %v5297, %v5298, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5300 = stablehlo.reshape %v5299 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5301 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5302 = stablehlo.multiply %v5300, %v5301 : tensor<32x38809xf32>
    %v5303 = stablehlo.reshape %v5302 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5304 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5305 = stablehlo.reduce(%v5303 init: %v5304) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5306 = stablehlo.broadcast_in_dim %v5305, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5307 = stablehlo.subtract %v5303, %v5306 : tensor<32x197x197xf32>
    %v5308 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5309 = stablehlo.exponential %v5307 : tensor<32x197x197xf32>
    %v5310 = stablehlo.reduce(%v5309 init: %v5308) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5311 = stablehlo.broadcast_in_dim %v5310, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5312 = stablehlo.divide %v5309, %v5311 : tensor<32x197x197xf32>
    %v5313 = stablehlo.reshape %v5312 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5314 = stablehlo.reshape %v5313 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5315 = stablehlo.reshape %v5293 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5316 = stablehlo.dot_general %v5314, %v5315, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5317 = stablehlo.reshape %v5316 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5318 = stablehlo.reshape %v5317 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5319 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5320 = stablehlo.pad %v5318, %v5319, low = [0, 0, 384], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5321 = stablehlo.reshape %v5320 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5322 = stablehlo.add %v5284, %v5321 : tensor<32x151296xf32>
    %v5323 = stablehlo.reshape %v5047 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5324 = stablehlo.slice %v5323 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5325 = stablehlo.reshape %v5324 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5326 = stablehlo.reshape %v5052 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5327 = stablehlo.slice %v5326 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5328 = stablehlo.reshape %v5327 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5329 = stablehlo.reshape %v5057 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5330 = stablehlo.slice %v5329 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5331 = stablehlo.reshape %v5330 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5332 = stablehlo.reshape %v5328 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5333 = stablehlo.transpose %v5332, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5334 = stablehlo.reshape %v5333 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5335 = stablehlo.reshape %v5325 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5336 = stablehlo.reshape %v5334 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5337 = stablehlo.dot_general %v5335, %v5336, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5338 = stablehlo.reshape %v5337 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5339 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5340 = stablehlo.multiply %v5338, %v5339 : tensor<32x38809xf32>
    %v5341 = stablehlo.reshape %v5340 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5342 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5343 = stablehlo.reduce(%v5341 init: %v5342) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5344 = stablehlo.broadcast_in_dim %v5343, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5345 = stablehlo.subtract %v5341, %v5344 : tensor<32x197x197xf32>
    %v5346 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5347 = stablehlo.exponential %v5345 : tensor<32x197x197xf32>
    %v5348 = stablehlo.reduce(%v5347 init: %v5346) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5349 = stablehlo.broadcast_in_dim %v5348, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5350 = stablehlo.divide %v5347, %v5349 : tensor<32x197x197xf32>
    %v5351 = stablehlo.reshape %v5350 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5352 = stablehlo.reshape %v5351 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5353 = stablehlo.reshape %v5331 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5354 = stablehlo.dot_general %v5352, %v5353, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5355 = stablehlo.reshape %v5354 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5356 = stablehlo.reshape %v5355 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5357 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5358 = stablehlo.pad %v5356, %v5357, low = [0, 0, 448], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5359 = stablehlo.reshape %v5358 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5360 = stablehlo.add %v5322, %v5359 : tensor<32x151296xf32>
    %v5361 = stablehlo.reshape %v5047 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5362 = stablehlo.slice %v5361 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5363 = stablehlo.reshape %v5362 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5364 = stablehlo.reshape %v5052 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5365 = stablehlo.slice %v5364 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5366 = stablehlo.reshape %v5365 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5367 = stablehlo.reshape %v5057 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5368 = stablehlo.slice %v5367 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5369 = stablehlo.reshape %v5368 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5370 = stablehlo.reshape %v5366 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5371 = stablehlo.transpose %v5370, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5372 = stablehlo.reshape %v5371 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5373 = stablehlo.reshape %v5363 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5374 = stablehlo.reshape %v5372 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5375 = stablehlo.dot_general %v5373, %v5374, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5376 = stablehlo.reshape %v5375 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5377 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5378 = stablehlo.multiply %v5376, %v5377 : tensor<32x38809xf32>
    %v5379 = stablehlo.reshape %v5378 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5380 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5381 = stablehlo.reduce(%v5379 init: %v5380) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5382 = stablehlo.broadcast_in_dim %v5381, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5383 = stablehlo.subtract %v5379, %v5382 : tensor<32x197x197xf32>
    %v5384 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5385 = stablehlo.exponential %v5383 : tensor<32x197x197xf32>
    %v5386 = stablehlo.reduce(%v5385 init: %v5384) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5387 = stablehlo.broadcast_in_dim %v5386, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5388 = stablehlo.divide %v5385, %v5387 : tensor<32x197x197xf32>
    %v5389 = stablehlo.reshape %v5388 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5390 = stablehlo.reshape %v5389 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5391 = stablehlo.reshape %v5369 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5392 = stablehlo.dot_general %v5390, %v5391, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5393 = stablehlo.reshape %v5392 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5394 = stablehlo.reshape %v5393 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5395 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5396 = stablehlo.pad %v5394, %v5395, low = [0, 0, 512], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5397 = stablehlo.reshape %v5396 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5398 = stablehlo.add %v5360, %v5397 : tensor<32x151296xf32>
    %v5399 = stablehlo.reshape %v5047 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5400 = stablehlo.slice %v5399 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5401 = stablehlo.reshape %v5400 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5402 = stablehlo.reshape %v5052 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5403 = stablehlo.slice %v5402 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5404 = stablehlo.reshape %v5403 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5405 = stablehlo.reshape %v5057 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5406 = stablehlo.slice %v5405 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5407 = stablehlo.reshape %v5406 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5408 = stablehlo.reshape %v5404 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5409 = stablehlo.transpose %v5408, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5410 = stablehlo.reshape %v5409 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5411 = stablehlo.reshape %v5401 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5412 = stablehlo.reshape %v5410 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5413 = stablehlo.dot_general %v5411, %v5412, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5414 = stablehlo.reshape %v5413 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5415 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5416 = stablehlo.multiply %v5414, %v5415 : tensor<32x38809xf32>
    %v5417 = stablehlo.reshape %v5416 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5418 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5419 = stablehlo.reduce(%v5417 init: %v5418) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5420 = stablehlo.broadcast_in_dim %v5419, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5421 = stablehlo.subtract %v5417, %v5420 : tensor<32x197x197xf32>
    %v5422 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5423 = stablehlo.exponential %v5421 : tensor<32x197x197xf32>
    %v5424 = stablehlo.reduce(%v5423 init: %v5422) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5425 = stablehlo.broadcast_in_dim %v5424, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5426 = stablehlo.divide %v5423, %v5425 : tensor<32x197x197xf32>
    %v5427 = stablehlo.reshape %v5426 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5428 = stablehlo.reshape %v5427 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5429 = stablehlo.reshape %v5407 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5430 = stablehlo.dot_general %v5428, %v5429, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5431 = stablehlo.reshape %v5430 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5432 = stablehlo.reshape %v5431 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5433 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5434 = stablehlo.pad %v5432, %v5433, low = [0, 0, 576], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5435 = stablehlo.reshape %v5434 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5436 = stablehlo.add %v5398, %v5435 : tensor<32x151296xf32>
    %v5437 = stablehlo.reshape %v5047 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5438 = stablehlo.slice %v5437 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5439 = stablehlo.reshape %v5438 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5440 = stablehlo.reshape %v5052 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5441 = stablehlo.slice %v5440 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5442 = stablehlo.reshape %v5441 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5443 = stablehlo.reshape %v5057 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5444 = stablehlo.slice %v5443 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5445 = stablehlo.reshape %v5444 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5446 = stablehlo.reshape %v5442 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5447 = stablehlo.transpose %v5446, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5448 = stablehlo.reshape %v5447 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5449 = stablehlo.reshape %v5439 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5450 = stablehlo.reshape %v5448 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5451 = stablehlo.dot_general %v5449, %v5450, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5452 = stablehlo.reshape %v5451 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5453 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5454 = stablehlo.multiply %v5452, %v5453 : tensor<32x38809xf32>
    %v5455 = stablehlo.reshape %v5454 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5456 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5457 = stablehlo.reduce(%v5455 init: %v5456) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5458 = stablehlo.broadcast_in_dim %v5457, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5459 = stablehlo.subtract %v5455, %v5458 : tensor<32x197x197xf32>
    %v5460 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5461 = stablehlo.exponential %v5459 : tensor<32x197x197xf32>
    %v5462 = stablehlo.reduce(%v5461 init: %v5460) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5463 = stablehlo.broadcast_in_dim %v5462, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5464 = stablehlo.divide %v5461, %v5463 : tensor<32x197x197xf32>
    %v5465 = stablehlo.reshape %v5464 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5466 = stablehlo.reshape %v5465 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5467 = stablehlo.reshape %v5445 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5468 = stablehlo.dot_general %v5466, %v5467, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5469 = stablehlo.reshape %v5468 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5470 = stablehlo.reshape %v5469 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5471 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5472 = stablehlo.pad %v5470, %v5471, low = [0, 0, 640], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5473 = stablehlo.reshape %v5472 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5474 = stablehlo.add %v5436, %v5473 : tensor<32x151296xf32>
    %v5475 = stablehlo.reshape %v5047 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5476 = stablehlo.slice %v5475 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5477 = stablehlo.reshape %v5476 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5478 = stablehlo.reshape %v5052 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5479 = stablehlo.slice %v5478 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5480 = stablehlo.reshape %v5479 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5481 = stablehlo.reshape %v5057 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5482 = stablehlo.slice %v5481 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5483 = stablehlo.reshape %v5482 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5484 = stablehlo.reshape %v5480 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5485 = stablehlo.transpose %v5484, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5486 = stablehlo.reshape %v5485 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5487 = stablehlo.reshape %v5477 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5488 = stablehlo.reshape %v5486 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5489 = stablehlo.dot_general %v5487, %v5488, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5490 = stablehlo.reshape %v5489 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5491 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5492 = stablehlo.multiply %v5490, %v5491 : tensor<32x38809xf32>
    %v5493 = stablehlo.reshape %v5492 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5494 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5495 = stablehlo.reduce(%v5493 init: %v5494) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5496 = stablehlo.broadcast_in_dim %v5495, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5497 = stablehlo.subtract %v5493, %v5496 : tensor<32x197x197xf32>
    %v5498 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5499 = stablehlo.exponential %v5497 : tensor<32x197x197xf32>
    %v5500 = stablehlo.reduce(%v5499 init: %v5498) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5501 = stablehlo.broadcast_in_dim %v5500, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5502 = stablehlo.divide %v5499, %v5501 : tensor<32x197x197xf32>
    %v5503 = stablehlo.reshape %v5502 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5504 = stablehlo.reshape %v5503 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5505 = stablehlo.reshape %v5483 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5506 = stablehlo.dot_general %v5504, %v5505, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5507 = stablehlo.reshape %v5506 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5508 = stablehlo.reshape %v5507 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5509 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5510 = stablehlo.pad %v5508, %v5509, low = [0, 0, 704], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5511 = stablehlo.reshape %v5510 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5512 = stablehlo.add %v5474, %v5511 : tensor<32x151296xf32>
    %v5513 = stablehlo.reshape %v5512 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5514 = stablehlo.dot_general %v5513, %b9_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v5515 = stablehlo.broadcast_in_dim %b9_bo, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5516 = stablehlo.add %v5514, %v5515 : tensor<32x197x768xf32>
    %v5517 = stablehlo.reshape %v5516 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5518 = stablehlo.add %v5014, %v5517 : tensor<32x151296xf32>
    %v5519 = stablehlo.reshape %v5518 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5520 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5521 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v5522 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v5523 = stablehlo.reduce(%v5519 init: %v5520) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5524 = stablehlo.broadcast_in_dim %v5523, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v5525 = stablehlo.divide %v5524, %v5521 : tensor<32x197x768xf32>
    %v5526 = stablehlo.subtract %v5519, %v5525 : tensor<32x197x768xf32>
    %v5527 = stablehlo.multiply %v5526, %v5526 : tensor<32x197x768xf32>
    %v5528 = stablehlo.reduce(%v5527 init: %v5520) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5529 = stablehlo.broadcast_in_dim %v5528, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v5530 = stablehlo.divide %v5529, %v5521 : tensor<32x197x768xf32>
    %v5531 = stablehlo.add %v5530, %v5522 : tensor<32x197x768xf32>
    %v5532 = stablehlo.rsqrt %v5531 : tensor<32x197x768xf32>
    %v5533 = stablehlo.multiply %v5526, %v5532 : tensor<32x197x768xf32>
    %v5534 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v5535 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v5536 = stablehlo.multiply %v5533, %v5534 : tensor<32x197x768xf32>
    %v5537 = stablehlo.add %v5536, %v5535 : tensor<32x197x768xf32>
    %v5538 = stablehlo.reshape %v5537 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5539 = stablehlo.reshape %v5538 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5540 = stablehlo.broadcast_in_dim %b9_g2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5541 = stablehlo.multiply %v5539, %v5540 : tensor<32x197x768xf32>
    %v5542 = stablehlo.reshape %v5541 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5543 = stablehlo.reshape %v5542 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5544 = stablehlo.broadcast_in_dim %b9_bt2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5545 = stablehlo.add %v5543, %v5544 : tensor<32x197x768xf32>
    %v5546 = stablehlo.reshape %v5545 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5547 = stablehlo.reshape %v5546 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5548 = stablehlo.dot_general %v5547, %b9_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x3072xf32>) -> tensor<32x197x3072xf32>
    %v5549 = stablehlo.broadcast_in_dim %b9_bfc1, dims = [2] : (tensor<3072xf32>) -> tensor<32x197x3072xf32>
    %v5550 = stablehlo.add %v5548, %v5549 : tensor<32x197x3072xf32>
    %v5551 = stablehlo.reshape %v5550 : (tensor<32x197x3072xf32>) -> tensor<32x605184xf32>
    %v5552 = stablehlo.multiply %v5551, %v5551 : tensor<32x605184xf32>
    %v5553 = stablehlo.multiply %v5552, %v5551 : tensor<32x605184xf32>
    %v5554 = stablehlo.constant dense<0.044715> : tensor<32x605184xf32>
    %v5555 = stablehlo.multiply %v5554, %v5553 : tensor<32x605184xf32>
    %v5556 = stablehlo.add %v5551, %v5555 : tensor<32x605184xf32>
    %v5557 = stablehlo.constant dense<0.7978845608028654> : tensor<32x605184xf32>
    %v5558 = stablehlo.multiply %v5557, %v5556 : tensor<32x605184xf32>
    %v5559 = stablehlo.tanh %v5558 : tensor<32x605184xf32>
    %v5560 = stablehlo.constant dense<1.0> : tensor<32x605184xf32>
    %v5561 = stablehlo.add %v5560, %v5559 : tensor<32x605184xf32>
    %v5562 = stablehlo.constant dense<0.5> : tensor<32x605184xf32>
    %v5563 = stablehlo.multiply %v5562, %v5551 : tensor<32x605184xf32>
    %v5564 = stablehlo.multiply %v5563, %v5561 : tensor<32x605184xf32>
    %v5565 = stablehlo.reshape %v5564 : (tensor<32x605184xf32>) -> tensor<32x197x3072xf32>
    %v5566 = stablehlo.dot_general %v5565, %b9_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x3072xf32>, tensor<3072x768xf32>) -> tensor<32x197x768xf32>
    %v5567 = stablehlo.broadcast_in_dim %b9_bfc2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5568 = stablehlo.add %v5566, %v5567 : tensor<32x197x768xf32>
    %v5569 = stablehlo.reshape %v5568 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5570 = stablehlo.add %v5518, %v5569 : tensor<32x151296xf32>
    %v5571 = stablehlo.reshape %v5570 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5572 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5573 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v5574 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v5575 = stablehlo.reduce(%v5571 init: %v5572) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5576 = stablehlo.broadcast_in_dim %v5575, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v5577 = stablehlo.divide %v5576, %v5573 : tensor<32x197x768xf32>
    %v5578 = stablehlo.subtract %v5571, %v5577 : tensor<32x197x768xf32>
    %v5579 = stablehlo.multiply %v5578, %v5578 : tensor<32x197x768xf32>
    %v5580 = stablehlo.reduce(%v5579 init: %v5572) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5581 = stablehlo.broadcast_in_dim %v5580, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v5582 = stablehlo.divide %v5581, %v5573 : tensor<32x197x768xf32>
    %v5583 = stablehlo.add %v5582, %v5574 : tensor<32x197x768xf32>
    %v5584 = stablehlo.rsqrt %v5583 : tensor<32x197x768xf32>
    %v5585 = stablehlo.multiply %v5578, %v5584 : tensor<32x197x768xf32>
    %v5586 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v5587 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v5588 = stablehlo.multiply %v5585, %v5586 : tensor<32x197x768xf32>
    %v5589 = stablehlo.add %v5588, %v5587 : tensor<32x197x768xf32>
    %v5590 = stablehlo.reshape %v5589 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5591 = stablehlo.reshape %v5590 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5592 = stablehlo.broadcast_in_dim %b10_g1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5593 = stablehlo.multiply %v5591, %v5592 : tensor<32x197x768xf32>
    %v5594 = stablehlo.reshape %v5593 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5595 = stablehlo.reshape %v5594 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5596 = stablehlo.broadcast_in_dim %b10_bt1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5597 = stablehlo.add %v5595, %v5596 : tensor<32x197x768xf32>
    %v5598 = stablehlo.reshape %v5597 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5599 = stablehlo.reshape %v5598 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5600 = stablehlo.dot_general %v5599, %b10_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v5601 = stablehlo.broadcast_in_dim %b10_bq, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5602 = stablehlo.add %v5600, %v5601 : tensor<32x197x768xf32>
    %v5603 = stablehlo.reshape %v5602 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5604 = stablehlo.reshape %v5598 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5605 = stablehlo.dot_general %v5604, %b10_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v5606 = stablehlo.broadcast_in_dim %b10_bk, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5607 = stablehlo.add %v5605, %v5606 : tensor<32x197x768xf32>
    %v5608 = stablehlo.reshape %v5607 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5609 = stablehlo.reshape %v5598 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5610 = stablehlo.dot_general %v5609, %b10_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v5611 = stablehlo.broadcast_in_dim %b10_bv, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v5612 = stablehlo.add %v5610, %v5611 : tensor<32x197x768xf32>
    %v5613 = stablehlo.reshape %v5612 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5614 = stablehlo.reshape %v5603 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5615 = stablehlo.slice %v5614 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5616 = stablehlo.reshape %v5615 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5617 = stablehlo.reshape %v5608 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5618 = stablehlo.slice %v5617 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5619 = stablehlo.reshape %v5618 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5620 = stablehlo.reshape %v5613 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5621 = stablehlo.slice %v5620 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5622 = stablehlo.reshape %v5621 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5623 = stablehlo.reshape %v5619 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5624 = stablehlo.transpose %v5623, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5625 = stablehlo.reshape %v5624 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5626 = stablehlo.reshape %v5616 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5627 = stablehlo.reshape %v5625 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5628 = stablehlo.dot_general %v5626, %v5627, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5629 = stablehlo.reshape %v5628 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5630 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5631 = stablehlo.multiply %v5629, %v5630 : tensor<32x38809xf32>
    %v5632 = stablehlo.reshape %v5631 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5633 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5634 = stablehlo.reduce(%v5632 init: %v5633) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5635 = stablehlo.broadcast_in_dim %v5634, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5636 = stablehlo.subtract %v5632, %v5635 : tensor<32x197x197xf32>
    %v5637 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5638 = stablehlo.exponential %v5636 : tensor<32x197x197xf32>
    %v5639 = stablehlo.reduce(%v5638 init: %v5637) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5640 = stablehlo.broadcast_in_dim %v5639, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5641 = stablehlo.divide %v5638, %v5640 : tensor<32x197x197xf32>
    %v5642 = stablehlo.reshape %v5641 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5643 = stablehlo.reshape %v5642 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5644 = stablehlo.reshape %v5622 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5645 = stablehlo.dot_general %v5643, %v5644, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5646 = stablehlo.reshape %v5645 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5647 = stablehlo.reshape %v5646 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5648 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5649 = stablehlo.pad %v5647, %v5648, low = [0, 0, 0], high = [0, 0, 704], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5650 = stablehlo.reshape %v5649 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5651 = stablehlo.reshape %v5603 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5652 = stablehlo.slice %v5651 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5653 = stablehlo.reshape %v5652 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5654 = stablehlo.reshape %v5608 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5655 = stablehlo.slice %v5654 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5656 = stablehlo.reshape %v5655 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5657 = stablehlo.reshape %v5613 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5658 = stablehlo.slice %v5657 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5659 = stablehlo.reshape %v5658 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5660 = stablehlo.reshape %v5656 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5661 = stablehlo.transpose %v5660, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5662 = stablehlo.reshape %v5661 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5663 = stablehlo.reshape %v5653 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5664 = stablehlo.reshape %v5662 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5665 = stablehlo.dot_general %v5663, %v5664, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5666 = stablehlo.reshape %v5665 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5667 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5668 = stablehlo.multiply %v5666, %v5667 : tensor<32x38809xf32>
    %v5669 = stablehlo.reshape %v5668 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5670 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5671 = stablehlo.reduce(%v5669 init: %v5670) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5672 = stablehlo.broadcast_in_dim %v5671, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5673 = stablehlo.subtract %v5669, %v5672 : tensor<32x197x197xf32>
    %v5674 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5675 = stablehlo.exponential %v5673 : tensor<32x197x197xf32>
    %v5676 = stablehlo.reduce(%v5675 init: %v5674) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5677 = stablehlo.broadcast_in_dim %v5676, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5678 = stablehlo.divide %v5675, %v5677 : tensor<32x197x197xf32>
    %v5679 = stablehlo.reshape %v5678 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5680 = stablehlo.reshape %v5679 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5681 = stablehlo.reshape %v5659 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5682 = stablehlo.dot_general %v5680, %v5681, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5683 = stablehlo.reshape %v5682 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5684 = stablehlo.reshape %v5683 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5685 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5686 = stablehlo.pad %v5684, %v5685, low = [0, 0, 64], high = [0, 0, 640], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5687 = stablehlo.reshape %v5686 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5688 = stablehlo.add %v5650, %v5687 : tensor<32x151296xf32>
    %v5689 = stablehlo.reshape %v5603 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5690 = stablehlo.slice %v5689 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5691 = stablehlo.reshape %v5690 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5692 = stablehlo.reshape %v5608 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5693 = stablehlo.slice %v5692 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5694 = stablehlo.reshape %v5693 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5695 = stablehlo.reshape %v5613 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5696 = stablehlo.slice %v5695 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5697 = stablehlo.reshape %v5696 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5698 = stablehlo.reshape %v5694 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5699 = stablehlo.transpose %v5698, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5700 = stablehlo.reshape %v5699 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5701 = stablehlo.reshape %v5691 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5702 = stablehlo.reshape %v5700 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5703 = stablehlo.dot_general %v5701, %v5702, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5704 = stablehlo.reshape %v5703 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5705 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5706 = stablehlo.multiply %v5704, %v5705 : tensor<32x38809xf32>
    %v5707 = stablehlo.reshape %v5706 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5708 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5709 = stablehlo.reduce(%v5707 init: %v5708) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5710 = stablehlo.broadcast_in_dim %v5709, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5711 = stablehlo.subtract %v5707, %v5710 : tensor<32x197x197xf32>
    %v5712 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5713 = stablehlo.exponential %v5711 : tensor<32x197x197xf32>
    %v5714 = stablehlo.reduce(%v5713 init: %v5712) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5715 = stablehlo.broadcast_in_dim %v5714, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5716 = stablehlo.divide %v5713, %v5715 : tensor<32x197x197xf32>
    %v5717 = stablehlo.reshape %v5716 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5718 = stablehlo.reshape %v5717 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5719 = stablehlo.reshape %v5697 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5720 = stablehlo.dot_general %v5718, %v5719, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5721 = stablehlo.reshape %v5720 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5722 = stablehlo.reshape %v5721 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5723 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5724 = stablehlo.pad %v5722, %v5723, low = [0, 0, 128], high = [0, 0, 576], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5725 = stablehlo.reshape %v5724 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5726 = stablehlo.add %v5688, %v5725 : tensor<32x151296xf32>
    %v5727 = stablehlo.reshape %v5603 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5728 = stablehlo.slice %v5727 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5729 = stablehlo.reshape %v5728 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5730 = stablehlo.reshape %v5608 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5731 = stablehlo.slice %v5730 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5732 = stablehlo.reshape %v5731 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5733 = stablehlo.reshape %v5613 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5734 = stablehlo.slice %v5733 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5735 = stablehlo.reshape %v5734 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5736 = stablehlo.reshape %v5732 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5737 = stablehlo.transpose %v5736, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5738 = stablehlo.reshape %v5737 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5739 = stablehlo.reshape %v5729 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5740 = stablehlo.reshape %v5738 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5741 = stablehlo.dot_general %v5739, %v5740, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5742 = stablehlo.reshape %v5741 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5743 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5744 = stablehlo.multiply %v5742, %v5743 : tensor<32x38809xf32>
    %v5745 = stablehlo.reshape %v5744 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5746 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5747 = stablehlo.reduce(%v5745 init: %v5746) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5748 = stablehlo.broadcast_in_dim %v5747, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5749 = stablehlo.subtract %v5745, %v5748 : tensor<32x197x197xf32>
    %v5750 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5751 = stablehlo.exponential %v5749 : tensor<32x197x197xf32>
    %v5752 = stablehlo.reduce(%v5751 init: %v5750) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5753 = stablehlo.broadcast_in_dim %v5752, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5754 = stablehlo.divide %v5751, %v5753 : tensor<32x197x197xf32>
    %v5755 = stablehlo.reshape %v5754 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5756 = stablehlo.reshape %v5755 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5757 = stablehlo.reshape %v5735 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5758 = stablehlo.dot_general %v5756, %v5757, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5759 = stablehlo.reshape %v5758 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5760 = stablehlo.reshape %v5759 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5761 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5762 = stablehlo.pad %v5760, %v5761, low = [0, 0, 192], high = [0, 0, 512], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5763 = stablehlo.reshape %v5762 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5764 = stablehlo.add %v5726, %v5763 : tensor<32x151296xf32>
    %v5765 = stablehlo.reshape %v5603 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5766 = stablehlo.slice %v5765 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5767 = stablehlo.reshape %v5766 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5768 = stablehlo.reshape %v5608 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5769 = stablehlo.slice %v5768 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5770 = stablehlo.reshape %v5769 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5771 = stablehlo.reshape %v5613 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5772 = stablehlo.slice %v5771 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5773 = stablehlo.reshape %v5772 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5774 = stablehlo.reshape %v5770 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5775 = stablehlo.transpose %v5774, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5776 = stablehlo.reshape %v5775 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5777 = stablehlo.reshape %v5767 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5778 = stablehlo.reshape %v5776 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5779 = stablehlo.dot_general %v5777, %v5778, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5780 = stablehlo.reshape %v5779 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5781 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5782 = stablehlo.multiply %v5780, %v5781 : tensor<32x38809xf32>
    %v5783 = stablehlo.reshape %v5782 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5784 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5785 = stablehlo.reduce(%v5783 init: %v5784) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5786 = stablehlo.broadcast_in_dim %v5785, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5787 = stablehlo.subtract %v5783, %v5786 : tensor<32x197x197xf32>
    %v5788 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5789 = stablehlo.exponential %v5787 : tensor<32x197x197xf32>
    %v5790 = stablehlo.reduce(%v5789 init: %v5788) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5791 = stablehlo.broadcast_in_dim %v5790, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5792 = stablehlo.divide %v5789, %v5791 : tensor<32x197x197xf32>
    %v5793 = stablehlo.reshape %v5792 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5794 = stablehlo.reshape %v5793 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5795 = stablehlo.reshape %v5773 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5796 = stablehlo.dot_general %v5794, %v5795, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5797 = stablehlo.reshape %v5796 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5798 = stablehlo.reshape %v5797 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5799 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5800 = stablehlo.pad %v5798, %v5799, low = [0, 0, 256], high = [0, 0, 448], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5801 = stablehlo.reshape %v5800 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5802 = stablehlo.add %v5764, %v5801 : tensor<32x151296xf32>
    %v5803 = stablehlo.reshape %v5603 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5804 = stablehlo.slice %v5803 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5805 = stablehlo.reshape %v5804 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5806 = stablehlo.reshape %v5608 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5807 = stablehlo.slice %v5806 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5808 = stablehlo.reshape %v5807 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5809 = stablehlo.reshape %v5613 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5810 = stablehlo.slice %v5809 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5811 = stablehlo.reshape %v5810 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5812 = stablehlo.reshape %v5808 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5813 = stablehlo.transpose %v5812, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5814 = stablehlo.reshape %v5813 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5815 = stablehlo.reshape %v5805 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5816 = stablehlo.reshape %v5814 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5817 = stablehlo.dot_general %v5815, %v5816, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5818 = stablehlo.reshape %v5817 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5819 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5820 = stablehlo.multiply %v5818, %v5819 : tensor<32x38809xf32>
    %v5821 = stablehlo.reshape %v5820 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5822 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5823 = stablehlo.reduce(%v5821 init: %v5822) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5824 = stablehlo.broadcast_in_dim %v5823, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5825 = stablehlo.subtract %v5821, %v5824 : tensor<32x197x197xf32>
    %v5826 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5827 = stablehlo.exponential %v5825 : tensor<32x197x197xf32>
    %v5828 = stablehlo.reduce(%v5827 init: %v5826) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5829 = stablehlo.broadcast_in_dim %v5828, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5830 = stablehlo.divide %v5827, %v5829 : tensor<32x197x197xf32>
    %v5831 = stablehlo.reshape %v5830 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5832 = stablehlo.reshape %v5831 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5833 = stablehlo.reshape %v5811 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5834 = stablehlo.dot_general %v5832, %v5833, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5835 = stablehlo.reshape %v5834 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5836 = stablehlo.reshape %v5835 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5837 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5838 = stablehlo.pad %v5836, %v5837, low = [0, 0, 320], high = [0, 0, 384], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5839 = stablehlo.reshape %v5838 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5840 = stablehlo.add %v5802, %v5839 : tensor<32x151296xf32>
    %v5841 = stablehlo.reshape %v5603 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5842 = stablehlo.slice %v5841 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5843 = stablehlo.reshape %v5842 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5844 = stablehlo.reshape %v5608 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5845 = stablehlo.slice %v5844 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5846 = stablehlo.reshape %v5845 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5847 = stablehlo.reshape %v5613 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5848 = stablehlo.slice %v5847 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5849 = stablehlo.reshape %v5848 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5850 = stablehlo.reshape %v5846 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5851 = stablehlo.transpose %v5850, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5852 = stablehlo.reshape %v5851 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5853 = stablehlo.reshape %v5843 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5854 = stablehlo.reshape %v5852 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5855 = stablehlo.dot_general %v5853, %v5854, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5856 = stablehlo.reshape %v5855 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5857 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5858 = stablehlo.multiply %v5856, %v5857 : tensor<32x38809xf32>
    %v5859 = stablehlo.reshape %v5858 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5860 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5861 = stablehlo.reduce(%v5859 init: %v5860) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5862 = stablehlo.broadcast_in_dim %v5861, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5863 = stablehlo.subtract %v5859, %v5862 : tensor<32x197x197xf32>
    %v5864 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5865 = stablehlo.exponential %v5863 : tensor<32x197x197xf32>
    %v5866 = stablehlo.reduce(%v5865 init: %v5864) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5867 = stablehlo.broadcast_in_dim %v5866, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5868 = stablehlo.divide %v5865, %v5867 : tensor<32x197x197xf32>
    %v5869 = stablehlo.reshape %v5868 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5870 = stablehlo.reshape %v5869 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5871 = stablehlo.reshape %v5849 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5872 = stablehlo.dot_general %v5870, %v5871, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5873 = stablehlo.reshape %v5872 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5874 = stablehlo.reshape %v5873 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5875 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5876 = stablehlo.pad %v5874, %v5875, low = [0, 0, 384], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5877 = stablehlo.reshape %v5876 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5878 = stablehlo.add %v5840, %v5877 : tensor<32x151296xf32>
    %v5879 = stablehlo.reshape %v5603 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5880 = stablehlo.slice %v5879 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5881 = stablehlo.reshape %v5880 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5882 = stablehlo.reshape %v5608 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5883 = stablehlo.slice %v5882 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5884 = stablehlo.reshape %v5883 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5885 = stablehlo.reshape %v5613 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5886 = stablehlo.slice %v5885 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5887 = stablehlo.reshape %v5886 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5888 = stablehlo.reshape %v5884 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5889 = stablehlo.transpose %v5888, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5890 = stablehlo.reshape %v5889 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5891 = stablehlo.reshape %v5881 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5892 = stablehlo.reshape %v5890 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5893 = stablehlo.dot_general %v5891, %v5892, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5894 = stablehlo.reshape %v5893 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5895 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5896 = stablehlo.multiply %v5894, %v5895 : tensor<32x38809xf32>
    %v5897 = stablehlo.reshape %v5896 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5898 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5899 = stablehlo.reduce(%v5897 init: %v5898) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5900 = stablehlo.broadcast_in_dim %v5899, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5901 = stablehlo.subtract %v5897, %v5900 : tensor<32x197x197xf32>
    %v5902 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5903 = stablehlo.exponential %v5901 : tensor<32x197x197xf32>
    %v5904 = stablehlo.reduce(%v5903 init: %v5902) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5905 = stablehlo.broadcast_in_dim %v5904, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5906 = stablehlo.divide %v5903, %v5905 : tensor<32x197x197xf32>
    %v5907 = stablehlo.reshape %v5906 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5908 = stablehlo.reshape %v5907 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5909 = stablehlo.reshape %v5887 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5910 = stablehlo.dot_general %v5908, %v5909, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5911 = stablehlo.reshape %v5910 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5912 = stablehlo.reshape %v5911 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5913 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5914 = stablehlo.pad %v5912, %v5913, low = [0, 0, 448], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5915 = stablehlo.reshape %v5914 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5916 = stablehlo.add %v5878, %v5915 : tensor<32x151296xf32>
    %v5917 = stablehlo.reshape %v5603 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5918 = stablehlo.slice %v5917 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5919 = stablehlo.reshape %v5918 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5920 = stablehlo.reshape %v5608 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5921 = stablehlo.slice %v5920 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5922 = stablehlo.reshape %v5921 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5923 = stablehlo.reshape %v5613 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5924 = stablehlo.slice %v5923 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5925 = stablehlo.reshape %v5924 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5926 = stablehlo.reshape %v5922 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5927 = stablehlo.transpose %v5926, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5928 = stablehlo.reshape %v5927 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5929 = stablehlo.reshape %v5919 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5930 = stablehlo.reshape %v5928 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5931 = stablehlo.dot_general %v5929, %v5930, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5932 = stablehlo.reshape %v5931 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5933 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5934 = stablehlo.multiply %v5932, %v5933 : tensor<32x38809xf32>
    %v5935 = stablehlo.reshape %v5934 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5936 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5937 = stablehlo.reduce(%v5935 init: %v5936) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5938 = stablehlo.broadcast_in_dim %v5937, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5939 = stablehlo.subtract %v5935, %v5938 : tensor<32x197x197xf32>
    %v5940 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5941 = stablehlo.exponential %v5939 : tensor<32x197x197xf32>
    %v5942 = stablehlo.reduce(%v5941 init: %v5940) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5943 = stablehlo.broadcast_in_dim %v5942, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5944 = stablehlo.divide %v5941, %v5943 : tensor<32x197x197xf32>
    %v5945 = stablehlo.reshape %v5944 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5946 = stablehlo.reshape %v5945 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5947 = stablehlo.reshape %v5925 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5948 = stablehlo.dot_general %v5946, %v5947, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5949 = stablehlo.reshape %v5948 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5950 = stablehlo.reshape %v5949 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5951 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5952 = stablehlo.pad %v5950, %v5951, low = [0, 0, 512], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5953 = stablehlo.reshape %v5952 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5954 = stablehlo.add %v5916, %v5953 : tensor<32x151296xf32>
    %v5955 = stablehlo.reshape %v5603 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5956 = stablehlo.slice %v5955 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5957 = stablehlo.reshape %v5956 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5958 = stablehlo.reshape %v5608 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5959 = stablehlo.slice %v5958 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5960 = stablehlo.reshape %v5959 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5961 = stablehlo.reshape %v5613 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5962 = stablehlo.slice %v5961 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5963 = stablehlo.reshape %v5962 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5964 = stablehlo.reshape %v5960 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5965 = stablehlo.transpose %v5964, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v5966 = stablehlo.reshape %v5965 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v5967 = stablehlo.reshape %v5957 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5968 = stablehlo.reshape %v5966 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v5969 = stablehlo.dot_general %v5967, %v5968, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v5970 = stablehlo.reshape %v5969 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5971 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v5972 = stablehlo.multiply %v5970, %v5971 : tensor<32x38809xf32>
    %v5973 = stablehlo.reshape %v5972 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5974 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v5975 = stablehlo.reduce(%v5973 init: %v5974) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5976 = stablehlo.broadcast_in_dim %v5975, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5977 = stablehlo.subtract %v5973, %v5976 : tensor<32x197x197xf32>
    %v5978 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5979 = stablehlo.exponential %v5977 : tensor<32x197x197xf32>
    %v5980 = stablehlo.reduce(%v5979 init: %v5978) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v5981 = stablehlo.broadcast_in_dim %v5980, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v5982 = stablehlo.divide %v5979, %v5981 : tensor<32x197x197xf32>
    %v5983 = stablehlo.reshape %v5982 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v5984 = stablehlo.reshape %v5983 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v5985 = stablehlo.reshape %v5963 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5986 = stablehlo.dot_general %v5984, %v5985, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v5987 = stablehlo.reshape %v5986 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5988 = stablehlo.reshape %v5987 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v5989 = stablehlo.constant dense<0.0> : tensor<f32>
    %v5990 = stablehlo.pad %v5988, %v5989, low = [0, 0, 576], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v5991 = stablehlo.reshape %v5990 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v5992 = stablehlo.add %v5954, %v5991 : tensor<32x151296xf32>
    %v5993 = stablehlo.reshape %v5603 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5994 = stablehlo.slice %v5993 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5995 = stablehlo.reshape %v5994 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5996 = stablehlo.reshape %v5608 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v5997 = stablehlo.slice %v5996 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v5998 = stablehlo.reshape %v5997 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v5999 = stablehlo.reshape %v5613 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6000 = stablehlo.slice %v5999 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6001 = stablehlo.reshape %v6000 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6002 = stablehlo.reshape %v5998 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6003 = stablehlo.transpose %v6002, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6004 = stablehlo.reshape %v6003 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6005 = stablehlo.reshape %v5995 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6006 = stablehlo.reshape %v6004 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6007 = stablehlo.dot_general %v6005, %v6006, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6008 = stablehlo.reshape %v6007 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6009 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6010 = stablehlo.multiply %v6008, %v6009 : tensor<32x38809xf32>
    %v6011 = stablehlo.reshape %v6010 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6012 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6013 = stablehlo.reduce(%v6011 init: %v6012) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6014 = stablehlo.broadcast_in_dim %v6013, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6015 = stablehlo.subtract %v6011, %v6014 : tensor<32x197x197xf32>
    %v6016 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6017 = stablehlo.exponential %v6015 : tensor<32x197x197xf32>
    %v6018 = stablehlo.reduce(%v6017 init: %v6016) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6019 = stablehlo.broadcast_in_dim %v6018, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6020 = stablehlo.divide %v6017, %v6019 : tensor<32x197x197xf32>
    %v6021 = stablehlo.reshape %v6020 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6022 = stablehlo.reshape %v6021 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6023 = stablehlo.reshape %v6001 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6024 = stablehlo.dot_general %v6022, %v6023, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6025 = stablehlo.reshape %v6024 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6026 = stablehlo.reshape %v6025 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6027 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6028 = stablehlo.pad %v6026, %v6027, low = [0, 0, 640], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6029 = stablehlo.reshape %v6028 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6030 = stablehlo.add %v5992, %v6029 : tensor<32x151296xf32>
    %v6031 = stablehlo.reshape %v5603 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6032 = stablehlo.slice %v6031 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6033 = stablehlo.reshape %v6032 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6034 = stablehlo.reshape %v5608 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6035 = stablehlo.slice %v6034 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6036 = stablehlo.reshape %v6035 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6037 = stablehlo.reshape %v5613 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6038 = stablehlo.slice %v6037 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6039 = stablehlo.reshape %v6038 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6040 = stablehlo.reshape %v6036 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6041 = stablehlo.transpose %v6040, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6042 = stablehlo.reshape %v6041 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6043 = stablehlo.reshape %v6033 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6044 = stablehlo.reshape %v6042 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6045 = stablehlo.dot_general %v6043, %v6044, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6046 = stablehlo.reshape %v6045 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6047 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6048 = stablehlo.multiply %v6046, %v6047 : tensor<32x38809xf32>
    %v6049 = stablehlo.reshape %v6048 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6050 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6051 = stablehlo.reduce(%v6049 init: %v6050) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6052 = stablehlo.broadcast_in_dim %v6051, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6053 = stablehlo.subtract %v6049, %v6052 : tensor<32x197x197xf32>
    %v6054 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6055 = stablehlo.exponential %v6053 : tensor<32x197x197xf32>
    %v6056 = stablehlo.reduce(%v6055 init: %v6054) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6057 = stablehlo.broadcast_in_dim %v6056, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6058 = stablehlo.divide %v6055, %v6057 : tensor<32x197x197xf32>
    %v6059 = stablehlo.reshape %v6058 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6060 = stablehlo.reshape %v6059 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6061 = stablehlo.reshape %v6039 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6062 = stablehlo.dot_general %v6060, %v6061, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6063 = stablehlo.reshape %v6062 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6064 = stablehlo.reshape %v6063 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6065 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6066 = stablehlo.pad %v6064, %v6065, low = [0, 0, 704], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6067 = stablehlo.reshape %v6066 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6068 = stablehlo.add %v6030, %v6067 : tensor<32x151296xf32>
    %v6069 = stablehlo.reshape %v6068 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6070 = stablehlo.dot_general %v6069, %b10_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v6071 = stablehlo.broadcast_in_dim %b10_bo, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6072 = stablehlo.add %v6070, %v6071 : tensor<32x197x768xf32>
    %v6073 = stablehlo.reshape %v6072 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6074 = stablehlo.add %v5570, %v6073 : tensor<32x151296xf32>
    %v6075 = stablehlo.reshape %v6074 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6076 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6077 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v6078 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v6079 = stablehlo.reduce(%v6075 init: %v6076) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6080 = stablehlo.broadcast_in_dim %v6079, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v6081 = stablehlo.divide %v6080, %v6077 : tensor<32x197x768xf32>
    %v6082 = stablehlo.subtract %v6075, %v6081 : tensor<32x197x768xf32>
    %v6083 = stablehlo.multiply %v6082, %v6082 : tensor<32x197x768xf32>
    %v6084 = stablehlo.reduce(%v6083 init: %v6076) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6085 = stablehlo.broadcast_in_dim %v6084, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v6086 = stablehlo.divide %v6085, %v6077 : tensor<32x197x768xf32>
    %v6087 = stablehlo.add %v6086, %v6078 : tensor<32x197x768xf32>
    %v6088 = stablehlo.rsqrt %v6087 : tensor<32x197x768xf32>
    %v6089 = stablehlo.multiply %v6082, %v6088 : tensor<32x197x768xf32>
    %v6090 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v6091 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v6092 = stablehlo.multiply %v6089, %v6090 : tensor<32x197x768xf32>
    %v6093 = stablehlo.add %v6092, %v6091 : tensor<32x197x768xf32>
    %v6094 = stablehlo.reshape %v6093 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6095 = stablehlo.reshape %v6094 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6096 = stablehlo.broadcast_in_dim %b10_g2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6097 = stablehlo.multiply %v6095, %v6096 : tensor<32x197x768xf32>
    %v6098 = stablehlo.reshape %v6097 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6099 = stablehlo.reshape %v6098 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6100 = stablehlo.broadcast_in_dim %b10_bt2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6101 = stablehlo.add %v6099, %v6100 : tensor<32x197x768xf32>
    %v6102 = stablehlo.reshape %v6101 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6103 = stablehlo.reshape %v6102 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6104 = stablehlo.dot_general %v6103, %b10_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x3072xf32>) -> tensor<32x197x3072xf32>
    %v6105 = stablehlo.broadcast_in_dim %b10_bfc1, dims = [2] : (tensor<3072xf32>) -> tensor<32x197x3072xf32>
    %v6106 = stablehlo.add %v6104, %v6105 : tensor<32x197x3072xf32>
    %v6107 = stablehlo.reshape %v6106 : (tensor<32x197x3072xf32>) -> tensor<32x605184xf32>
    %v6108 = stablehlo.multiply %v6107, %v6107 : tensor<32x605184xf32>
    %v6109 = stablehlo.multiply %v6108, %v6107 : tensor<32x605184xf32>
    %v6110 = stablehlo.constant dense<0.044715> : tensor<32x605184xf32>
    %v6111 = stablehlo.multiply %v6110, %v6109 : tensor<32x605184xf32>
    %v6112 = stablehlo.add %v6107, %v6111 : tensor<32x605184xf32>
    %v6113 = stablehlo.constant dense<0.7978845608028654> : tensor<32x605184xf32>
    %v6114 = stablehlo.multiply %v6113, %v6112 : tensor<32x605184xf32>
    %v6115 = stablehlo.tanh %v6114 : tensor<32x605184xf32>
    %v6116 = stablehlo.constant dense<1.0> : tensor<32x605184xf32>
    %v6117 = stablehlo.add %v6116, %v6115 : tensor<32x605184xf32>
    %v6118 = stablehlo.constant dense<0.5> : tensor<32x605184xf32>
    %v6119 = stablehlo.multiply %v6118, %v6107 : tensor<32x605184xf32>
    %v6120 = stablehlo.multiply %v6119, %v6117 : tensor<32x605184xf32>
    %v6121 = stablehlo.reshape %v6120 : (tensor<32x605184xf32>) -> tensor<32x197x3072xf32>
    %v6122 = stablehlo.dot_general %v6121, %b10_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x3072xf32>, tensor<3072x768xf32>) -> tensor<32x197x768xf32>
    %v6123 = stablehlo.broadcast_in_dim %b10_bfc2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6124 = stablehlo.add %v6122, %v6123 : tensor<32x197x768xf32>
    %v6125 = stablehlo.reshape %v6124 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6126 = stablehlo.add %v6074, %v6125 : tensor<32x151296xf32>
    %v6127 = stablehlo.reshape %v6126 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6128 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6129 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v6130 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v6131 = stablehlo.reduce(%v6127 init: %v6128) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6132 = stablehlo.broadcast_in_dim %v6131, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v6133 = stablehlo.divide %v6132, %v6129 : tensor<32x197x768xf32>
    %v6134 = stablehlo.subtract %v6127, %v6133 : tensor<32x197x768xf32>
    %v6135 = stablehlo.multiply %v6134, %v6134 : tensor<32x197x768xf32>
    %v6136 = stablehlo.reduce(%v6135 init: %v6128) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6137 = stablehlo.broadcast_in_dim %v6136, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v6138 = stablehlo.divide %v6137, %v6129 : tensor<32x197x768xf32>
    %v6139 = stablehlo.add %v6138, %v6130 : tensor<32x197x768xf32>
    %v6140 = stablehlo.rsqrt %v6139 : tensor<32x197x768xf32>
    %v6141 = stablehlo.multiply %v6134, %v6140 : tensor<32x197x768xf32>
    %v6142 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v6143 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v6144 = stablehlo.multiply %v6141, %v6142 : tensor<32x197x768xf32>
    %v6145 = stablehlo.add %v6144, %v6143 : tensor<32x197x768xf32>
    %v6146 = stablehlo.reshape %v6145 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6147 = stablehlo.reshape %v6146 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6148 = stablehlo.broadcast_in_dim %b11_g1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6149 = stablehlo.multiply %v6147, %v6148 : tensor<32x197x768xf32>
    %v6150 = stablehlo.reshape %v6149 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6151 = stablehlo.reshape %v6150 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6152 = stablehlo.broadcast_in_dim %b11_bt1, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6153 = stablehlo.add %v6151, %v6152 : tensor<32x197x768xf32>
    %v6154 = stablehlo.reshape %v6153 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6155 = stablehlo.reshape %v6154 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6156 = stablehlo.dot_general %v6155, %b11_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v6157 = stablehlo.broadcast_in_dim %b11_bq, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6158 = stablehlo.add %v6156, %v6157 : tensor<32x197x768xf32>
    %v6159 = stablehlo.reshape %v6158 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6160 = stablehlo.reshape %v6154 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6161 = stablehlo.dot_general %v6160, %b11_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v6162 = stablehlo.broadcast_in_dim %b11_bk, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6163 = stablehlo.add %v6161, %v6162 : tensor<32x197x768xf32>
    %v6164 = stablehlo.reshape %v6163 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6165 = stablehlo.reshape %v6154 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6166 = stablehlo.dot_general %v6165, %b11_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v6167 = stablehlo.broadcast_in_dim %b11_bv, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6168 = stablehlo.add %v6166, %v6167 : tensor<32x197x768xf32>
    %v6169 = stablehlo.reshape %v6168 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6170 = stablehlo.reshape %v6159 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6171 = stablehlo.slice %v6170 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6172 = stablehlo.reshape %v6171 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6173 = stablehlo.reshape %v6164 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6174 = stablehlo.slice %v6173 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6175 = stablehlo.reshape %v6174 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6176 = stablehlo.reshape %v6169 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6177 = stablehlo.slice %v6176 [0:32, 0:197, 0:64] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6178 = stablehlo.reshape %v6177 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6179 = stablehlo.reshape %v6175 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6180 = stablehlo.transpose %v6179, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6181 = stablehlo.reshape %v6180 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6182 = stablehlo.reshape %v6172 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6183 = stablehlo.reshape %v6181 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6184 = stablehlo.dot_general %v6182, %v6183, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6185 = stablehlo.reshape %v6184 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6186 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6187 = stablehlo.multiply %v6185, %v6186 : tensor<32x38809xf32>
    %v6188 = stablehlo.reshape %v6187 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6189 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6190 = stablehlo.reduce(%v6188 init: %v6189) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6191 = stablehlo.broadcast_in_dim %v6190, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6192 = stablehlo.subtract %v6188, %v6191 : tensor<32x197x197xf32>
    %v6193 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6194 = stablehlo.exponential %v6192 : tensor<32x197x197xf32>
    %v6195 = stablehlo.reduce(%v6194 init: %v6193) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6196 = stablehlo.broadcast_in_dim %v6195, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6197 = stablehlo.divide %v6194, %v6196 : tensor<32x197x197xf32>
    %v6198 = stablehlo.reshape %v6197 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6199 = stablehlo.reshape %v6198 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6200 = stablehlo.reshape %v6178 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6201 = stablehlo.dot_general %v6199, %v6200, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6202 = stablehlo.reshape %v6201 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6203 = stablehlo.reshape %v6202 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6204 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6205 = stablehlo.pad %v6203, %v6204, low = [0, 0, 0], high = [0, 0, 704], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6206 = stablehlo.reshape %v6205 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6207 = stablehlo.reshape %v6159 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6208 = stablehlo.slice %v6207 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6209 = stablehlo.reshape %v6208 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6210 = stablehlo.reshape %v6164 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6211 = stablehlo.slice %v6210 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6212 = stablehlo.reshape %v6211 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6213 = stablehlo.reshape %v6169 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6214 = stablehlo.slice %v6213 [0:32, 0:197, 64:128] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6215 = stablehlo.reshape %v6214 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6216 = stablehlo.reshape %v6212 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6217 = stablehlo.transpose %v6216, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6218 = stablehlo.reshape %v6217 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6219 = stablehlo.reshape %v6209 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6220 = stablehlo.reshape %v6218 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6221 = stablehlo.dot_general %v6219, %v6220, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6222 = stablehlo.reshape %v6221 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6223 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6224 = stablehlo.multiply %v6222, %v6223 : tensor<32x38809xf32>
    %v6225 = stablehlo.reshape %v6224 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6226 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6227 = stablehlo.reduce(%v6225 init: %v6226) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6228 = stablehlo.broadcast_in_dim %v6227, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6229 = stablehlo.subtract %v6225, %v6228 : tensor<32x197x197xf32>
    %v6230 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6231 = stablehlo.exponential %v6229 : tensor<32x197x197xf32>
    %v6232 = stablehlo.reduce(%v6231 init: %v6230) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6233 = stablehlo.broadcast_in_dim %v6232, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6234 = stablehlo.divide %v6231, %v6233 : tensor<32x197x197xf32>
    %v6235 = stablehlo.reshape %v6234 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6236 = stablehlo.reshape %v6235 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6237 = stablehlo.reshape %v6215 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6238 = stablehlo.dot_general %v6236, %v6237, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6239 = stablehlo.reshape %v6238 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6240 = stablehlo.reshape %v6239 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6241 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6242 = stablehlo.pad %v6240, %v6241, low = [0, 0, 64], high = [0, 0, 640], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6243 = stablehlo.reshape %v6242 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6244 = stablehlo.add %v6206, %v6243 : tensor<32x151296xf32>
    %v6245 = stablehlo.reshape %v6159 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6246 = stablehlo.slice %v6245 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6247 = stablehlo.reshape %v6246 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6248 = stablehlo.reshape %v6164 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6249 = stablehlo.slice %v6248 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6250 = stablehlo.reshape %v6249 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6251 = stablehlo.reshape %v6169 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6252 = stablehlo.slice %v6251 [0:32, 0:197, 128:192] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6253 = stablehlo.reshape %v6252 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6254 = stablehlo.reshape %v6250 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6255 = stablehlo.transpose %v6254, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6256 = stablehlo.reshape %v6255 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6257 = stablehlo.reshape %v6247 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6258 = stablehlo.reshape %v6256 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6259 = stablehlo.dot_general %v6257, %v6258, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6260 = stablehlo.reshape %v6259 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6261 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6262 = stablehlo.multiply %v6260, %v6261 : tensor<32x38809xf32>
    %v6263 = stablehlo.reshape %v6262 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6264 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6265 = stablehlo.reduce(%v6263 init: %v6264) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6266 = stablehlo.broadcast_in_dim %v6265, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6267 = stablehlo.subtract %v6263, %v6266 : tensor<32x197x197xf32>
    %v6268 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6269 = stablehlo.exponential %v6267 : tensor<32x197x197xf32>
    %v6270 = stablehlo.reduce(%v6269 init: %v6268) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6271 = stablehlo.broadcast_in_dim %v6270, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6272 = stablehlo.divide %v6269, %v6271 : tensor<32x197x197xf32>
    %v6273 = stablehlo.reshape %v6272 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6274 = stablehlo.reshape %v6273 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6275 = stablehlo.reshape %v6253 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6276 = stablehlo.dot_general %v6274, %v6275, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6277 = stablehlo.reshape %v6276 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6278 = stablehlo.reshape %v6277 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6279 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6280 = stablehlo.pad %v6278, %v6279, low = [0, 0, 128], high = [0, 0, 576], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6281 = stablehlo.reshape %v6280 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6282 = stablehlo.add %v6244, %v6281 : tensor<32x151296xf32>
    %v6283 = stablehlo.reshape %v6159 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6284 = stablehlo.slice %v6283 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6285 = stablehlo.reshape %v6284 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6286 = stablehlo.reshape %v6164 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6287 = stablehlo.slice %v6286 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6288 = stablehlo.reshape %v6287 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6289 = stablehlo.reshape %v6169 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6290 = stablehlo.slice %v6289 [0:32, 0:197, 192:256] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6291 = stablehlo.reshape %v6290 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6292 = stablehlo.reshape %v6288 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6293 = stablehlo.transpose %v6292, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6294 = stablehlo.reshape %v6293 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6295 = stablehlo.reshape %v6285 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6296 = stablehlo.reshape %v6294 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6297 = stablehlo.dot_general %v6295, %v6296, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6298 = stablehlo.reshape %v6297 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6299 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6300 = stablehlo.multiply %v6298, %v6299 : tensor<32x38809xf32>
    %v6301 = stablehlo.reshape %v6300 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6302 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6303 = stablehlo.reduce(%v6301 init: %v6302) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6304 = stablehlo.broadcast_in_dim %v6303, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6305 = stablehlo.subtract %v6301, %v6304 : tensor<32x197x197xf32>
    %v6306 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6307 = stablehlo.exponential %v6305 : tensor<32x197x197xf32>
    %v6308 = stablehlo.reduce(%v6307 init: %v6306) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6309 = stablehlo.broadcast_in_dim %v6308, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6310 = stablehlo.divide %v6307, %v6309 : tensor<32x197x197xf32>
    %v6311 = stablehlo.reshape %v6310 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6312 = stablehlo.reshape %v6311 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6313 = stablehlo.reshape %v6291 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6314 = stablehlo.dot_general %v6312, %v6313, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6315 = stablehlo.reshape %v6314 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6316 = stablehlo.reshape %v6315 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6317 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6318 = stablehlo.pad %v6316, %v6317, low = [0, 0, 192], high = [0, 0, 512], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6319 = stablehlo.reshape %v6318 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6320 = stablehlo.add %v6282, %v6319 : tensor<32x151296xf32>
    %v6321 = stablehlo.reshape %v6159 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6322 = stablehlo.slice %v6321 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6323 = stablehlo.reshape %v6322 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6324 = stablehlo.reshape %v6164 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6325 = stablehlo.slice %v6324 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6326 = stablehlo.reshape %v6325 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6327 = stablehlo.reshape %v6169 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6328 = stablehlo.slice %v6327 [0:32, 0:197, 256:320] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6329 = stablehlo.reshape %v6328 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6330 = stablehlo.reshape %v6326 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6331 = stablehlo.transpose %v6330, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6332 = stablehlo.reshape %v6331 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6333 = stablehlo.reshape %v6323 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6334 = stablehlo.reshape %v6332 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6335 = stablehlo.dot_general %v6333, %v6334, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6336 = stablehlo.reshape %v6335 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6337 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6338 = stablehlo.multiply %v6336, %v6337 : tensor<32x38809xf32>
    %v6339 = stablehlo.reshape %v6338 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6340 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6341 = stablehlo.reduce(%v6339 init: %v6340) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6342 = stablehlo.broadcast_in_dim %v6341, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6343 = stablehlo.subtract %v6339, %v6342 : tensor<32x197x197xf32>
    %v6344 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6345 = stablehlo.exponential %v6343 : tensor<32x197x197xf32>
    %v6346 = stablehlo.reduce(%v6345 init: %v6344) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6347 = stablehlo.broadcast_in_dim %v6346, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6348 = stablehlo.divide %v6345, %v6347 : tensor<32x197x197xf32>
    %v6349 = stablehlo.reshape %v6348 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6350 = stablehlo.reshape %v6349 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6351 = stablehlo.reshape %v6329 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6352 = stablehlo.dot_general %v6350, %v6351, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6353 = stablehlo.reshape %v6352 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6354 = stablehlo.reshape %v6353 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6355 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6356 = stablehlo.pad %v6354, %v6355, low = [0, 0, 256], high = [0, 0, 448], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6357 = stablehlo.reshape %v6356 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6358 = stablehlo.add %v6320, %v6357 : tensor<32x151296xf32>
    %v6359 = stablehlo.reshape %v6159 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6360 = stablehlo.slice %v6359 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6361 = stablehlo.reshape %v6360 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6362 = stablehlo.reshape %v6164 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6363 = stablehlo.slice %v6362 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6364 = stablehlo.reshape %v6363 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6365 = stablehlo.reshape %v6169 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6366 = stablehlo.slice %v6365 [0:32, 0:197, 320:384] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6367 = stablehlo.reshape %v6366 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6368 = stablehlo.reshape %v6364 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6369 = stablehlo.transpose %v6368, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6370 = stablehlo.reshape %v6369 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6371 = stablehlo.reshape %v6361 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6372 = stablehlo.reshape %v6370 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6373 = stablehlo.dot_general %v6371, %v6372, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6374 = stablehlo.reshape %v6373 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6375 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6376 = stablehlo.multiply %v6374, %v6375 : tensor<32x38809xf32>
    %v6377 = stablehlo.reshape %v6376 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6378 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6379 = stablehlo.reduce(%v6377 init: %v6378) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6380 = stablehlo.broadcast_in_dim %v6379, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6381 = stablehlo.subtract %v6377, %v6380 : tensor<32x197x197xf32>
    %v6382 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6383 = stablehlo.exponential %v6381 : tensor<32x197x197xf32>
    %v6384 = stablehlo.reduce(%v6383 init: %v6382) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6385 = stablehlo.broadcast_in_dim %v6384, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6386 = stablehlo.divide %v6383, %v6385 : tensor<32x197x197xf32>
    %v6387 = stablehlo.reshape %v6386 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6388 = stablehlo.reshape %v6387 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6389 = stablehlo.reshape %v6367 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6390 = stablehlo.dot_general %v6388, %v6389, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6391 = stablehlo.reshape %v6390 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6392 = stablehlo.reshape %v6391 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6393 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6394 = stablehlo.pad %v6392, %v6393, low = [0, 0, 320], high = [0, 0, 384], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6395 = stablehlo.reshape %v6394 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6396 = stablehlo.add %v6358, %v6395 : tensor<32x151296xf32>
    %v6397 = stablehlo.reshape %v6159 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6398 = stablehlo.slice %v6397 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6399 = stablehlo.reshape %v6398 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6400 = stablehlo.reshape %v6164 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6401 = stablehlo.slice %v6400 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6402 = stablehlo.reshape %v6401 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6403 = stablehlo.reshape %v6169 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6404 = stablehlo.slice %v6403 [0:32, 0:197, 384:448] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6405 = stablehlo.reshape %v6404 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6406 = stablehlo.reshape %v6402 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6407 = stablehlo.transpose %v6406, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6408 = stablehlo.reshape %v6407 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6409 = stablehlo.reshape %v6399 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6410 = stablehlo.reshape %v6408 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6411 = stablehlo.dot_general %v6409, %v6410, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6412 = stablehlo.reshape %v6411 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6413 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6414 = stablehlo.multiply %v6412, %v6413 : tensor<32x38809xf32>
    %v6415 = stablehlo.reshape %v6414 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6416 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6417 = stablehlo.reduce(%v6415 init: %v6416) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6418 = stablehlo.broadcast_in_dim %v6417, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6419 = stablehlo.subtract %v6415, %v6418 : tensor<32x197x197xf32>
    %v6420 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6421 = stablehlo.exponential %v6419 : tensor<32x197x197xf32>
    %v6422 = stablehlo.reduce(%v6421 init: %v6420) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6423 = stablehlo.broadcast_in_dim %v6422, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6424 = stablehlo.divide %v6421, %v6423 : tensor<32x197x197xf32>
    %v6425 = stablehlo.reshape %v6424 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6426 = stablehlo.reshape %v6425 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6427 = stablehlo.reshape %v6405 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6428 = stablehlo.dot_general %v6426, %v6427, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6429 = stablehlo.reshape %v6428 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6430 = stablehlo.reshape %v6429 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6431 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6432 = stablehlo.pad %v6430, %v6431, low = [0, 0, 384], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6433 = stablehlo.reshape %v6432 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6434 = stablehlo.add %v6396, %v6433 : tensor<32x151296xf32>
    %v6435 = stablehlo.reshape %v6159 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6436 = stablehlo.slice %v6435 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6437 = stablehlo.reshape %v6436 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6438 = stablehlo.reshape %v6164 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6439 = stablehlo.slice %v6438 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6440 = stablehlo.reshape %v6439 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6441 = stablehlo.reshape %v6169 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6442 = stablehlo.slice %v6441 [0:32, 0:197, 448:512] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6443 = stablehlo.reshape %v6442 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6444 = stablehlo.reshape %v6440 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6445 = stablehlo.transpose %v6444, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6446 = stablehlo.reshape %v6445 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6447 = stablehlo.reshape %v6437 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6448 = stablehlo.reshape %v6446 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6449 = stablehlo.dot_general %v6447, %v6448, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6450 = stablehlo.reshape %v6449 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6451 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6452 = stablehlo.multiply %v6450, %v6451 : tensor<32x38809xf32>
    %v6453 = stablehlo.reshape %v6452 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6454 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6455 = stablehlo.reduce(%v6453 init: %v6454) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6456 = stablehlo.broadcast_in_dim %v6455, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6457 = stablehlo.subtract %v6453, %v6456 : tensor<32x197x197xf32>
    %v6458 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6459 = stablehlo.exponential %v6457 : tensor<32x197x197xf32>
    %v6460 = stablehlo.reduce(%v6459 init: %v6458) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6461 = stablehlo.broadcast_in_dim %v6460, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6462 = stablehlo.divide %v6459, %v6461 : tensor<32x197x197xf32>
    %v6463 = stablehlo.reshape %v6462 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6464 = stablehlo.reshape %v6463 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6465 = stablehlo.reshape %v6443 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6466 = stablehlo.dot_general %v6464, %v6465, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6467 = stablehlo.reshape %v6466 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6468 = stablehlo.reshape %v6467 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6469 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6470 = stablehlo.pad %v6468, %v6469, low = [0, 0, 448], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6471 = stablehlo.reshape %v6470 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6472 = stablehlo.add %v6434, %v6471 : tensor<32x151296xf32>
    %v6473 = stablehlo.reshape %v6159 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6474 = stablehlo.slice %v6473 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6475 = stablehlo.reshape %v6474 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6476 = stablehlo.reshape %v6164 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6477 = stablehlo.slice %v6476 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6478 = stablehlo.reshape %v6477 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6479 = stablehlo.reshape %v6169 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6480 = stablehlo.slice %v6479 [0:32, 0:197, 512:576] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6481 = stablehlo.reshape %v6480 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6482 = stablehlo.reshape %v6478 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6483 = stablehlo.transpose %v6482, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6484 = stablehlo.reshape %v6483 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6485 = stablehlo.reshape %v6475 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6486 = stablehlo.reshape %v6484 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6487 = stablehlo.dot_general %v6485, %v6486, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6488 = stablehlo.reshape %v6487 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6489 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6490 = stablehlo.multiply %v6488, %v6489 : tensor<32x38809xf32>
    %v6491 = stablehlo.reshape %v6490 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6492 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6493 = stablehlo.reduce(%v6491 init: %v6492) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6494 = stablehlo.broadcast_in_dim %v6493, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6495 = stablehlo.subtract %v6491, %v6494 : tensor<32x197x197xf32>
    %v6496 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6497 = stablehlo.exponential %v6495 : tensor<32x197x197xf32>
    %v6498 = stablehlo.reduce(%v6497 init: %v6496) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6499 = stablehlo.broadcast_in_dim %v6498, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6500 = stablehlo.divide %v6497, %v6499 : tensor<32x197x197xf32>
    %v6501 = stablehlo.reshape %v6500 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6502 = stablehlo.reshape %v6501 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6503 = stablehlo.reshape %v6481 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6504 = stablehlo.dot_general %v6502, %v6503, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6505 = stablehlo.reshape %v6504 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6506 = stablehlo.reshape %v6505 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6507 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6508 = stablehlo.pad %v6506, %v6507, low = [0, 0, 512], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6509 = stablehlo.reshape %v6508 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6510 = stablehlo.add %v6472, %v6509 : tensor<32x151296xf32>
    %v6511 = stablehlo.reshape %v6159 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6512 = stablehlo.slice %v6511 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6513 = stablehlo.reshape %v6512 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6514 = stablehlo.reshape %v6164 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6515 = stablehlo.slice %v6514 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6516 = stablehlo.reshape %v6515 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6517 = stablehlo.reshape %v6169 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6518 = stablehlo.slice %v6517 [0:32, 0:197, 576:640] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6519 = stablehlo.reshape %v6518 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6520 = stablehlo.reshape %v6516 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6521 = stablehlo.transpose %v6520, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6522 = stablehlo.reshape %v6521 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6523 = stablehlo.reshape %v6513 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6524 = stablehlo.reshape %v6522 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6525 = stablehlo.dot_general %v6523, %v6524, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6526 = stablehlo.reshape %v6525 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6527 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6528 = stablehlo.multiply %v6526, %v6527 : tensor<32x38809xf32>
    %v6529 = stablehlo.reshape %v6528 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6530 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6531 = stablehlo.reduce(%v6529 init: %v6530) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6532 = stablehlo.broadcast_in_dim %v6531, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6533 = stablehlo.subtract %v6529, %v6532 : tensor<32x197x197xf32>
    %v6534 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6535 = stablehlo.exponential %v6533 : tensor<32x197x197xf32>
    %v6536 = stablehlo.reduce(%v6535 init: %v6534) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6537 = stablehlo.broadcast_in_dim %v6536, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6538 = stablehlo.divide %v6535, %v6537 : tensor<32x197x197xf32>
    %v6539 = stablehlo.reshape %v6538 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6540 = stablehlo.reshape %v6539 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6541 = stablehlo.reshape %v6519 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6542 = stablehlo.dot_general %v6540, %v6541, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6543 = stablehlo.reshape %v6542 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6544 = stablehlo.reshape %v6543 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6545 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6546 = stablehlo.pad %v6544, %v6545, low = [0, 0, 576], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6547 = stablehlo.reshape %v6546 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6548 = stablehlo.add %v6510, %v6547 : tensor<32x151296xf32>
    %v6549 = stablehlo.reshape %v6159 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6550 = stablehlo.slice %v6549 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6551 = stablehlo.reshape %v6550 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6552 = stablehlo.reshape %v6164 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6553 = stablehlo.slice %v6552 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6554 = stablehlo.reshape %v6553 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6555 = stablehlo.reshape %v6169 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6556 = stablehlo.slice %v6555 [0:32, 0:197, 640:704] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6557 = stablehlo.reshape %v6556 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6558 = stablehlo.reshape %v6554 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6559 = stablehlo.transpose %v6558, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6560 = stablehlo.reshape %v6559 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6561 = stablehlo.reshape %v6551 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6562 = stablehlo.reshape %v6560 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6563 = stablehlo.dot_general %v6561, %v6562, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6564 = stablehlo.reshape %v6563 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6565 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6566 = stablehlo.multiply %v6564, %v6565 : tensor<32x38809xf32>
    %v6567 = stablehlo.reshape %v6566 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6568 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6569 = stablehlo.reduce(%v6567 init: %v6568) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6570 = stablehlo.broadcast_in_dim %v6569, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6571 = stablehlo.subtract %v6567, %v6570 : tensor<32x197x197xf32>
    %v6572 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6573 = stablehlo.exponential %v6571 : tensor<32x197x197xf32>
    %v6574 = stablehlo.reduce(%v6573 init: %v6572) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6575 = stablehlo.broadcast_in_dim %v6574, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6576 = stablehlo.divide %v6573, %v6575 : tensor<32x197x197xf32>
    %v6577 = stablehlo.reshape %v6576 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6578 = stablehlo.reshape %v6577 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6579 = stablehlo.reshape %v6557 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6580 = stablehlo.dot_general %v6578, %v6579, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6581 = stablehlo.reshape %v6580 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6582 = stablehlo.reshape %v6581 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6583 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6584 = stablehlo.pad %v6582, %v6583, low = [0, 0, 640], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6585 = stablehlo.reshape %v6584 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6586 = stablehlo.add %v6548, %v6585 : tensor<32x151296xf32>
    %v6587 = stablehlo.reshape %v6159 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6588 = stablehlo.slice %v6587 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6589 = stablehlo.reshape %v6588 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6590 = stablehlo.reshape %v6164 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6591 = stablehlo.slice %v6590 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6592 = stablehlo.reshape %v6591 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6593 = stablehlo.reshape %v6169 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6594 = stablehlo.slice %v6593 [0:32, 0:197, 704:768] : (tensor<32x197x768xf32>) -> tensor<32x197x64xf32>
    %v6595 = stablehlo.reshape %v6594 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6596 = stablehlo.reshape %v6592 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6597 = stablehlo.transpose %v6596, dims = [0, 2, 1] : (tensor<32x197x64xf32>) -> tensor<32x64x197xf32>
    %v6598 = stablehlo.reshape %v6597 : (tensor<32x64x197xf32>) -> tensor<32x12608xf32>
    %v6599 = stablehlo.reshape %v6589 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6600 = stablehlo.reshape %v6598 : (tensor<32x12608xf32>) -> tensor<32x64x197xf32>
    %v6601 = stablehlo.dot_general %v6599, %v6600, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x64xf32>, tensor<32x64x197xf32>) -> tensor<32x197x197xf32>
    %v6602 = stablehlo.reshape %v6601 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6603 = stablehlo.constant dense<0.125> : tensor<32x38809xf32>
    %v6604 = stablehlo.multiply %v6602, %v6603 : tensor<32x38809xf32>
    %v6605 = stablehlo.reshape %v6604 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6606 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v6607 = stablehlo.reduce(%v6605 init: %v6606) applies stablehlo.maximum across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6608 = stablehlo.broadcast_in_dim %v6607, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6609 = stablehlo.subtract %v6605, %v6608 : tensor<32x197x197xf32>
    %v6610 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6611 = stablehlo.exponential %v6609 : tensor<32x197x197xf32>
    %v6612 = stablehlo.reduce(%v6611 init: %v6610) applies stablehlo.add across dimensions = [2] : (tensor<32x197x197xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6613 = stablehlo.broadcast_in_dim %v6612, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x197xf32>
    %v6614 = stablehlo.divide %v6611, %v6613 : tensor<32x197x197xf32>
    %v6615 = stablehlo.reshape %v6614 : (tensor<32x197x197xf32>) -> tensor<32x38809xf32>
    %v6616 = stablehlo.reshape %v6615 : (tensor<32x38809xf32>) -> tensor<32x197x197xf32>
    %v6617 = stablehlo.reshape %v6595 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6618 = stablehlo.dot_general %v6616, %v6617, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<32x197x197xf32>, tensor<32x197x64xf32>) -> tensor<32x197x64xf32>
    %v6619 = stablehlo.reshape %v6618 : (tensor<32x197x64xf32>) -> tensor<32x12608xf32>
    %v6620 = stablehlo.reshape %v6619 : (tensor<32x12608xf32>) -> tensor<32x197x64xf32>
    %v6621 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6622 = stablehlo.pad %v6620, %v6621, low = [0, 0, 704], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<32x197x64xf32>, tensor<f32>) -> tensor<32x197x768xf32>
    %v6623 = stablehlo.reshape %v6622 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6624 = stablehlo.add %v6586, %v6623 : tensor<32x151296xf32>
    %v6625 = stablehlo.reshape %v6624 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6626 = stablehlo.dot_general %v6625, %b11_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x768xf32>) -> tensor<32x197x768xf32>
    %v6627 = stablehlo.broadcast_in_dim %b11_bo, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6628 = stablehlo.add %v6626, %v6627 : tensor<32x197x768xf32>
    %v6629 = stablehlo.reshape %v6628 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6630 = stablehlo.add %v6126, %v6629 : tensor<32x151296xf32>
    %v6631 = stablehlo.reshape %v6630 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6632 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6633 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v6634 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v6635 = stablehlo.reduce(%v6631 init: %v6632) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6636 = stablehlo.broadcast_in_dim %v6635, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v6637 = stablehlo.divide %v6636, %v6633 : tensor<32x197x768xf32>
    %v6638 = stablehlo.subtract %v6631, %v6637 : tensor<32x197x768xf32>
    %v6639 = stablehlo.multiply %v6638, %v6638 : tensor<32x197x768xf32>
    %v6640 = stablehlo.reduce(%v6639 init: %v6632) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6641 = stablehlo.broadcast_in_dim %v6640, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v6642 = stablehlo.divide %v6641, %v6633 : tensor<32x197x768xf32>
    %v6643 = stablehlo.add %v6642, %v6634 : tensor<32x197x768xf32>
    %v6644 = stablehlo.rsqrt %v6643 : tensor<32x197x768xf32>
    %v6645 = stablehlo.multiply %v6638, %v6644 : tensor<32x197x768xf32>
    %v6646 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v6647 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v6648 = stablehlo.multiply %v6645, %v6646 : tensor<32x197x768xf32>
    %v6649 = stablehlo.add %v6648, %v6647 : tensor<32x197x768xf32>
    %v6650 = stablehlo.reshape %v6649 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6651 = stablehlo.reshape %v6650 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6652 = stablehlo.broadcast_in_dim %b11_g2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6653 = stablehlo.multiply %v6651, %v6652 : tensor<32x197x768xf32>
    %v6654 = stablehlo.reshape %v6653 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6655 = stablehlo.reshape %v6654 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6656 = stablehlo.broadcast_in_dim %b11_bt2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6657 = stablehlo.add %v6655, %v6656 : tensor<32x197x768xf32>
    %v6658 = stablehlo.reshape %v6657 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6659 = stablehlo.reshape %v6658 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6660 = stablehlo.dot_general %v6659, %b11_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x768xf32>, tensor<768x3072xf32>) -> tensor<32x197x3072xf32>
    %v6661 = stablehlo.broadcast_in_dim %b11_bfc1, dims = [2] : (tensor<3072xf32>) -> tensor<32x197x3072xf32>
    %v6662 = stablehlo.add %v6660, %v6661 : tensor<32x197x3072xf32>
    %v6663 = stablehlo.reshape %v6662 : (tensor<32x197x3072xf32>) -> tensor<32x605184xf32>
    %v6664 = stablehlo.multiply %v6663, %v6663 : tensor<32x605184xf32>
    %v6665 = stablehlo.multiply %v6664, %v6663 : tensor<32x605184xf32>
    %v6666 = stablehlo.constant dense<0.044715> : tensor<32x605184xf32>
    %v6667 = stablehlo.multiply %v6666, %v6665 : tensor<32x605184xf32>
    %v6668 = stablehlo.add %v6663, %v6667 : tensor<32x605184xf32>
    %v6669 = stablehlo.constant dense<0.7978845608028654> : tensor<32x605184xf32>
    %v6670 = stablehlo.multiply %v6669, %v6668 : tensor<32x605184xf32>
    %v6671 = stablehlo.tanh %v6670 : tensor<32x605184xf32>
    %v6672 = stablehlo.constant dense<1.0> : tensor<32x605184xf32>
    %v6673 = stablehlo.add %v6672, %v6671 : tensor<32x605184xf32>
    %v6674 = stablehlo.constant dense<0.5> : tensor<32x605184xf32>
    %v6675 = stablehlo.multiply %v6674, %v6663 : tensor<32x605184xf32>
    %v6676 = stablehlo.multiply %v6675, %v6673 : tensor<32x605184xf32>
    %v6677 = stablehlo.reshape %v6676 : (tensor<32x605184xf32>) -> tensor<32x197x3072xf32>
    %v6678 = stablehlo.dot_general %v6677, %b11_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x197x3072xf32>, tensor<3072x768xf32>) -> tensor<32x197x768xf32>
    %v6679 = stablehlo.broadcast_in_dim %b11_bfc2, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6680 = stablehlo.add %v6678, %v6679 : tensor<32x197x768xf32>
    %v6681 = stablehlo.reshape %v6680 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6682 = stablehlo.add %v6630, %v6681 : tensor<32x151296xf32>
    %v6683 = stablehlo.reshape %v6682 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6684 = stablehlo.constant dense<0.0> : tensor<f32>
    %v6685 = stablehlo.constant dense<768.0> : tensor<32x197x768xf32>
    %v6686 = stablehlo.constant dense<1.0e-6> : tensor<32x197x768xf32>
    %v6687 = stablehlo.reduce(%v6683 init: %v6684) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6688 = stablehlo.broadcast_in_dim %v6687, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v6689 = stablehlo.divide %v6688, %v6685 : tensor<32x197x768xf32>
    %v6690 = stablehlo.subtract %v6683, %v6689 : tensor<32x197x768xf32>
    %v6691 = stablehlo.multiply %v6690, %v6690 : tensor<32x197x768xf32>
    %v6692 = stablehlo.reduce(%v6691 init: %v6684) applies stablehlo.add across dimensions = [2] : (tensor<32x197x768xf32>, tensor<f32>) -> tensor<32x197xf32>
    %v6693 = stablehlo.broadcast_in_dim %v6692, dims = [0, 1] : (tensor<32x197xf32>) -> tensor<32x197x768xf32>
    %v6694 = stablehlo.divide %v6693, %v6685 : tensor<32x197x768xf32>
    %v6695 = stablehlo.add %v6694, %v6686 : tensor<32x197x768xf32>
    %v6696 = stablehlo.rsqrt %v6695 : tensor<32x197x768xf32>
    %v6697 = stablehlo.multiply %v6690, %v6696 : tensor<32x197x768xf32>
    %v6698 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v6699 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<32x197x768xf32>
    %v6700 = stablehlo.multiply %v6697, %v6698 : tensor<32x197x768xf32>
    %v6701 = stablehlo.add %v6700, %v6699 : tensor<32x197x768xf32>
    %v6702 = stablehlo.reshape %v6701 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6703 = stablehlo.reshape %v6702 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6704 = stablehlo.broadcast_in_dim %gF, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6705 = stablehlo.multiply %v6703, %v6704 : tensor<32x197x768xf32>
    %v6706 = stablehlo.reshape %v6705 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6707 = stablehlo.reshape %v6706 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6708 = stablehlo.broadcast_in_dim %btF, dims = [2] : (tensor<768xf32>) -> tensor<32x197x768xf32>
    %v6709 = stablehlo.add %v6707, %v6708 : tensor<32x197x768xf32>
    %v6710 = stablehlo.reshape %v6709 : (tensor<32x197x768xf32>) -> tensor<32x151296xf32>
    %v6711 = stablehlo.reshape %v6710 : (tensor<32x151296xf32>) -> tensor<32x197x768xf32>
    %v6712 = stablehlo.slice %v6711 [0:32, 0:1, 0:768] : (tensor<32x197x768xf32>) -> tensor<32x1x768xf32>
    %v6713 = stablehlo.reshape %v6712 : (tensor<32x1x768xf32>) -> tensor<32x768xf32>
    %v6714 = stablehlo.dot_general %v6713, %Wc, contracting_dims = [1] x [0], precision = [DEFAULT, DEFAULT] : (tensor<32x768xf32>, tensor<768x1000xf32>) -> tensor<32x1000xf32>
    %v6715 = stablehlo.broadcast_in_dim %bc, dims = [1] : (tensor<1000xf32>) -> tensor<32x1000xf32>
    %v6716 = stablehlo.add %v6714, %v6715 : tensor<32x1000xf32>
    return %v6716 : tensor<32x1000xf32>
  }
}
