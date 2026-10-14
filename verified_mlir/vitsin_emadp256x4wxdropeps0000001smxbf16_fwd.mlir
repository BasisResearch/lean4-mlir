module @m {
  func.func @vitsin_emadp256x4wxdropeps0000001smxbf16_fwd(%x: tensor<256x150528xf32>, %wConv: tensor<384x3x16x16xf32>, %bConv: tensor<384xf32>, %cls: tensor<384xf32>, %pos: tensor<197x384xf32>, %b0_g1: tensor<384xf32>, %b0_bt1: tensor<384xf32>, %b0_Wq: tensor<384x384xf32>, %b0_bq: tensor<384xf32>, %b0_Wk: tensor<384x384xf32>, %b0_bk: tensor<384xf32>, %b0_Wv: tensor<384x384xf32>, %b0_bv: tensor<384xf32>, %b0_Wo: tensor<384x384xf32>, %b0_bo: tensor<384xf32>, %b0_g2: tensor<384xf32>, %b0_bt2: tensor<384xf32>, %b0_Wfc1: tensor<384x1536xf32>, %b0_bfc1: tensor<1536xf32>, %b0_Wfc2: tensor<1536x384xf32>, %b0_bfc2: tensor<384xf32>, %b1_g1: tensor<384xf32>, %b1_bt1: tensor<384xf32>, %b1_Wq: tensor<384x384xf32>, %b1_bq: tensor<384xf32>, %b1_Wk: tensor<384x384xf32>, %b1_bk: tensor<384xf32>, %b1_Wv: tensor<384x384xf32>, %b1_bv: tensor<384xf32>, %b1_Wo: tensor<384x384xf32>, %b1_bo: tensor<384xf32>, %b1_g2: tensor<384xf32>, %b1_bt2: tensor<384xf32>, %b1_Wfc1: tensor<384x1536xf32>, %b1_bfc1: tensor<1536xf32>, %b1_Wfc2: tensor<1536x384xf32>, %b1_bfc2: tensor<384xf32>, %b2_g1: tensor<384xf32>, %b2_bt1: tensor<384xf32>, %b2_Wq: tensor<384x384xf32>, %b2_bq: tensor<384xf32>, %b2_Wk: tensor<384x384xf32>, %b2_bk: tensor<384xf32>, %b2_Wv: tensor<384x384xf32>, %b2_bv: tensor<384xf32>, %b2_Wo: tensor<384x384xf32>, %b2_bo: tensor<384xf32>, %b2_g2: tensor<384xf32>, %b2_bt2: tensor<384xf32>, %b2_Wfc1: tensor<384x1536xf32>, %b2_bfc1: tensor<1536xf32>, %b2_Wfc2: tensor<1536x384xf32>, %b2_bfc2: tensor<384xf32>, %b3_g1: tensor<384xf32>, %b3_bt1: tensor<384xf32>, %b3_Wq: tensor<384x384xf32>, %b3_bq: tensor<384xf32>, %b3_Wk: tensor<384x384xf32>, %b3_bk: tensor<384xf32>, %b3_Wv: tensor<384x384xf32>, %b3_bv: tensor<384xf32>, %b3_Wo: tensor<384x384xf32>, %b3_bo: tensor<384xf32>, %b3_g2: tensor<384xf32>, %b3_bt2: tensor<384xf32>, %b3_Wfc1: tensor<384x1536xf32>, %b3_bfc1: tensor<1536xf32>, %b3_Wfc2: tensor<1536x384xf32>, %b3_bfc2: tensor<384xf32>, %b4_g1: tensor<384xf32>, %b4_bt1: tensor<384xf32>, %b4_Wq: tensor<384x384xf32>, %b4_bq: tensor<384xf32>, %b4_Wk: tensor<384x384xf32>, %b4_bk: tensor<384xf32>, %b4_Wv: tensor<384x384xf32>, %b4_bv: tensor<384xf32>, %b4_Wo: tensor<384x384xf32>, %b4_bo: tensor<384xf32>, %b4_g2: tensor<384xf32>, %b4_bt2: tensor<384xf32>, %b4_Wfc1: tensor<384x1536xf32>, %b4_bfc1: tensor<1536xf32>, %b4_Wfc2: tensor<1536x384xf32>, %b4_bfc2: tensor<384xf32>, %b5_g1: tensor<384xf32>, %b5_bt1: tensor<384xf32>, %b5_Wq: tensor<384x384xf32>, %b5_bq: tensor<384xf32>, %b5_Wk: tensor<384x384xf32>, %b5_bk: tensor<384xf32>, %b5_Wv: tensor<384x384xf32>, %b5_bv: tensor<384xf32>, %b5_Wo: tensor<384x384xf32>, %b5_bo: tensor<384xf32>, %b5_g2: tensor<384xf32>, %b5_bt2: tensor<384xf32>, %b5_Wfc1: tensor<384x1536xf32>, %b5_bfc1: tensor<1536xf32>, %b5_Wfc2: tensor<1536x384xf32>, %b5_bfc2: tensor<384xf32>, %b6_g1: tensor<384xf32>, %b6_bt1: tensor<384xf32>, %b6_Wq: tensor<384x384xf32>, %b6_bq: tensor<384xf32>, %b6_Wk: tensor<384x384xf32>, %b6_bk: tensor<384xf32>, %b6_Wv: tensor<384x384xf32>, %b6_bv: tensor<384xf32>, %b6_Wo: tensor<384x384xf32>, %b6_bo: tensor<384xf32>, %b6_g2: tensor<384xf32>, %b6_bt2: tensor<384xf32>, %b6_Wfc1: tensor<384x1536xf32>, %b6_bfc1: tensor<1536xf32>, %b6_Wfc2: tensor<1536x384xf32>, %b6_bfc2: tensor<384xf32>, %b7_g1: tensor<384xf32>, %b7_bt1: tensor<384xf32>, %b7_Wq: tensor<384x384xf32>, %b7_bq: tensor<384xf32>, %b7_Wk: tensor<384x384xf32>, %b7_bk: tensor<384xf32>, %b7_Wv: tensor<384x384xf32>, %b7_bv: tensor<384xf32>, %b7_Wo: tensor<384x384xf32>, %b7_bo: tensor<384xf32>, %b7_g2: tensor<384xf32>, %b7_bt2: tensor<384xf32>, %b7_Wfc1: tensor<384x1536xf32>, %b7_bfc1: tensor<1536xf32>, %b7_Wfc2: tensor<1536x384xf32>, %b7_bfc2: tensor<384xf32>, %b8_g1: tensor<384xf32>, %b8_bt1: tensor<384xf32>, %b8_Wq: tensor<384x384xf32>, %b8_bq: tensor<384xf32>, %b8_Wk: tensor<384x384xf32>, %b8_bk: tensor<384xf32>, %b8_Wv: tensor<384x384xf32>, %b8_bv: tensor<384xf32>, %b8_Wo: tensor<384x384xf32>, %b8_bo: tensor<384xf32>, %b8_g2: tensor<384xf32>, %b8_bt2: tensor<384xf32>, %b8_Wfc1: tensor<384x1536xf32>, %b8_bfc1: tensor<1536xf32>, %b8_Wfc2: tensor<1536x384xf32>, %b8_bfc2: tensor<384xf32>, %b9_g1: tensor<384xf32>, %b9_bt1: tensor<384xf32>, %b9_Wq: tensor<384x384xf32>, %b9_bq: tensor<384xf32>, %b9_Wk: tensor<384x384xf32>, %b9_bk: tensor<384xf32>, %b9_Wv: tensor<384x384xf32>, %b9_bv: tensor<384xf32>, %b9_Wo: tensor<384x384xf32>, %b9_bo: tensor<384xf32>, %b9_g2: tensor<384xf32>, %b9_bt2: tensor<384xf32>, %b9_Wfc1: tensor<384x1536xf32>, %b9_bfc1: tensor<1536xf32>, %b9_Wfc2: tensor<1536x384xf32>, %b9_bfc2: tensor<384xf32>, %b10_g1: tensor<384xf32>, %b10_bt1: tensor<384xf32>, %b10_Wq: tensor<384x384xf32>, %b10_bq: tensor<384xf32>, %b10_Wk: tensor<384x384xf32>, %b10_bk: tensor<384xf32>, %b10_Wv: tensor<384x384xf32>, %b10_bv: tensor<384xf32>, %b10_Wo: tensor<384x384xf32>, %b10_bo: tensor<384xf32>, %b10_g2: tensor<384xf32>, %b10_bt2: tensor<384xf32>, %b10_Wfc1: tensor<384x1536xf32>, %b10_bfc1: tensor<1536xf32>, %b10_Wfc2: tensor<1536x384xf32>, %b10_bfc2: tensor<384xf32>, %b11_g1: tensor<384xf32>, %b11_bt1: tensor<384xf32>, %b11_Wq: tensor<384x384xf32>, %b11_bq: tensor<384xf32>, %b11_Wk: tensor<384x384xf32>, %b11_bk: tensor<384xf32>, %b11_Wv: tensor<384x384xf32>, %b11_bv: tensor<384xf32>, %b11_Wo: tensor<384x384xf32>, %b11_bo: tensor<384xf32>, %b11_g2: tensor<384xf32>, %b11_bt2: tensor<384xf32>, %b11_Wfc1: tensor<384x1536xf32>, %b11_bfc1: tensor<1536xf32>, %b11_Wfc2: tensor<1536x384xf32>, %b11_bfc2: tensor<384xf32>, %gF: tensor<384xf32>, %btF: tensor<384xf32>, %Wc: tensor<384x1000xf32>, %bc: tensor<1000xf32>) -> tensor<256x1000xf32> {
    %one = stablehlo.constant dense<1.0> : tensor<f32>
    %zero = stablehlo.constant dense<0.0> : tensor<f32>
    %sc = stablehlo.constant dense<0.0> : tensor<f32>
    %v0 = stablehlo.reshape %x : (tensor<256x150528xf32>) -> tensor<256x3x224x224xf32>
    %v1 = stablehlo.convolution(%v0, %wConv)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [16, 16], pad = [[0, 0], [0, 0]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<256x3x224x224xf32>, tensor<384x3x16x16xf32>) -> tensor<256x384x14x14xf32>
    %v2 = stablehlo.broadcast_in_dim %bConv, dims = [1] : (tensor<384xf32>) -> tensor<256x384x14x14xf32>
    %v3 = stablehlo.add %v1, %v2 : tensor<256x384x14x14xf32>
    %v4 = stablehlo.transpose %v3, dims = [0, 2, 3, 1] : (tensor<256x384x14x14xf32>) -> tensor<256x14x14x384xf32>
    %v5 = stablehlo.reshape %v4 : (tensor<256x14x14x384xf32>) -> tensor<256x196x384xf32>
    %v6 = stablehlo.broadcast_in_dim %cls, dims = [2] : (tensor<384xf32>) -> tensor<256x1x384xf32>
    %v7 = stablehlo.concatenate %v6, %v5, dim = 1 : (tensor<256x1x384xf32>, tensor<256x196x384xf32>) -> tensor<256x197x384xf32>
    %v8 = stablehlo.broadcast_in_dim %pos, dims = [1, 2] : (tensor<197x384xf32>) -> tensor<256x197x384xf32>
    %v9 = stablehlo.add %v7, %v8 : tensor<256x197x384xf32>
    %v10 = stablehlo.reshape %v9 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v11 = stablehlo.reshape %v10 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v12 = stablehlo.constant dense<0.0> : tensor<f32>
    %v13 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v14 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v15 = stablehlo.reduce(%v11 init: %v12) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v16 = stablehlo.broadcast_in_dim %v15, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v17 = stablehlo.divide %v16, %v13 : tensor<256x197x384xf32>
    %v18 = stablehlo.subtract %v11, %v17 : tensor<256x197x384xf32>
    %v19 = stablehlo.multiply %v18, %v18 : tensor<256x197x384xf32>
    %v20 = stablehlo.reduce(%v19 init: %v12) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v21 = stablehlo.broadcast_in_dim %v20, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v22 = stablehlo.divide %v21, %v13 : tensor<256x197x384xf32>
    %v23 = stablehlo.add %v22, %v14 : tensor<256x197x384xf32>
    %v24 = stablehlo.rsqrt %v23 : tensor<256x197x384xf32>
    %v25 = stablehlo.multiply %v18, %v24 : tensor<256x197x384xf32>
    %v26 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v27 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v28 = stablehlo.multiply %v25, %v26 : tensor<256x197x384xf32>
    %v29 = stablehlo.add %v28, %v27 : tensor<256x197x384xf32>
    %v30 = stablehlo.reshape %v29 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v31 = stablehlo.reshape %v30 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v32 = stablehlo.broadcast_in_dim %b0_g1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v33 = stablehlo.multiply %v31, %v32 : tensor<256x197x384xf32>
    %v34 = stablehlo.reshape %v33 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v35 = stablehlo.reshape %v34 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v36 = stablehlo.broadcast_in_dim %b0_bt1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v37 = stablehlo.add %v35, %v36 : tensor<256x197x384xf32>
    %v38 = stablehlo.reshape %v37 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v39 = stablehlo.reshape %v38 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v40 = stablehlo.dot_general %v39, %b0_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v41 = stablehlo.broadcast_in_dim %b0_bq, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v42 = stablehlo.add %v40, %v41 : tensor<256x197x384xf32>
    %v43 = stablehlo.reshape %v42 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v44 = stablehlo.reshape %v38 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v45 = stablehlo.dot_general %v44, %b0_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v46 = stablehlo.broadcast_in_dim %b0_bk, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v47 = stablehlo.add %v45, %v46 : tensor<256x197x384xf32>
    %v48 = stablehlo.reshape %v47 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v49 = stablehlo.reshape %v38 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v50 = stablehlo.dot_general %v49, %b0_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v51 = stablehlo.broadcast_in_dim %b0_bv, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v52 = stablehlo.add %v50, %v51 : tensor<256x197x384xf32>
    %v53 = stablehlo.reshape %v52 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v54 = stablehlo.reshape %v43 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v55 = stablehlo.slice %v54 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v56 = stablehlo.reshape %v55 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v57 = stablehlo.reshape %v48 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v58 = stablehlo.slice %v57 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v59 = stablehlo.reshape %v58 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v60 = stablehlo.reshape %v53 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v61 = stablehlo.slice %v60 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v62 = stablehlo.reshape %v61 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v63 = stablehlo.reshape %v59 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v64 = stablehlo.transpose %v63, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v65 = stablehlo.reshape %v64 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v66 = stablehlo.reshape %v56 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v67 = stablehlo.reshape %v65 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v68 = stablehlo.dot_general %v66, %v67, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v69 = stablehlo.reshape %v68 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v70 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v71 = stablehlo.multiply %v69, %v70 : tensor<256x38809xf32>
    %v72 = stablehlo.reshape %v71 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v73 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v74 = stablehlo.reduce(%v72 init: %v73) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v75 = stablehlo.broadcast_in_dim %v74, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v76 = stablehlo.subtract %v72, %v75 : tensor<256x197x197xf32>
    %v77 = stablehlo.constant dense<0.0> : tensor<f32>
    %v78 = stablehlo.exponential %v76 : tensor<256x197x197xf32>
    %v79 = stablehlo.reduce(%v78 init: %v77) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v80 = stablehlo.broadcast_in_dim %v79, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v81 = stablehlo.divide %v78, %v80 : tensor<256x197x197xf32>
    %v82 = stablehlo.reshape %v81 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v83 = stablehlo.reshape %v82 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v84 = stablehlo.reshape %v62 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v85 = stablehlo.dot_general %v83, %v84, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v86 = stablehlo.reshape %v85 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v87 = stablehlo.reshape %v86 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v88 = stablehlo.constant dense<0.0> : tensor<f32>
    %v89 = stablehlo.pad %v87, %v88, low = [0, 0, 0], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v90 = stablehlo.reshape %v89 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v91 = stablehlo.reshape %v43 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v92 = stablehlo.slice %v91 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v93 = stablehlo.reshape %v92 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v94 = stablehlo.reshape %v48 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v95 = stablehlo.slice %v94 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v96 = stablehlo.reshape %v95 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v97 = stablehlo.reshape %v53 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v98 = stablehlo.slice %v97 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v99 = stablehlo.reshape %v98 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v100 = stablehlo.reshape %v96 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v101 = stablehlo.transpose %v100, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v102 = stablehlo.reshape %v101 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v103 = stablehlo.reshape %v93 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v104 = stablehlo.reshape %v102 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v105 = stablehlo.dot_general %v103, %v104, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v106 = stablehlo.reshape %v105 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v107 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v108 = stablehlo.multiply %v106, %v107 : tensor<256x38809xf32>
    %v109 = stablehlo.reshape %v108 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v110 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v111 = stablehlo.reduce(%v109 init: %v110) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v112 = stablehlo.broadcast_in_dim %v111, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v113 = stablehlo.subtract %v109, %v112 : tensor<256x197x197xf32>
    %v114 = stablehlo.constant dense<0.0> : tensor<f32>
    %v115 = stablehlo.exponential %v113 : tensor<256x197x197xf32>
    %v116 = stablehlo.reduce(%v115 init: %v114) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v117 = stablehlo.broadcast_in_dim %v116, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v118 = stablehlo.divide %v115, %v117 : tensor<256x197x197xf32>
    %v119 = stablehlo.reshape %v118 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v120 = stablehlo.reshape %v119 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v121 = stablehlo.reshape %v99 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v122 = stablehlo.dot_general %v120, %v121, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v123 = stablehlo.reshape %v122 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v124 = stablehlo.reshape %v123 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v125 = stablehlo.constant dense<0.0> : tensor<f32>
    %v126 = stablehlo.pad %v124, %v125, low = [0, 0, 64], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v127 = stablehlo.reshape %v126 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v128 = stablehlo.add %v90, %v127 : tensor<256x75648xf32>
    %v129 = stablehlo.reshape %v43 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v130 = stablehlo.slice %v129 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v131 = stablehlo.reshape %v130 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v132 = stablehlo.reshape %v48 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v133 = stablehlo.slice %v132 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v134 = stablehlo.reshape %v133 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v135 = stablehlo.reshape %v53 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v136 = stablehlo.slice %v135 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v137 = stablehlo.reshape %v136 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v138 = stablehlo.reshape %v134 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v139 = stablehlo.transpose %v138, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v140 = stablehlo.reshape %v139 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v141 = stablehlo.reshape %v131 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v142 = stablehlo.reshape %v140 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v143 = stablehlo.dot_general %v141, %v142, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v144 = stablehlo.reshape %v143 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v145 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v146 = stablehlo.multiply %v144, %v145 : tensor<256x38809xf32>
    %v147 = stablehlo.reshape %v146 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v148 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v149 = stablehlo.reduce(%v147 init: %v148) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v150 = stablehlo.broadcast_in_dim %v149, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v151 = stablehlo.subtract %v147, %v150 : tensor<256x197x197xf32>
    %v152 = stablehlo.constant dense<0.0> : tensor<f32>
    %v153 = stablehlo.exponential %v151 : tensor<256x197x197xf32>
    %v154 = stablehlo.reduce(%v153 init: %v152) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v155 = stablehlo.broadcast_in_dim %v154, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v156 = stablehlo.divide %v153, %v155 : tensor<256x197x197xf32>
    %v157 = stablehlo.reshape %v156 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v158 = stablehlo.reshape %v157 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v159 = stablehlo.reshape %v137 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v160 = stablehlo.dot_general %v158, %v159, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v161 = stablehlo.reshape %v160 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v162 = stablehlo.reshape %v161 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v163 = stablehlo.constant dense<0.0> : tensor<f32>
    %v164 = stablehlo.pad %v162, %v163, low = [0, 0, 128], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v165 = stablehlo.reshape %v164 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v166 = stablehlo.add %v128, %v165 : tensor<256x75648xf32>
    %v167 = stablehlo.reshape %v43 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v168 = stablehlo.slice %v167 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v169 = stablehlo.reshape %v168 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v170 = stablehlo.reshape %v48 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v171 = stablehlo.slice %v170 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v172 = stablehlo.reshape %v171 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v173 = stablehlo.reshape %v53 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v174 = stablehlo.slice %v173 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v175 = stablehlo.reshape %v174 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v176 = stablehlo.reshape %v172 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v177 = stablehlo.transpose %v176, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v178 = stablehlo.reshape %v177 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v179 = stablehlo.reshape %v169 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v180 = stablehlo.reshape %v178 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v181 = stablehlo.dot_general %v179, %v180, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v182 = stablehlo.reshape %v181 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v183 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v184 = stablehlo.multiply %v182, %v183 : tensor<256x38809xf32>
    %v185 = stablehlo.reshape %v184 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v186 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v187 = stablehlo.reduce(%v185 init: %v186) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v188 = stablehlo.broadcast_in_dim %v187, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v189 = stablehlo.subtract %v185, %v188 : tensor<256x197x197xf32>
    %v190 = stablehlo.constant dense<0.0> : tensor<f32>
    %v191 = stablehlo.exponential %v189 : tensor<256x197x197xf32>
    %v192 = stablehlo.reduce(%v191 init: %v190) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v193 = stablehlo.broadcast_in_dim %v192, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v194 = stablehlo.divide %v191, %v193 : tensor<256x197x197xf32>
    %v195 = stablehlo.reshape %v194 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v196 = stablehlo.reshape %v195 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v197 = stablehlo.reshape %v175 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v198 = stablehlo.dot_general %v196, %v197, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v199 = stablehlo.reshape %v198 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v200 = stablehlo.reshape %v199 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v201 = stablehlo.constant dense<0.0> : tensor<f32>
    %v202 = stablehlo.pad %v200, %v201, low = [0, 0, 192], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v203 = stablehlo.reshape %v202 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v204 = stablehlo.add %v166, %v203 : tensor<256x75648xf32>
    %v205 = stablehlo.reshape %v43 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v206 = stablehlo.slice %v205 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v207 = stablehlo.reshape %v206 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v208 = stablehlo.reshape %v48 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v209 = stablehlo.slice %v208 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v210 = stablehlo.reshape %v209 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v211 = stablehlo.reshape %v53 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v212 = stablehlo.slice %v211 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v213 = stablehlo.reshape %v212 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v214 = stablehlo.reshape %v210 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v215 = stablehlo.transpose %v214, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v216 = stablehlo.reshape %v215 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v217 = stablehlo.reshape %v207 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v218 = stablehlo.reshape %v216 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v219 = stablehlo.dot_general %v217, %v218, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v220 = stablehlo.reshape %v219 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v221 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v222 = stablehlo.multiply %v220, %v221 : tensor<256x38809xf32>
    %v223 = stablehlo.reshape %v222 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v224 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v225 = stablehlo.reduce(%v223 init: %v224) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v226 = stablehlo.broadcast_in_dim %v225, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v227 = stablehlo.subtract %v223, %v226 : tensor<256x197x197xf32>
    %v228 = stablehlo.constant dense<0.0> : tensor<f32>
    %v229 = stablehlo.exponential %v227 : tensor<256x197x197xf32>
    %v230 = stablehlo.reduce(%v229 init: %v228) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v231 = stablehlo.broadcast_in_dim %v230, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v232 = stablehlo.divide %v229, %v231 : tensor<256x197x197xf32>
    %v233 = stablehlo.reshape %v232 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v234 = stablehlo.reshape %v233 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v235 = stablehlo.reshape %v213 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v236 = stablehlo.dot_general %v234, %v235, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v237 = stablehlo.reshape %v236 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v238 = stablehlo.reshape %v237 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v239 = stablehlo.constant dense<0.0> : tensor<f32>
    %v240 = stablehlo.pad %v238, %v239, low = [0, 0, 256], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v241 = stablehlo.reshape %v240 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v242 = stablehlo.add %v204, %v241 : tensor<256x75648xf32>
    %v243 = stablehlo.reshape %v43 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v244 = stablehlo.slice %v243 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v245 = stablehlo.reshape %v244 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v246 = stablehlo.reshape %v48 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v247 = stablehlo.slice %v246 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v248 = stablehlo.reshape %v247 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v249 = stablehlo.reshape %v53 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v250 = stablehlo.slice %v249 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v251 = stablehlo.reshape %v250 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v252 = stablehlo.reshape %v248 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v253 = stablehlo.transpose %v252, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v254 = stablehlo.reshape %v253 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v255 = stablehlo.reshape %v245 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v256 = stablehlo.reshape %v254 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v257 = stablehlo.dot_general %v255, %v256, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v258 = stablehlo.reshape %v257 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v259 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v260 = stablehlo.multiply %v258, %v259 : tensor<256x38809xf32>
    %v261 = stablehlo.reshape %v260 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v262 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v263 = stablehlo.reduce(%v261 init: %v262) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v264 = stablehlo.broadcast_in_dim %v263, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v265 = stablehlo.subtract %v261, %v264 : tensor<256x197x197xf32>
    %v266 = stablehlo.constant dense<0.0> : tensor<f32>
    %v267 = stablehlo.exponential %v265 : tensor<256x197x197xf32>
    %v268 = stablehlo.reduce(%v267 init: %v266) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v269 = stablehlo.broadcast_in_dim %v268, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v270 = stablehlo.divide %v267, %v269 : tensor<256x197x197xf32>
    %v271 = stablehlo.reshape %v270 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v272 = stablehlo.reshape %v271 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v273 = stablehlo.reshape %v251 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v274 = stablehlo.dot_general %v272, %v273, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v275 = stablehlo.reshape %v274 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v276 = stablehlo.reshape %v275 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v277 = stablehlo.constant dense<0.0> : tensor<f32>
    %v278 = stablehlo.pad %v276, %v277, low = [0, 0, 320], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v279 = stablehlo.reshape %v278 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v280 = stablehlo.add %v242, %v279 : tensor<256x75648xf32>
    %v281 = stablehlo.reshape %v280 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v282 = stablehlo.dot_general %v281, %b0_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v283 = stablehlo.broadcast_in_dim %b0_bo, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v284 = stablehlo.add %v282, %v283 : tensor<256x197x384xf32>
    %v285 = stablehlo.reshape %v284 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v286 = stablehlo.add %v10, %v285 : tensor<256x75648xf32>
    %v287 = stablehlo.reshape %v286 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v288 = stablehlo.constant dense<0.0> : tensor<f32>
    %v289 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v290 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v291 = stablehlo.reduce(%v287 init: %v288) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v292 = stablehlo.broadcast_in_dim %v291, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v293 = stablehlo.divide %v292, %v289 : tensor<256x197x384xf32>
    %v294 = stablehlo.subtract %v287, %v293 : tensor<256x197x384xf32>
    %v295 = stablehlo.multiply %v294, %v294 : tensor<256x197x384xf32>
    %v296 = stablehlo.reduce(%v295 init: %v288) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v297 = stablehlo.broadcast_in_dim %v296, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v298 = stablehlo.divide %v297, %v289 : tensor<256x197x384xf32>
    %v299 = stablehlo.add %v298, %v290 : tensor<256x197x384xf32>
    %v300 = stablehlo.rsqrt %v299 : tensor<256x197x384xf32>
    %v301 = stablehlo.multiply %v294, %v300 : tensor<256x197x384xf32>
    %v302 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v303 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v304 = stablehlo.multiply %v301, %v302 : tensor<256x197x384xf32>
    %v305 = stablehlo.add %v304, %v303 : tensor<256x197x384xf32>
    %v306 = stablehlo.reshape %v305 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v307 = stablehlo.reshape %v306 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v308 = stablehlo.broadcast_in_dim %b0_g2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v309 = stablehlo.multiply %v307, %v308 : tensor<256x197x384xf32>
    %v310 = stablehlo.reshape %v309 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v311 = stablehlo.reshape %v310 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v312 = stablehlo.broadcast_in_dim %b0_bt2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v313 = stablehlo.add %v311, %v312 : tensor<256x197x384xf32>
    %v314 = stablehlo.reshape %v313 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v315 = stablehlo.reshape %v314 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v316 = stablehlo.dot_general %v315, %b0_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x1536xf32>) -> tensor<256x197x1536xf32>
    %v317 = stablehlo.broadcast_in_dim %b0_bfc1, dims = [2] : (tensor<1536xf32>) -> tensor<256x197x1536xf32>
    %v318 = stablehlo.add %v316, %v317 : tensor<256x197x1536xf32>
    %v319 = stablehlo.reshape %v318 : (tensor<256x197x1536xf32>) -> tensor<256x302592xf32>
    %v320 = stablehlo.multiply %v319, %v319 : tensor<256x302592xf32>
    %v321 = stablehlo.multiply %v320, %v319 : tensor<256x302592xf32>
    %v322 = stablehlo.constant dense<0.044715> : tensor<256x302592xf32>
    %v323 = stablehlo.multiply %v322, %v321 : tensor<256x302592xf32>
    %v324 = stablehlo.add %v319, %v323 : tensor<256x302592xf32>
    %v325 = stablehlo.constant dense<0.7978845608028654> : tensor<256x302592xf32>
    %v326 = stablehlo.multiply %v325, %v324 : tensor<256x302592xf32>
    %v327 = stablehlo.tanh %v326 : tensor<256x302592xf32>
    %v328 = stablehlo.constant dense<1.0> : tensor<256x302592xf32>
    %v329 = stablehlo.add %v328, %v327 : tensor<256x302592xf32>
    %v330 = stablehlo.constant dense<0.5> : tensor<256x302592xf32>
    %v331 = stablehlo.multiply %v330, %v319 : tensor<256x302592xf32>
    %v332 = stablehlo.multiply %v331, %v329 : tensor<256x302592xf32>
    %v333 = stablehlo.reshape %v332 : (tensor<256x302592xf32>) -> tensor<256x197x1536xf32>
    %v334 = stablehlo.dot_general %v333, %b0_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x1536xf32>, tensor<1536x384xf32>) -> tensor<256x197x384xf32>
    %v335 = stablehlo.broadcast_in_dim %b0_bfc2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v336 = stablehlo.add %v334, %v335 : tensor<256x197x384xf32>
    %v337 = stablehlo.reshape %v336 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v338 = stablehlo.add %v286, %v337 : tensor<256x75648xf32>
    %v339 = stablehlo.reshape %v338 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v340 = stablehlo.constant dense<0.0> : tensor<f32>
    %v341 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v342 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v343 = stablehlo.reduce(%v339 init: %v340) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v344 = stablehlo.broadcast_in_dim %v343, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v345 = stablehlo.divide %v344, %v341 : tensor<256x197x384xf32>
    %v346 = stablehlo.subtract %v339, %v345 : tensor<256x197x384xf32>
    %v347 = stablehlo.multiply %v346, %v346 : tensor<256x197x384xf32>
    %v348 = stablehlo.reduce(%v347 init: %v340) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v349 = stablehlo.broadcast_in_dim %v348, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v350 = stablehlo.divide %v349, %v341 : tensor<256x197x384xf32>
    %v351 = stablehlo.add %v350, %v342 : tensor<256x197x384xf32>
    %v352 = stablehlo.rsqrt %v351 : tensor<256x197x384xf32>
    %v353 = stablehlo.multiply %v346, %v352 : tensor<256x197x384xf32>
    %v354 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v355 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v356 = stablehlo.multiply %v353, %v354 : tensor<256x197x384xf32>
    %v357 = stablehlo.add %v356, %v355 : tensor<256x197x384xf32>
    %v358 = stablehlo.reshape %v357 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v359 = stablehlo.reshape %v358 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v360 = stablehlo.broadcast_in_dim %b1_g1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v361 = stablehlo.multiply %v359, %v360 : tensor<256x197x384xf32>
    %v362 = stablehlo.reshape %v361 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v363 = stablehlo.reshape %v362 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v364 = stablehlo.broadcast_in_dim %b1_bt1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v365 = stablehlo.add %v363, %v364 : tensor<256x197x384xf32>
    %v366 = stablehlo.reshape %v365 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v367 = stablehlo.reshape %v366 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v368 = stablehlo.dot_general %v367, %b1_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v369 = stablehlo.broadcast_in_dim %b1_bq, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v370 = stablehlo.add %v368, %v369 : tensor<256x197x384xf32>
    %v371 = stablehlo.reshape %v370 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v372 = stablehlo.reshape %v366 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v373 = stablehlo.dot_general %v372, %b1_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v374 = stablehlo.broadcast_in_dim %b1_bk, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v375 = stablehlo.add %v373, %v374 : tensor<256x197x384xf32>
    %v376 = stablehlo.reshape %v375 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v377 = stablehlo.reshape %v366 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v378 = stablehlo.dot_general %v377, %b1_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v379 = stablehlo.broadcast_in_dim %b1_bv, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v380 = stablehlo.add %v378, %v379 : tensor<256x197x384xf32>
    %v381 = stablehlo.reshape %v380 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v382 = stablehlo.reshape %v371 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v383 = stablehlo.slice %v382 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v384 = stablehlo.reshape %v383 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v385 = stablehlo.reshape %v376 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v386 = stablehlo.slice %v385 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v387 = stablehlo.reshape %v386 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v388 = stablehlo.reshape %v381 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v389 = stablehlo.slice %v388 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v390 = stablehlo.reshape %v389 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v391 = stablehlo.reshape %v387 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v392 = stablehlo.transpose %v391, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v393 = stablehlo.reshape %v392 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v394 = stablehlo.reshape %v384 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v395 = stablehlo.reshape %v393 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v396 = stablehlo.dot_general %v394, %v395, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v397 = stablehlo.reshape %v396 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v398 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v399 = stablehlo.multiply %v397, %v398 : tensor<256x38809xf32>
    %v400 = stablehlo.reshape %v399 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v401 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v402 = stablehlo.reduce(%v400 init: %v401) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v403 = stablehlo.broadcast_in_dim %v402, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v404 = stablehlo.subtract %v400, %v403 : tensor<256x197x197xf32>
    %v405 = stablehlo.constant dense<0.0> : tensor<f32>
    %v406 = stablehlo.exponential %v404 : tensor<256x197x197xf32>
    %v407 = stablehlo.reduce(%v406 init: %v405) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v408 = stablehlo.broadcast_in_dim %v407, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v409 = stablehlo.divide %v406, %v408 : tensor<256x197x197xf32>
    %v410 = stablehlo.reshape %v409 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v411 = stablehlo.reshape %v410 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v412 = stablehlo.reshape %v390 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v413 = stablehlo.dot_general %v411, %v412, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v414 = stablehlo.reshape %v413 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v415 = stablehlo.reshape %v414 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v416 = stablehlo.constant dense<0.0> : tensor<f32>
    %v417 = stablehlo.pad %v415, %v416, low = [0, 0, 0], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v418 = stablehlo.reshape %v417 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v419 = stablehlo.reshape %v371 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v420 = stablehlo.slice %v419 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v421 = stablehlo.reshape %v420 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v422 = stablehlo.reshape %v376 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v423 = stablehlo.slice %v422 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v424 = stablehlo.reshape %v423 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v425 = stablehlo.reshape %v381 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v426 = stablehlo.slice %v425 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v427 = stablehlo.reshape %v426 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v428 = stablehlo.reshape %v424 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v429 = stablehlo.transpose %v428, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v430 = stablehlo.reshape %v429 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v431 = stablehlo.reshape %v421 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v432 = stablehlo.reshape %v430 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v433 = stablehlo.dot_general %v431, %v432, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v434 = stablehlo.reshape %v433 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v435 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v436 = stablehlo.multiply %v434, %v435 : tensor<256x38809xf32>
    %v437 = stablehlo.reshape %v436 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v438 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v439 = stablehlo.reduce(%v437 init: %v438) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v440 = stablehlo.broadcast_in_dim %v439, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v441 = stablehlo.subtract %v437, %v440 : tensor<256x197x197xf32>
    %v442 = stablehlo.constant dense<0.0> : tensor<f32>
    %v443 = stablehlo.exponential %v441 : tensor<256x197x197xf32>
    %v444 = stablehlo.reduce(%v443 init: %v442) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v445 = stablehlo.broadcast_in_dim %v444, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v446 = stablehlo.divide %v443, %v445 : tensor<256x197x197xf32>
    %v447 = stablehlo.reshape %v446 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v448 = stablehlo.reshape %v447 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v449 = stablehlo.reshape %v427 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v450 = stablehlo.dot_general %v448, %v449, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v451 = stablehlo.reshape %v450 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v452 = stablehlo.reshape %v451 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v453 = stablehlo.constant dense<0.0> : tensor<f32>
    %v454 = stablehlo.pad %v452, %v453, low = [0, 0, 64], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v455 = stablehlo.reshape %v454 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v456 = stablehlo.add %v418, %v455 : tensor<256x75648xf32>
    %v457 = stablehlo.reshape %v371 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v458 = stablehlo.slice %v457 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v459 = stablehlo.reshape %v458 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v460 = stablehlo.reshape %v376 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v461 = stablehlo.slice %v460 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v462 = stablehlo.reshape %v461 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v463 = stablehlo.reshape %v381 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v464 = stablehlo.slice %v463 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v465 = stablehlo.reshape %v464 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v466 = stablehlo.reshape %v462 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v467 = stablehlo.transpose %v466, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v468 = stablehlo.reshape %v467 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v469 = stablehlo.reshape %v459 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v470 = stablehlo.reshape %v468 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v471 = stablehlo.dot_general %v469, %v470, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v472 = stablehlo.reshape %v471 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v473 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v474 = stablehlo.multiply %v472, %v473 : tensor<256x38809xf32>
    %v475 = stablehlo.reshape %v474 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v476 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v477 = stablehlo.reduce(%v475 init: %v476) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v478 = stablehlo.broadcast_in_dim %v477, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v479 = stablehlo.subtract %v475, %v478 : tensor<256x197x197xf32>
    %v480 = stablehlo.constant dense<0.0> : tensor<f32>
    %v481 = stablehlo.exponential %v479 : tensor<256x197x197xf32>
    %v482 = stablehlo.reduce(%v481 init: %v480) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v483 = stablehlo.broadcast_in_dim %v482, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v484 = stablehlo.divide %v481, %v483 : tensor<256x197x197xf32>
    %v485 = stablehlo.reshape %v484 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v486 = stablehlo.reshape %v485 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v487 = stablehlo.reshape %v465 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v488 = stablehlo.dot_general %v486, %v487, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v489 = stablehlo.reshape %v488 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v490 = stablehlo.reshape %v489 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v491 = stablehlo.constant dense<0.0> : tensor<f32>
    %v492 = stablehlo.pad %v490, %v491, low = [0, 0, 128], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v493 = stablehlo.reshape %v492 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v494 = stablehlo.add %v456, %v493 : tensor<256x75648xf32>
    %v495 = stablehlo.reshape %v371 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v496 = stablehlo.slice %v495 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v497 = stablehlo.reshape %v496 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v498 = stablehlo.reshape %v376 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v499 = stablehlo.slice %v498 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v500 = stablehlo.reshape %v499 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v501 = stablehlo.reshape %v381 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v502 = stablehlo.slice %v501 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v503 = stablehlo.reshape %v502 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v504 = stablehlo.reshape %v500 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v505 = stablehlo.transpose %v504, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v506 = stablehlo.reshape %v505 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v507 = stablehlo.reshape %v497 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v508 = stablehlo.reshape %v506 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v509 = stablehlo.dot_general %v507, %v508, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v510 = stablehlo.reshape %v509 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v511 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v512 = stablehlo.multiply %v510, %v511 : tensor<256x38809xf32>
    %v513 = stablehlo.reshape %v512 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v514 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v515 = stablehlo.reduce(%v513 init: %v514) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v516 = stablehlo.broadcast_in_dim %v515, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v517 = stablehlo.subtract %v513, %v516 : tensor<256x197x197xf32>
    %v518 = stablehlo.constant dense<0.0> : tensor<f32>
    %v519 = stablehlo.exponential %v517 : tensor<256x197x197xf32>
    %v520 = stablehlo.reduce(%v519 init: %v518) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v521 = stablehlo.broadcast_in_dim %v520, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v522 = stablehlo.divide %v519, %v521 : tensor<256x197x197xf32>
    %v523 = stablehlo.reshape %v522 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v524 = stablehlo.reshape %v523 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v525 = stablehlo.reshape %v503 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v526 = stablehlo.dot_general %v524, %v525, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v527 = stablehlo.reshape %v526 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v528 = stablehlo.reshape %v527 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v529 = stablehlo.constant dense<0.0> : tensor<f32>
    %v530 = stablehlo.pad %v528, %v529, low = [0, 0, 192], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v531 = stablehlo.reshape %v530 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v532 = stablehlo.add %v494, %v531 : tensor<256x75648xf32>
    %v533 = stablehlo.reshape %v371 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v534 = stablehlo.slice %v533 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v535 = stablehlo.reshape %v534 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v536 = stablehlo.reshape %v376 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v537 = stablehlo.slice %v536 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v538 = stablehlo.reshape %v537 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v539 = stablehlo.reshape %v381 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v540 = stablehlo.slice %v539 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v541 = stablehlo.reshape %v540 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v542 = stablehlo.reshape %v538 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v543 = stablehlo.transpose %v542, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v544 = stablehlo.reshape %v543 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v545 = stablehlo.reshape %v535 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v546 = stablehlo.reshape %v544 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v547 = stablehlo.dot_general %v545, %v546, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v548 = stablehlo.reshape %v547 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v549 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v550 = stablehlo.multiply %v548, %v549 : tensor<256x38809xf32>
    %v551 = stablehlo.reshape %v550 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v552 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v553 = stablehlo.reduce(%v551 init: %v552) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v554 = stablehlo.broadcast_in_dim %v553, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v555 = stablehlo.subtract %v551, %v554 : tensor<256x197x197xf32>
    %v556 = stablehlo.constant dense<0.0> : tensor<f32>
    %v557 = stablehlo.exponential %v555 : tensor<256x197x197xf32>
    %v558 = stablehlo.reduce(%v557 init: %v556) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v559 = stablehlo.broadcast_in_dim %v558, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v560 = stablehlo.divide %v557, %v559 : tensor<256x197x197xf32>
    %v561 = stablehlo.reshape %v560 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v562 = stablehlo.reshape %v561 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v563 = stablehlo.reshape %v541 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v564 = stablehlo.dot_general %v562, %v563, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v565 = stablehlo.reshape %v564 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v566 = stablehlo.reshape %v565 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v567 = stablehlo.constant dense<0.0> : tensor<f32>
    %v568 = stablehlo.pad %v566, %v567, low = [0, 0, 256], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v569 = stablehlo.reshape %v568 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v570 = stablehlo.add %v532, %v569 : tensor<256x75648xf32>
    %v571 = stablehlo.reshape %v371 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v572 = stablehlo.slice %v571 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v573 = stablehlo.reshape %v572 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v574 = stablehlo.reshape %v376 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v575 = stablehlo.slice %v574 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v576 = stablehlo.reshape %v575 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v577 = stablehlo.reshape %v381 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v578 = stablehlo.slice %v577 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v579 = stablehlo.reshape %v578 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v580 = stablehlo.reshape %v576 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v581 = stablehlo.transpose %v580, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v582 = stablehlo.reshape %v581 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v583 = stablehlo.reshape %v573 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v584 = stablehlo.reshape %v582 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v585 = stablehlo.dot_general %v583, %v584, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v586 = stablehlo.reshape %v585 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v587 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v588 = stablehlo.multiply %v586, %v587 : tensor<256x38809xf32>
    %v589 = stablehlo.reshape %v588 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v590 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v591 = stablehlo.reduce(%v589 init: %v590) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v592 = stablehlo.broadcast_in_dim %v591, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v593 = stablehlo.subtract %v589, %v592 : tensor<256x197x197xf32>
    %v594 = stablehlo.constant dense<0.0> : tensor<f32>
    %v595 = stablehlo.exponential %v593 : tensor<256x197x197xf32>
    %v596 = stablehlo.reduce(%v595 init: %v594) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v597 = stablehlo.broadcast_in_dim %v596, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v598 = stablehlo.divide %v595, %v597 : tensor<256x197x197xf32>
    %v599 = stablehlo.reshape %v598 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v600 = stablehlo.reshape %v599 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v601 = stablehlo.reshape %v579 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v602 = stablehlo.dot_general %v600, %v601, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v603 = stablehlo.reshape %v602 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v604 = stablehlo.reshape %v603 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v605 = stablehlo.constant dense<0.0> : tensor<f32>
    %v606 = stablehlo.pad %v604, %v605, low = [0, 0, 320], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v607 = stablehlo.reshape %v606 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v608 = stablehlo.add %v570, %v607 : tensor<256x75648xf32>
    %v609 = stablehlo.reshape %v608 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v610 = stablehlo.dot_general %v609, %b1_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v611 = stablehlo.broadcast_in_dim %b1_bo, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v612 = stablehlo.add %v610, %v611 : tensor<256x197x384xf32>
    %v613 = stablehlo.reshape %v612 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v614 = stablehlo.add %v338, %v613 : tensor<256x75648xf32>
    %v615 = stablehlo.reshape %v614 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v616 = stablehlo.constant dense<0.0> : tensor<f32>
    %v617 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v618 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v619 = stablehlo.reduce(%v615 init: %v616) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v620 = stablehlo.broadcast_in_dim %v619, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v621 = stablehlo.divide %v620, %v617 : tensor<256x197x384xf32>
    %v622 = stablehlo.subtract %v615, %v621 : tensor<256x197x384xf32>
    %v623 = stablehlo.multiply %v622, %v622 : tensor<256x197x384xf32>
    %v624 = stablehlo.reduce(%v623 init: %v616) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v625 = stablehlo.broadcast_in_dim %v624, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v626 = stablehlo.divide %v625, %v617 : tensor<256x197x384xf32>
    %v627 = stablehlo.add %v626, %v618 : tensor<256x197x384xf32>
    %v628 = stablehlo.rsqrt %v627 : tensor<256x197x384xf32>
    %v629 = stablehlo.multiply %v622, %v628 : tensor<256x197x384xf32>
    %v630 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v631 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v632 = stablehlo.multiply %v629, %v630 : tensor<256x197x384xf32>
    %v633 = stablehlo.add %v632, %v631 : tensor<256x197x384xf32>
    %v634 = stablehlo.reshape %v633 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v635 = stablehlo.reshape %v634 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v636 = stablehlo.broadcast_in_dim %b1_g2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v637 = stablehlo.multiply %v635, %v636 : tensor<256x197x384xf32>
    %v638 = stablehlo.reshape %v637 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v639 = stablehlo.reshape %v638 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v640 = stablehlo.broadcast_in_dim %b1_bt2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v641 = stablehlo.add %v639, %v640 : tensor<256x197x384xf32>
    %v642 = stablehlo.reshape %v641 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v643 = stablehlo.reshape %v642 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v644 = stablehlo.dot_general %v643, %b1_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x1536xf32>) -> tensor<256x197x1536xf32>
    %v645 = stablehlo.broadcast_in_dim %b1_bfc1, dims = [2] : (tensor<1536xf32>) -> tensor<256x197x1536xf32>
    %v646 = stablehlo.add %v644, %v645 : tensor<256x197x1536xf32>
    %v647 = stablehlo.reshape %v646 : (tensor<256x197x1536xf32>) -> tensor<256x302592xf32>
    %v648 = stablehlo.multiply %v647, %v647 : tensor<256x302592xf32>
    %v649 = stablehlo.multiply %v648, %v647 : tensor<256x302592xf32>
    %v650 = stablehlo.constant dense<0.044715> : tensor<256x302592xf32>
    %v651 = stablehlo.multiply %v650, %v649 : tensor<256x302592xf32>
    %v652 = stablehlo.add %v647, %v651 : tensor<256x302592xf32>
    %v653 = stablehlo.constant dense<0.7978845608028654> : tensor<256x302592xf32>
    %v654 = stablehlo.multiply %v653, %v652 : tensor<256x302592xf32>
    %v655 = stablehlo.tanh %v654 : tensor<256x302592xf32>
    %v656 = stablehlo.constant dense<1.0> : tensor<256x302592xf32>
    %v657 = stablehlo.add %v656, %v655 : tensor<256x302592xf32>
    %v658 = stablehlo.constant dense<0.5> : tensor<256x302592xf32>
    %v659 = stablehlo.multiply %v658, %v647 : tensor<256x302592xf32>
    %v660 = stablehlo.multiply %v659, %v657 : tensor<256x302592xf32>
    %v661 = stablehlo.reshape %v660 : (tensor<256x302592xf32>) -> tensor<256x197x1536xf32>
    %v662 = stablehlo.dot_general %v661, %b1_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x1536xf32>, tensor<1536x384xf32>) -> tensor<256x197x384xf32>
    %v663 = stablehlo.broadcast_in_dim %b1_bfc2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v664 = stablehlo.add %v662, %v663 : tensor<256x197x384xf32>
    %v665 = stablehlo.reshape %v664 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v666 = stablehlo.add %v614, %v665 : tensor<256x75648xf32>
    %v667 = stablehlo.reshape %v666 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v668 = stablehlo.constant dense<0.0> : tensor<f32>
    %v669 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v670 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v671 = stablehlo.reduce(%v667 init: %v668) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v672 = stablehlo.broadcast_in_dim %v671, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v673 = stablehlo.divide %v672, %v669 : tensor<256x197x384xf32>
    %v674 = stablehlo.subtract %v667, %v673 : tensor<256x197x384xf32>
    %v675 = stablehlo.multiply %v674, %v674 : tensor<256x197x384xf32>
    %v676 = stablehlo.reduce(%v675 init: %v668) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v677 = stablehlo.broadcast_in_dim %v676, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v678 = stablehlo.divide %v677, %v669 : tensor<256x197x384xf32>
    %v679 = stablehlo.add %v678, %v670 : tensor<256x197x384xf32>
    %v680 = stablehlo.rsqrt %v679 : tensor<256x197x384xf32>
    %v681 = stablehlo.multiply %v674, %v680 : tensor<256x197x384xf32>
    %v682 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v683 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v684 = stablehlo.multiply %v681, %v682 : tensor<256x197x384xf32>
    %v685 = stablehlo.add %v684, %v683 : tensor<256x197x384xf32>
    %v686 = stablehlo.reshape %v685 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v687 = stablehlo.reshape %v686 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v688 = stablehlo.broadcast_in_dim %b2_g1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v689 = stablehlo.multiply %v687, %v688 : tensor<256x197x384xf32>
    %v690 = stablehlo.reshape %v689 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v691 = stablehlo.reshape %v690 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v692 = stablehlo.broadcast_in_dim %b2_bt1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v693 = stablehlo.add %v691, %v692 : tensor<256x197x384xf32>
    %v694 = stablehlo.reshape %v693 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v695 = stablehlo.reshape %v694 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v696 = stablehlo.dot_general %v695, %b2_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v697 = stablehlo.broadcast_in_dim %b2_bq, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v698 = stablehlo.add %v696, %v697 : tensor<256x197x384xf32>
    %v699 = stablehlo.reshape %v698 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v700 = stablehlo.reshape %v694 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v701 = stablehlo.dot_general %v700, %b2_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v702 = stablehlo.broadcast_in_dim %b2_bk, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v703 = stablehlo.add %v701, %v702 : tensor<256x197x384xf32>
    %v704 = stablehlo.reshape %v703 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v705 = stablehlo.reshape %v694 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v706 = stablehlo.dot_general %v705, %b2_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v707 = stablehlo.broadcast_in_dim %b2_bv, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v708 = stablehlo.add %v706, %v707 : tensor<256x197x384xf32>
    %v709 = stablehlo.reshape %v708 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v710 = stablehlo.reshape %v699 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v711 = stablehlo.slice %v710 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v712 = stablehlo.reshape %v711 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v713 = stablehlo.reshape %v704 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v714 = stablehlo.slice %v713 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v715 = stablehlo.reshape %v714 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v716 = stablehlo.reshape %v709 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v717 = stablehlo.slice %v716 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v718 = stablehlo.reshape %v717 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v719 = stablehlo.reshape %v715 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v720 = stablehlo.transpose %v719, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v721 = stablehlo.reshape %v720 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v722 = stablehlo.reshape %v712 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v723 = stablehlo.reshape %v721 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v724 = stablehlo.dot_general %v722, %v723, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v725 = stablehlo.reshape %v724 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v726 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v727 = stablehlo.multiply %v725, %v726 : tensor<256x38809xf32>
    %v728 = stablehlo.reshape %v727 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v729 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v730 = stablehlo.reduce(%v728 init: %v729) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v731 = stablehlo.broadcast_in_dim %v730, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v732 = stablehlo.subtract %v728, %v731 : tensor<256x197x197xf32>
    %v733 = stablehlo.constant dense<0.0> : tensor<f32>
    %v734 = stablehlo.exponential %v732 : tensor<256x197x197xf32>
    %v735 = stablehlo.reduce(%v734 init: %v733) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v736 = stablehlo.broadcast_in_dim %v735, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v737 = stablehlo.divide %v734, %v736 : tensor<256x197x197xf32>
    %v738 = stablehlo.reshape %v737 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v739 = stablehlo.reshape %v738 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v740 = stablehlo.reshape %v718 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v741 = stablehlo.dot_general %v739, %v740, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v742 = stablehlo.reshape %v741 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v743 = stablehlo.reshape %v742 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v744 = stablehlo.constant dense<0.0> : tensor<f32>
    %v745 = stablehlo.pad %v743, %v744, low = [0, 0, 0], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v746 = stablehlo.reshape %v745 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v747 = stablehlo.reshape %v699 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v748 = stablehlo.slice %v747 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v749 = stablehlo.reshape %v748 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v750 = stablehlo.reshape %v704 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v751 = stablehlo.slice %v750 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v752 = stablehlo.reshape %v751 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v753 = stablehlo.reshape %v709 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v754 = stablehlo.slice %v753 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v755 = stablehlo.reshape %v754 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v756 = stablehlo.reshape %v752 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v757 = stablehlo.transpose %v756, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v758 = stablehlo.reshape %v757 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v759 = stablehlo.reshape %v749 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v760 = stablehlo.reshape %v758 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v761 = stablehlo.dot_general %v759, %v760, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v762 = stablehlo.reshape %v761 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v763 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v764 = stablehlo.multiply %v762, %v763 : tensor<256x38809xf32>
    %v765 = stablehlo.reshape %v764 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v766 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v767 = stablehlo.reduce(%v765 init: %v766) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v768 = stablehlo.broadcast_in_dim %v767, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v769 = stablehlo.subtract %v765, %v768 : tensor<256x197x197xf32>
    %v770 = stablehlo.constant dense<0.0> : tensor<f32>
    %v771 = stablehlo.exponential %v769 : tensor<256x197x197xf32>
    %v772 = stablehlo.reduce(%v771 init: %v770) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v773 = stablehlo.broadcast_in_dim %v772, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v774 = stablehlo.divide %v771, %v773 : tensor<256x197x197xf32>
    %v775 = stablehlo.reshape %v774 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v776 = stablehlo.reshape %v775 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v777 = stablehlo.reshape %v755 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v778 = stablehlo.dot_general %v776, %v777, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v779 = stablehlo.reshape %v778 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v780 = stablehlo.reshape %v779 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v781 = stablehlo.constant dense<0.0> : tensor<f32>
    %v782 = stablehlo.pad %v780, %v781, low = [0, 0, 64], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v783 = stablehlo.reshape %v782 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v784 = stablehlo.add %v746, %v783 : tensor<256x75648xf32>
    %v785 = stablehlo.reshape %v699 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v786 = stablehlo.slice %v785 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v787 = stablehlo.reshape %v786 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v788 = stablehlo.reshape %v704 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v789 = stablehlo.slice %v788 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v790 = stablehlo.reshape %v789 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v791 = stablehlo.reshape %v709 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v792 = stablehlo.slice %v791 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v793 = stablehlo.reshape %v792 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v794 = stablehlo.reshape %v790 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v795 = stablehlo.transpose %v794, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v796 = stablehlo.reshape %v795 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v797 = stablehlo.reshape %v787 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v798 = stablehlo.reshape %v796 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v799 = stablehlo.dot_general %v797, %v798, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v800 = stablehlo.reshape %v799 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v801 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v802 = stablehlo.multiply %v800, %v801 : tensor<256x38809xf32>
    %v803 = stablehlo.reshape %v802 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v804 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v805 = stablehlo.reduce(%v803 init: %v804) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v806 = stablehlo.broadcast_in_dim %v805, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v807 = stablehlo.subtract %v803, %v806 : tensor<256x197x197xf32>
    %v808 = stablehlo.constant dense<0.0> : tensor<f32>
    %v809 = stablehlo.exponential %v807 : tensor<256x197x197xf32>
    %v810 = stablehlo.reduce(%v809 init: %v808) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v811 = stablehlo.broadcast_in_dim %v810, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v812 = stablehlo.divide %v809, %v811 : tensor<256x197x197xf32>
    %v813 = stablehlo.reshape %v812 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v814 = stablehlo.reshape %v813 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v815 = stablehlo.reshape %v793 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v816 = stablehlo.dot_general %v814, %v815, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v817 = stablehlo.reshape %v816 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v818 = stablehlo.reshape %v817 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v819 = stablehlo.constant dense<0.0> : tensor<f32>
    %v820 = stablehlo.pad %v818, %v819, low = [0, 0, 128], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v821 = stablehlo.reshape %v820 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v822 = stablehlo.add %v784, %v821 : tensor<256x75648xf32>
    %v823 = stablehlo.reshape %v699 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v824 = stablehlo.slice %v823 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v825 = stablehlo.reshape %v824 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v826 = stablehlo.reshape %v704 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v827 = stablehlo.slice %v826 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v828 = stablehlo.reshape %v827 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v829 = stablehlo.reshape %v709 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v830 = stablehlo.slice %v829 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v831 = stablehlo.reshape %v830 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v832 = stablehlo.reshape %v828 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v833 = stablehlo.transpose %v832, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v834 = stablehlo.reshape %v833 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v835 = stablehlo.reshape %v825 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v836 = stablehlo.reshape %v834 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v837 = stablehlo.dot_general %v835, %v836, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v838 = stablehlo.reshape %v837 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v839 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v840 = stablehlo.multiply %v838, %v839 : tensor<256x38809xf32>
    %v841 = stablehlo.reshape %v840 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v842 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v843 = stablehlo.reduce(%v841 init: %v842) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v844 = stablehlo.broadcast_in_dim %v843, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v845 = stablehlo.subtract %v841, %v844 : tensor<256x197x197xf32>
    %v846 = stablehlo.constant dense<0.0> : tensor<f32>
    %v847 = stablehlo.exponential %v845 : tensor<256x197x197xf32>
    %v848 = stablehlo.reduce(%v847 init: %v846) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v849 = stablehlo.broadcast_in_dim %v848, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v850 = stablehlo.divide %v847, %v849 : tensor<256x197x197xf32>
    %v851 = stablehlo.reshape %v850 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v852 = stablehlo.reshape %v851 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v853 = stablehlo.reshape %v831 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v854 = stablehlo.dot_general %v852, %v853, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v855 = stablehlo.reshape %v854 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v856 = stablehlo.reshape %v855 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v857 = stablehlo.constant dense<0.0> : tensor<f32>
    %v858 = stablehlo.pad %v856, %v857, low = [0, 0, 192], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v859 = stablehlo.reshape %v858 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v860 = stablehlo.add %v822, %v859 : tensor<256x75648xf32>
    %v861 = stablehlo.reshape %v699 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v862 = stablehlo.slice %v861 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v863 = stablehlo.reshape %v862 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v864 = stablehlo.reshape %v704 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v865 = stablehlo.slice %v864 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v866 = stablehlo.reshape %v865 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v867 = stablehlo.reshape %v709 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v868 = stablehlo.slice %v867 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v869 = stablehlo.reshape %v868 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v870 = stablehlo.reshape %v866 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v871 = stablehlo.transpose %v870, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v872 = stablehlo.reshape %v871 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v873 = stablehlo.reshape %v863 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v874 = stablehlo.reshape %v872 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v875 = stablehlo.dot_general %v873, %v874, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v876 = stablehlo.reshape %v875 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v877 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v878 = stablehlo.multiply %v876, %v877 : tensor<256x38809xf32>
    %v879 = stablehlo.reshape %v878 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v880 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v881 = stablehlo.reduce(%v879 init: %v880) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v882 = stablehlo.broadcast_in_dim %v881, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v883 = stablehlo.subtract %v879, %v882 : tensor<256x197x197xf32>
    %v884 = stablehlo.constant dense<0.0> : tensor<f32>
    %v885 = stablehlo.exponential %v883 : tensor<256x197x197xf32>
    %v886 = stablehlo.reduce(%v885 init: %v884) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v887 = stablehlo.broadcast_in_dim %v886, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v888 = stablehlo.divide %v885, %v887 : tensor<256x197x197xf32>
    %v889 = stablehlo.reshape %v888 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v890 = stablehlo.reshape %v889 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v891 = stablehlo.reshape %v869 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v892 = stablehlo.dot_general %v890, %v891, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v893 = stablehlo.reshape %v892 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v894 = stablehlo.reshape %v893 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v895 = stablehlo.constant dense<0.0> : tensor<f32>
    %v896 = stablehlo.pad %v894, %v895, low = [0, 0, 256], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v897 = stablehlo.reshape %v896 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v898 = stablehlo.add %v860, %v897 : tensor<256x75648xf32>
    %v899 = stablehlo.reshape %v699 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v900 = stablehlo.slice %v899 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v901 = stablehlo.reshape %v900 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v902 = stablehlo.reshape %v704 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v903 = stablehlo.slice %v902 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v904 = stablehlo.reshape %v903 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v905 = stablehlo.reshape %v709 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v906 = stablehlo.slice %v905 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v907 = stablehlo.reshape %v906 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v908 = stablehlo.reshape %v904 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v909 = stablehlo.transpose %v908, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v910 = stablehlo.reshape %v909 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v911 = stablehlo.reshape %v901 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v912 = stablehlo.reshape %v910 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v913 = stablehlo.dot_general %v911, %v912, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v914 = stablehlo.reshape %v913 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v915 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v916 = stablehlo.multiply %v914, %v915 : tensor<256x38809xf32>
    %v917 = stablehlo.reshape %v916 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v918 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v919 = stablehlo.reduce(%v917 init: %v918) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v920 = stablehlo.broadcast_in_dim %v919, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v921 = stablehlo.subtract %v917, %v920 : tensor<256x197x197xf32>
    %v922 = stablehlo.constant dense<0.0> : tensor<f32>
    %v923 = stablehlo.exponential %v921 : tensor<256x197x197xf32>
    %v924 = stablehlo.reduce(%v923 init: %v922) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v925 = stablehlo.broadcast_in_dim %v924, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v926 = stablehlo.divide %v923, %v925 : tensor<256x197x197xf32>
    %v927 = stablehlo.reshape %v926 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v928 = stablehlo.reshape %v927 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v929 = stablehlo.reshape %v907 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v930 = stablehlo.dot_general %v928, %v929, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v931 = stablehlo.reshape %v930 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v932 = stablehlo.reshape %v931 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v933 = stablehlo.constant dense<0.0> : tensor<f32>
    %v934 = stablehlo.pad %v932, %v933, low = [0, 0, 320], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v935 = stablehlo.reshape %v934 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v936 = stablehlo.add %v898, %v935 : tensor<256x75648xf32>
    %v937 = stablehlo.reshape %v936 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v938 = stablehlo.dot_general %v937, %b2_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v939 = stablehlo.broadcast_in_dim %b2_bo, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v940 = stablehlo.add %v938, %v939 : tensor<256x197x384xf32>
    %v941 = stablehlo.reshape %v940 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v942 = stablehlo.add %v666, %v941 : tensor<256x75648xf32>
    %v943 = stablehlo.reshape %v942 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v944 = stablehlo.constant dense<0.0> : tensor<f32>
    %v945 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v946 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v947 = stablehlo.reduce(%v943 init: %v944) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v948 = stablehlo.broadcast_in_dim %v947, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v949 = stablehlo.divide %v948, %v945 : tensor<256x197x384xf32>
    %v950 = stablehlo.subtract %v943, %v949 : tensor<256x197x384xf32>
    %v951 = stablehlo.multiply %v950, %v950 : tensor<256x197x384xf32>
    %v952 = stablehlo.reduce(%v951 init: %v944) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v953 = stablehlo.broadcast_in_dim %v952, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v954 = stablehlo.divide %v953, %v945 : tensor<256x197x384xf32>
    %v955 = stablehlo.add %v954, %v946 : tensor<256x197x384xf32>
    %v956 = stablehlo.rsqrt %v955 : tensor<256x197x384xf32>
    %v957 = stablehlo.multiply %v950, %v956 : tensor<256x197x384xf32>
    %v958 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v959 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v960 = stablehlo.multiply %v957, %v958 : tensor<256x197x384xf32>
    %v961 = stablehlo.add %v960, %v959 : tensor<256x197x384xf32>
    %v962 = stablehlo.reshape %v961 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v963 = stablehlo.reshape %v962 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v964 = stablehlo.broadcast_in_dim %b2_g2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v965 = stablehlo.multiply %v963, %v964 : tensor<256x197x384xf32>
    %v966 = stablehlo.reshape %v965 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v967 = stablehlo.reshape %v966 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v968 = stablehlo.broadcast_in_dim %b2_bt2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v969 = stablehlo.add %v967, %v968 : tensor<256x197x384xf32>
    %v970 = stablehlo.reshape %v969 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v971 = stablehlo.reshape %v970 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v972 = stablehlo.dot_general %v971, %b2_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x1536xf32>) -> tensor<256x197x1536xf32>
    %v973 = stablehlo.broadcast_in_dim %b2_bfc1, dims = [2] : (tensor<1536xf32>) -> tensor<256x197x1536xf32>
    %v974 = stablehlo.add %v972, %v973 : tensor<256x197x1536xf32>
    %v975 = stablehlo.reshape %v974 : (tensor<256x197x1536xf32>) -> tensor<256x302592xf32>
    %v976 = stablehlo.multiply %v975, %v975 : tensor<256x302592xf32>
    %v977 = stablehlo.multiply %v976, %v975 : tensor<256x302592xf32>
    %v978 = stablehlo.constant dense<0.044715> : tensor<256x302592xf32>
    %v979 = stablehlo.multiply %v978, %v977 : tensor<256x302592xf32>
    %v980 = stablehlo.add %v975, %v979 : tensor<256x302592xf32>
    %v981 = stablehlo.constant dense<0.7978845608028654> : tensor<256x302592xf32>
    %v982 = stablehlo.multiply %v981, %v980 : tensor<256x302592xf32>
    %v983 = stablehlo.tanh %v982 : tensor<256x302592xf32>
    %v984 = stablehlo.constant dense<1.0> : tensor<256x302592xf32>
    %v985 = stablehlo.add %v984, %v983 : tensor<256x302592xf32>
    %v986 = stablehlo.constant dense<0.5> : tensor<256x302592xf32>
    %v987 = stablehlo.multiply %v986, %v975 : tensor<256x302592xf32>
    %v988 = stablehlo.multiply %v987, %v985 : tensor<256x302592xf32>
    %v989 = stablehlo.reshape %v988 : (tensor<256x302592xf32>) -> tensor<256x197x1536xf32>
    %v990 = stablehlo.dot_general %v989, %b2_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x1536xf32>, tensor<1536x384xf32>) -> tensor<256x197x384xf32>
    %v991 = stablehlo.broadcast_in_dim %b2_bfc2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v992 = stablehlo.add %v990, %v991 : tensor<256x197x384xf32>
    %v993 = stablehlo.reshape %v992 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v994 = stablehlo.add %v942, %v993 : tensor<256x75648xf32>
    %v995 = stablehlo.reshape %v994 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v996 = stablehlo.constant dense<0.0> : tensor<f32>
    %v997 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v998 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v999 = stablehlo.reduce(%v995 init: %v996) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1000 = stablehlo.broadcast_in_dim %v999, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1001 = stablehlo.divide %v1000, %v997 : tensor<256x197x384xf32>
    %v1002 = stablehlo.subtract %v995, %v1001 : tensor<256x197x384xf32>
    %v1003 = stablehlo.multiply %v1002, %v1002 : tensor<256x197x384xf32>
    %v1004 = stablehlo.reduce(%v1003 init: %v996) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1005 = stablehlo.broadcast_in_dim %v1004, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1006 = stablehlo.divide %v1005, %v997 : tensor<256x197x384xf32>
    %v1007 = stablehlo.add %v1006, %v998 : tensor<256x197x384xf32>
    %v1008 = stablehlo.rsqrt %v1007 : tensor<256x197x384xf32>
    %v1009 = stablehlo.multiply %v1002, %v1008 : tensor<256x197x384xf32>
    %v1010 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1011 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1012 = stablehlo.multiply %v1009, %v1010 : tensor<256x197x384xf32>
    %v1013 = stablehlo.add %v1012, %v1011 : tensor<256x197x384xf32>
    %v1014 = stablehlo.reshape %v1013 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1015 = stablehlo.reshape %v1014 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1016 = stablehlo.broadcast_in_dim %b3_g1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1017 = stablehlo.multiply %v1015, %v1016 : tensor<256x197x384xf32>
    %v1018 = stablehlo.reshape %v1017 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1019 = stablehlo.reshape %v1018 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1020 = stablehlo.broadcast_in_dim %b3_bt1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1021 = stablehlo.add %v1019, %v1020 : tensor<256x197x384xf32>
    %v1022 = stablehlo.reshape %v1021 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1023 = stablehlo.reshape %v1022 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1024 = stablehlo.dot_general %v1023, %b3_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v1025 = stablehlo.broadcast_in_dim %b3_bq, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1026 = stablehlo.add %v1024, %v1025 : tensor<256x197x384xf32>
    %v1027 = stablehlo.reshape %v1026 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1028 = stablehlo.reshape %v1022 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1029 = stablehlo.dot_general %v1028, %b3_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v1030 = stablehlo.broadcast_in_dim %b3_bk, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1031 = stablehlo.add %v1029, %v1030 : tensor<256x197x384xf32>
    %v1032 = stablehlo.reshape %v1031 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1033 = stablehlo.reshape %v1022 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1034 = stablehlo.dot_general %v1033, %b3_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v1035 = stablehlo.broadcast_in_dim %b3_bv, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1036 = stablehlo.add %v1034, %v1035 : tensor<256x197x384xf32>
    %v1037 = stablehlo.reshape %v1036 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1038 = stablehlo.reshape %v1027 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1039 = stablehlo.slice %v1038 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1040 = stablehlo.reshape %v1039 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1041 = stablehlo.reshape %v1032 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1042 = stablehlo.slice %v1041 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1043 = stablehlo.reshape %v1042 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1044 = stablehlo.reshape %v1037 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1045 = stablehlo.slice %v1044 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1046 = stablehlo.reshape %v1045 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1047 = stablehlo.reshape %v1043 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1048 = stablehlo.transpose %v1047, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1049 = stablehlo.reshape %v1048 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1050 = stablehlo.reshape %v1040 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1051 = stablehlo.reshape %v1049 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1052 = stablehlo.dot_general %v1050, %v1051, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1053 = stablehlo.reshape %v1052 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1054 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1055 = stablehlo.multiply %v1053, %v1054 : tensor<256x38809xf32>
    %v1056 = stablehlo.reshape %v1055 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1057 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1058 = stablehlo.reduce(%v1056 init: %v1057) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1059 = stablehlo.broadcast_in_dim %v1058, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1060 = stablehlo.subtract %v1056, %v1059 : tensor<256x197x197xf32>
    %v1061 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1062 = stablehlo.exponential %v1060 : tensor<256x197x197xf32>
    %v1063 = stablehlo.reduce(%v1062 init: %v1061) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1064 = stablehlo.broadcast_in_dim %v1063, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1065 = stablehlo.divide %v1062, %v1064 : tensor<256x197x197xf32>
    %v1066 = stablehlo.reshape %v1065 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1067 = stablehlo.reshape %v1066 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1068 = stablehlo.reshape %v1046 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1069 = stablehlo.dot_general %v1067, %v1068, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1070 = stablehlo.reshape %v1069 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1071 = stablehlo.reshape %v1070 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1072 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1073 = stablehlo.pad %v1071, %v1072, low = [0, 0, 0], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1074 = stablehlo.reshape %v1073 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1075 = stablehlo.reshape %v1027 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1076 = stablehlo.slice %v1075 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1077 = stablehlo.reshape %v1076 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1078 = stablehlo.reshape %v1032 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1079 = stablehlo.slice %v1078 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1080 = stablehlo.reshape %v1079 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1081 = stablehlo.reshape %v1037 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1082 = stablehlo.slice %v1081 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1083 = stablehlo.reshape %v1082 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1084 = stablehlo.reshape %v1080 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1085 = stablehlo.transpose %v1084, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1086 = stablehlo.reshape %v1085 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1087 = stablehlo.reshape %v1077 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1088 = stablehlo.reshape %v1086 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1089 = stablehlo.dot_general %v1087, %v1088, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1090 = stablehlo.reshape %v1089 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1091 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1092 = stablehlo.multiply %v1090, %v1091 : tensor<256x38809xf32>
    %v1093 = stablehlo.reshape %v1092 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1094 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1095 = stablehlo.reduce(%v1093 init: %v1094) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1096 = stablehlo.broadcast_in_dim %v1095, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1097 = stablehlo.subtract %v1093, %v1096 : tensor<256x197x197xf32>
    %v1098 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1099 = stablehlo.exponential %v1097 : tensor<256x197x197xf32>
    %v1100 = stablehlo.reduce(%v1099 init: %v1098) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1101 = stablehlo.broadcast_in_dim %v1100, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1102 = stablehlo.divide %v1099, %v1101 : tensor<256x197x197xf32>
    %v1103 = stablehlo.reshape %v1102 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1104 = stablehlo.reshape %v1103 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1105 = stablehlo.reshape %v1083 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1106 = stablehlo.dot_general %v1104, %v1105, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1107 = stablehlo.reshape %v1106 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1108 = stablehlo.reshape %v1107 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1109 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1110 = stablehlo.pad %v1108, %v1109, low = [0, 0, 64], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1111 = stablehlo.reshape %v1110 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1112 = stablehlo.add %v1074, %v1111 : tensor<256x75648xf32>
    %v1113 = stablehlo.reshape %v1027 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1114 = stablehlo.slice %v1113 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1115 = stablehlo.reshape %v1114 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1116 = stablehlo.reshape %v1032 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1117 = stablehlo.slice %v1116 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1118 = stablehlo.reshape %v1117 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1119 = stablehlo.reshape %v1037 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1120 = stablehlo.slice %v1119 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1121 = stablehlo.reshape %v1120 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1122 = stablehlo.reshape %v1118 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1123 = stablehlo.transpose %v1122, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1124 = stablehlo.reshape %v1123 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1125 = stablehlo.reshape %v1115 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1126 = stablehlo.reshape %v1124 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1127 = stablehlo.dot_general %v1125, %v1126, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1128 = stablehlo.reshape %v1127 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1129 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1130 = stablehlo.multiply %v1128, %v1129 : tensor<256x38809xf32>
    %v1131 = stablehlo.reshape %v1130 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1132 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1133 = stablehlo.reduce(%v1131 init: %v1132) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1134 = stablehlo.broadcast_in_dim %v1133, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1135 = stablehlo.subtract %v1131, %v1134 : tensor<256x197x197xf32>
    %v1136 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1137 = stablehlo.exponential %v1135 : tensor<256x197x197xf32>
    %v1138 = stablehlo.reduce(%v1137 init: %v1136) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1139 = stablehlo.broadcast_in_dim %v1138, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1140 = stablehlo.divide %v1137, %v1139 : tensor<256x197x197xf32>
    %v1141 = stablehlo.reshape %v1140 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1142 = stablehlo.reshape %v1141 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1143 = stablehlo.reshape %v1121 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1144 = stablehlo.dot_general %v1142, %v1143, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1145 = stablehlo.reshape %v1144 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1146 = stablehlo.reshape %v1145 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1147 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1148 = stablehlo.pad %v1146, %v1147, low = [0, 0, 128], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1149 = stablehlo.reshape %v1148 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1150 = stablehlo.add %v1112, %v1149 : tensor<256x75648xf32>
    %v1151 = stablehlo.reshape %v1027 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1152 = stablehlo.slice %v1151 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1153 = stablehlo.reshape %v1152 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1154 = stablehlo.reshape %v1032 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1155 = stablehlo.slice %v1154 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1156 = stablehlo.reshape %v1155 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1157 = stablehlo.reshape %v1037 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1158 = stablehlo.slice %v1157 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1159 = stablehlo.reshape %v1158 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1160 = stablehlo.reshape %v1156 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1161 = stablehlo.transpose %v1160, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1162 = stablehlo.reshape %v1161 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1163 = stablehlo.reshape %v1153 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1164 = stablehlo.reshape %v1162 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1165 = stablehlo.dot_general %v1163, %v1164, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1166 = stablehlo.reshape %v1165 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1167 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1168 = stablehlo.multiply %v1166, %v1167 : tensor<256x38809xf32>
    %v1169 = stablehlo.reshape %v1168 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1170 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1171 = stablehlo.reduce(%v1169 init: %v1170) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1172 = stablehlo.broadcast_in_dim %v1171, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1173 = stablehlo.subtract %v1169, %v1172 : tensor<256x197x197xf32>
    %v1174 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1175 = stablehlo.exponential %v1173 : tensor<256x197x197xf32>
    %v1176 = stablehlo.reduce(%v1175 init: %v1174) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1177 = stablehlo.broadcast_in_dim %v1176, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1178 = stablehlo.divide %v1175, %v1177 : tensor<256x197x197xf32>
    %v1179 = stablehlo.reshape %v1178 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1180 = stablehlo.reshape %v1179 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1181 = stablehlo.reshape %v1159 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1182 = stablehlo.dot_general %v1180, %v1181, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1183 = stablehlo.reshape %v1182 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1184 = stablehlo.reshape %v1183 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1185 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1186 = stablehlo.pad %v1184, %v1185, low = [0, 0, 192], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1187 = stablehlo.reshape %v1186 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1188 = stablehlo.add %v1150, %v1187 : tensor<256x75648xf32>
    %v1189 = stablehlo.reshape %v1027 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1190 = stablehlo.slice %v1189 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1191 = stablehlo.reshape %v1190 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1192 = stablehlo.reshape %v1032 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1193 = stablehlo.slice %v1192 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1194 = stablehlo.reshape %v1193 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1195 = stablehlo.reshape %v1037 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1196 = stablehlo.slice %v1195 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1197 = stablehlo.reshape %v1196 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1198 = stablehlo.reshape %v1194 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1199 = stablehlo.transpose %v1198, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1200 = stablehlo.reshape %v1199 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1201 = stablehlo.reshape %v1191 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1202 = stablehlo.reshape %v1200 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1203 = stablehlo.dot_general %v1201, %v1202, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1204 = stablehlo.reshape %v1203 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1205 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1206 = stablehlo.multiply %v1204, %v1205 : tensor<256x38809xf32>
    %v1207 = stablehlo.reshape %v1206 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1208 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1209 = stablehlo.reduce(%v1207 init: %v1208) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1210 = stablehlo.broadcast_in_dim %v1209, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1211 = stablehlo.subtract %v1207, %v1210 : tensor<256x197x197xf32>
    %v1212 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1213 = stablehlo.exponential %v1211 : tensor<256x197x197xf32>
    %v1214 = stablehlo.reduce(%v1213 init: %v1212) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1215 = stablehlo.broadcast_in_dim %v1214, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1216 = stablehlo.divide %v1213, %v1215 : tensor<256x197x197xf32>
    %v1217 = stablehlo.reshape %v1216 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1218 = stablehlo.reshape %v1217 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1219 = stablehlo.reshape %v1197 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1220 = stablehlo.dot_general %v1218, %v1219, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1221 = stablehlo.reshape %v1220 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1222 = stablehlo.reshape %v1221 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1223 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1224 = stablehlo.pad %v1222, %v1223, low = [0, 0, 256], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1225 = stablehlo.reshape %v1224 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1226 = stablehlo.add %v1188, %v1225 : tensor<256x75648xf32>
    %v1227 = stablehlo.reshape %v1027 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1228 = stablehlo.slice %v1227 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1229 = stablehlo.reshape %v1228 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1230 = stablehlo.reshape %v1032 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1231 = stablehlo.slice %v1230 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1232 = stablehlo.reshape %v1231 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1233 = stablehlo.reshape %v1037 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1234 = stablehlo.slice %v1233 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1235 = stablehlo.reshape %v1234 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1236 = stablehlo.reshape %v1232 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1237 = stablehlo.transpose %v1236, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1238 = stablehlo.reshape %v1237 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1239 = stablehlo.reshape %v1229 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1240 = stablehlo.reshape %v1238 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1241 = stablehlo.dot_general %v1239, %v1240, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1242 = stablehlo.reshape %v1241 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1243 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1244 = stablehlo.multiply %v1242, %v1243 : tensor<256x38809xf32>
    %v1245 = stablehlo.reshape %v1244 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1246 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1247 = stablehlo.reduce(%v1245 init: %v1246) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1248 = stablehlo.broadcast_in_dim %v1247, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1249 = stablehlo.subtract %v1245, %v1248 : tensor<256x197x197xf32>
    %v1250 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1251 = stablehlo.exponential %v1249 : tensor<256x197x197xf32>
    %v1252 = stablehlo.reduce(%v1251 init: %v1250) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1253 = stablehlo.broadcast_in_dim %v1252, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1254 = stablehlo.divide %v1251, %v1253 : tensor<256x197x197xf32>
    %v1255 = stablehlo.reshape %v1254 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1256 = stablehlo.reshape %v1255 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1257 = stablehlo.reshape %v1235 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1258 = stablehlo.dot_general %v1256, %v1257, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1259 = stablehlo.reshape %v1258 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1260 = stablehlo.reshape %v1259 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1261 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1262 = stablehlo.pad %v1260, %v1261, low = [0, 0, 320], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1263 = stablehlo.reshape %v1262 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1264 = stablehlo.add %v1226, %v1263 : tensor<256x75648xf32>
    %v1265 = stablehlo.reshape %v1264 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1266 = stablehlo.dot_general %v1265, %b3_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v1267 = stablehlo.broadcast_in_dim %b3_bo, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1268 = stablehlo.add %v1266, %v1267 : tensor<256x197x384xf32>
    %v1269 = stablehlo.reshape %v1268 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1270 = stablehlo.add %v994, %v1269 : tensor<256x75648xf32>
    %v1271 = stablehlo.reshape %v1270 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1272 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1273 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v1274 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v1275 = stablehlo.reduce(%v1271 init: %v1272) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1276 = stablehlo.broadcast_in_dim %v1275, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1277 = stablehlo.divide %v1276, %v1273 : tensor<256x197x384xf32>
    %v1278 = stablehlo.subtract %v1271, %v1277 : tensor<256x197x384xf32>
    %v1279 = stablehlo.multiply %v1278, %v1278 : tensor<256x197x384xf32>
    %v1280 = stablehlo.reduce(%v1279 init: %v1272) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1281 = stablehlo.broadcast_in_dim %v1280, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1282 = stablehlo.divide %v1281, %v1273 : tensor<256x197x384xf32>
    %v1283 = stablehlo.add %v1282, %v1274 : tensor<256x197x384xf32>
    %v1284 = stablehlo.rsqrt %v1283 : tensor<256x197x384xf32>
    %v1285 = stablehlo.multiply %v1278, %v1284 : tensor<256x197x384xf32>
    %v1286 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1287 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1288 = stablehlo.multiply %v1285, %v1286 : tensor<256x197x384xf32>
    %v1289 = stablehlo.add %v1288, %v1287 : tensor<256x197x384xf32>
    %v1290 = stablehlo.reshape %v1289 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1291 = stablehlo.reshape %v1290 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1292 = stablehlo.broadcast_in_dim %b3_g2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1293 = stablehlo.multiply %v1291, %v1292 : tensor<256x197x384xf32>
    %v1294 = stablehlo.reshape %v1293 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1295 = stablehlo.reshape %v1294 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1296 = stablehlo.broadcast_in_dim %b3_bt2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1297 = stablehlo.add %v1295, %v1296 : tensor<256x197x384xf32>
    %v1298 = stablehlo.reshape %v1297 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1299 = stablehlo.reshape %v1298 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1300 = stablehlo.dot_general %v1299, %b3_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x1536xf32>) -> tensor<256x197x1536xf32>
    %v1301 = stablehlo.broadcast_in_dim %b3_bfc1, dims = [2] : (tensor<1536xf32>) -> tensor<256x197x1536xf32>
    %v1302 = stablehlo.add %v1300, %v1301 : tensor<256x197x1536xf32>
    %v1303 = stablehlo.reshape %v1302 : (tensor<256x197x1536xf32>) -> tensor<256x302592xf32>
    %v1304 = stablehlo.multiply %v1303, %v1303 : tensor<256x302592xf32>
    %v1305 = stablehlo.multiply %v1304, %v1303 : tensor<256x302592xf32>
    %v1306 = stablehlo.constant dense<0.044715> : tensor<256x302592xf32>
    %v1307 = stablehlo.multiply %v1306, %v1305 : tensor<256x302592xf32>
    %v1308 = stablehlo.add %v1303, %v1307 : tensor<256x302592xf32>
    %v1309 = stablehlo.constant dense<0.7978845608028654> : tensor<256x302592xf32>
    %v1310 = stablehlo.multiply %v1309, %v1308 : tensor<256x302592xf32>
    %v1311 = stablehlo.tanh %v1310 : tensor<256x302592xf32>
    %v1312 = stablehlo.constant dense<1.0> : tensor<256x302592xf32>
    %v1313 = stablehlo.add %v1312, %v1311 : tensor<256x302592xf32>
    %v1314 = stablehlo.constant dense<0.5> : tensor<256x302592xf32>
    %v1315 = stablehlo.multiply %v1314, %v1303 : tensor<256x302592xf32>
    %v1316 = stablehlo.multiply %v1315, %v1313 : tensor<256x302592xf32>
    %v1317 = stablehlo.reshape %v1316 : (tensor<256x302592xf32>) -> tensor<256x197x1536xf32>
    %v1318 = stablehlo.dot_general %v1317, %b3_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x1536xf32>, tensor<1536x384xf32>) -> tensor<256x197x384xf32>
    %v1319 = stablehlo.broadcast_in_dim %b3_bfc2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1320 = stablehlo.add %v1318, %v1319 : tensor<256x197x384xf32>
    %v1321 = stablehlo.reshape %v1320 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1322 = stablehlo.add %v1270, %v1321 : tensor<256x75648xf32>
    %v1323 = stablehlo.reshape %v1322 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1324 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1325 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v1326 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v1327 = stablehlo.reduce(%v1323 init: %v1324) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1328 = stablehlo.broadcast_in_dim %v1327, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1329 = stablehlo.divide %v1328, %v1325 : tensor<256x197x384xf32>
    %v1330 = stablehlo.subtract %v1323, %v1329 : tensor<256x197x384xf32>
    %v1331 = stablehlo.multiply %v1330, %v1330 : tensor<256x197x384xf32>
    %v1332 = stablehlo.reduce(%v1331 init: %v1324) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1333 = stablehlo.broadcast_in_dim %v1332, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1334 = stablehlo.divide %v1333, %v1325 : tensor<256x197x384xf32>
    %v1335 = stablehlo.add %v1334, %v1326 : tensor<256x197x384xf32>
    %v1336 = stablehlo.rsqrt %v1335 : tensor<256x197x384xf32>
    %v1337 = stablehlo.multiply %v1330, %v1336 : tensor<256x197x384xf32>
    %v1338 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1339 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1340 = stablehlo.multiply %v1337, %v1338 : tensor<256x197x384xf32>
    %v1341 = stablehlo.add %v1340, %v1339 : tensor<256x197x384xf32>
    %v1342 = stablehlo.reshape %v1341 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1343 = stablehlo.reshape %v1342 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1344 = stablehlo.broadcast_in_dim %b4_g1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1345 = stablehlo.multiply %v1343, %v1344 : tensor<256x197x384xf32>
    %v1346 = stablehlo.reshape %v1345 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1347 = stablehlo.reshape %v1346 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1348 = stablehlo.broadcast_in_dim %b4_bt1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1349 = stablehlo.add %v1347, %v1348 : tensor<256x197x384xf32>
    %v1350 = stablehlo.reshape %v1349 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1351 = stablehlo.reshape %v1350 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1352 = stablehlo.dot_general %v1351, %b4_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v1353 = stablehlo.broadcast_in_dim %b4_bq, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1354 = stablehlo.add %v1352, %v1353 : tensor<256x197x384xf32>
    %v1355 = stablehlo.reshape %v1354 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1356 = stablehlo.reshape %v1350 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1357 = stablehlo.dot_general %v1356, %b4_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v1358 = stablehlo.broadcast_in_dim %b4_bk, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1359 = stablehlo.add %v1357, %v1358 : tensor<256x197x384xf32>
    %v1360 = stablehlo.reshape %v1359 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1361 = stablehlo.reshape %v1350 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1362 = stablehlo.dot_general %v1361, %b4_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v1363 = stablehlo.broadcast_in_dim %b4_bv, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1364 = stablehlo.add %v1362, %v1363 : tensor<256x197x384xf32>
    %v1365 = stablehlo.reshape %v1364 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1366 = stablehlo.reshape %v1355 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1367 = stablehlo.slice %v1366 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1368 = stablehlo.reshape %v1367 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1369 = stablehlo.reshape %v1360 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1370 = stablehlo.slice %v1369 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1371 = stablehlo.reshape %v1370 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1372 = stablehlo.reshape %v1365 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1373 = stablehlo.slice %v1372 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1374 = stablehlo.reshape %v1373 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1375 = stablehlo.reshape %v1371 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1376 = stablehlo.transpose %v1375, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1377 = stablehlo.reshape %v1376 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1378 = stablehlo.reshape %v1368 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1379 = stablehlo.reshape %v1377 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1380 = stablehlo.dot_general %v1378, %v1379, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1381 = stablehlo.reshape %v1380 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1382 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1383 = stablehlo.multiply %v1381, %v1382 : tensor<256x38809xf32>
    %v1384 = stablehlo.reshape %v1383 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1385 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1386 = stablehlo.reduce(%v1384 init: %v1385) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1387 = stablehlo.broadcast_in_dim %v1386, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1388 = stablehlo.subtract %v1384, %v1387 : tensor<256x197x197xf32>
    %v1389 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1390 = stablehlo.exponential %v1388 : tensor<256x197x197xf32>
    %v1391 = stablehlo.reduce(%v1390 init: %v1389) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1392 = stablehlo.broadcast_in_dim %v1391, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1393 = stablehlo.divide %v1390, %v1392 : tensor<256x197x197xf32>
    %v1394 = stablehlo.reshape %v1393 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1395 = stablehlo.reshape %v1394 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1396 = stablehlo.reshape %v1374 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1397 = stablehlo.dot_general %v1395, %v1396, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1398 = stablehlo.reshape %v1397 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1399 = stablehlo.reshape %v1398 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1400 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1401 = stablehlo.pad %v1399, %v1400, low = [0, 0, 0], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1402 = stablehlo.reshape %v1401 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1403 = stablehlo.reshape %v1355 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1404 = stablehlo.slice %v1403 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1405 = stablehlo.reshape %v1404 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1406 = stablehlo.reshape %v1360 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1407 = stablehlo.slice %v1406 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1408 = stablehlo.reshape %v1407 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1409 = stablehlo.reshape %v1365 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1410 = stablehlo.slice %v1409 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1411 = stablehlo.reshape %v1410 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1412 = stablehlo.reshape %v1408 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1413 = stablehlo.transpose %v1412, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1414 = stablehlo.reshape %v1413 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1415 = stablehlo.reshape %v1405 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1416 = stablehlo.reshape %v1414 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1417 = stablehlo.dot_general %v1415, %v1416, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1418 = stablehlo.reshape %v1417 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1419 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1420 = stablehlo.multiply %v1418, %v1419 : tensor<256x38809xf32>
    %v1421 = stablehlo.reshape %v1420 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1422 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1423 = stablehlo.reduce(%v1421 init: %v1422) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1424 = stablehlo.broadcast_in_dim %v1423, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1425 = stablehlo.subtract %v1421, %v1424 : tensor<256x197x197xf32>
    %v1426 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1427 = stablehlo.exponential %v1425 : tensor<256x197x197xf32>
    %v1428 = stablehlo.reduce(%v1427 init: %v1426) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1429 = stablehlo.broadcast_in_dim %v1428, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1430 = stablehlo.divide %v1427, %v1429 : tensor<256x197x197xf32>
    %v1431 = stablehlo.reshape %v1430 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1432 = stablehlo.reshape %v1431 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1433 = stablehlo.reshape %v1411 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1434 = stablehlo.dot_general %v1432, %v1433, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1435 = stablehlo.reshape %v1434 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1436 = stablehlo.reshape %v1435 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1437 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1438 = stablehlo.pad %v1436, %v1437, low = [0, 0, 64], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1439 = stablehlo.reshape %v1438 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1440 = stablehlo.add %v1402, %v1439 : tensor<256x75648xf32>
    %v1441 = stablehlo.reshape %v1355 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1442 = stablehlo.slice %v1441 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1443 = stablehlo.reshape %v1442 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1444 = stablehlo.reshape %v1360 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1445 = stablehlo.slice %v1444 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1446 = stablehlo.reshape %v1445 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1447 = stablehlo.reshape %v1365 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1448 = stablehlo.slice %v1447 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1449 = stablehlo.reshape %v1448 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1450 = stablehlo.reshape %v1446 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1451 = stablehlo.transpose %v1450, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1452 = stablehlo.reshape %v1451 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1453 = stablehlo.reshape %v1443 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1454 = stablehlo.reshape %v1452 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1455 = stablehlo.dot_general %v1453, %v1454, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1456 = stablehlo.reshape %v1455 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1457 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1458 = stablehlo.multiply %v1456, %v1457 : tensor<256x38809xf32>
    %v1459 = stablehlo.reshape %v1458 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1460 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1461 = stablehlo.reduce(%v1459 init: %v1460) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1462 = stablehlo.broadcast_in_dim %v1461, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1463 = stablehlo.subtract %v1459, %v1462 : tensor<256x197x197xf32>
    %v1464 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1465 = stablehlo.exponential %v1463 : tensor<256x197x197xf32>
    %v1466 = stablehlo.reduce(%v1465 init: %v1464) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1467 = stablehlo.broadcast_in_dim %v1466, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1468 = stablehlo.divide %v1465, %v1467 : tensor<256x197x197xf32>
    %v1469 = stablehlo.reshape %v1468 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1470 = stablehlo.reshape %v1469 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1471 = stablehlo.reshape %v1449 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1472 = stablehlo.dot_general %v1470, %v1471, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1473 = stablehlo.reshape %v1472 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1474 = stablehlo.reshape %v1473 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1475 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1476 = stablehlo.pad %v1474, %v1475, low = [0, 0, 128], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1477 = stablehlo.reshape %v1476 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1478 = stablehlo.add %v1440, %v1477 : tensor<256x75648xf32>
    %v1479 = stablehlo.reshape %v1355 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1480 = stablehlo.slice %v1479 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1481 = stablehlo.reshape %v1480 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1482 = stablehlo.reshape %v1360 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1483 = stablehlo.slice %v1482 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1484 = stablehlo.reshape %v1483 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1485 = stablehlo.reshape %v1365 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1486 = stablehlo.slice %v1485 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1487 = stablehlo.reshape %v1486 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1488 = stablehlo.reshape %v1484 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1489 = stablehlo.transpose %v1488, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1490 = stablehlo.reshape %v1489 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1491 = stablehlo.reshape %v1481 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1492 = stablehlo.reshape %v1490 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1493 = stablehlo.dot_general %v1491, %v1492, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1494 = stablehlo.reshape %v1493 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1495 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1496 = stablehlo.multiply %v1494, %v1495 : tensor<256x38809xf32>
    %v1497 = stablehlo.reshape %v1496 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1498 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1499 = stablehlo.reduce(%v1497 init: %v1498) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1500 = stablehlo.broadcast_in_dim %v1499, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1501 = stablehlo.subtract %v1497, %v1500 : tensor<256x197x197xf32>
    %v1502 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1503 = stablehlo.exponential %v1501 : tensor<256x197x197xf32>
    %v1504 = stablehlo.reduce(%v1503 init: %v1502) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1505 = stablehlo.broadcast_in_dim %v1504, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1506 = stablehlo.divide %v1503, %v1505 : tensor<256x197x197xf32>
    %v1507 = stablehlo.reshape %v1506 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1508 = stablehlo.reshape %v1507 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1509 = stablehlo.reshape %v1487 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1510 = stablehlo.dot_general %v1508, %v1509, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1511 = stablehlo.reshape %v1510 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1512 = stablehlo.reshape %v1511 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1513 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1514 = stablehlo.pad %v1512, %v1513, low = [0, 0, 192], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1515 = stablehlo.reshape %v1514 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1516 = stablehlo.add %v1478, %v1515 : tensor<256x75648xf32>
    %v1517 = stablehlo.reshape %v1355 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1518 = stablehlo.slice %v1517 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1519 = stablehlo.reshape %v1518 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1520 = stablehlo.reshape %v1360 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1521 = stablehlo.slice %v1520 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1522 = stablehlo.reshape %v1521 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1523 = stablehlo.reshape %v1365 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1524 = stablehlo.slice %v1523 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1525 = stablehlo.reshape %v1524 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1526 = stablehlo.reshape %v1522 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1527 = stablehlo.transpose %v1526, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1528 = stablehlo.reshape %v1527 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1529 = stablehlo.reshape %v1519 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1530 = stablehlo.reshape %v1528 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1531 = stablehlo.dot_general %v1529, %v1530, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1532 = stablehlo.reshape %v1531 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1533 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1534 = stablehlo.multiply %v1532, %v1533 : tensor<256x38809xf32>
    %v1535 = stablehlo.reshape %v1534 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1536 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1537 = stablehlo.reduce(%v1535 init: %v1536) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1538 = stablehlo.broadcast_in_dim %v1537, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1539 = stablehlo.subtract %v1535, %v1538 : tensor<256x197x197xf32>
    %v1540 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1541 = stablehlo.exponential %v1539 : tensor<256x197x197xf32>
    %v1542 = stablehlo.reduce(%v1541 init: %v1540) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1543 = stablehlo.broadcast_in_dim %v1542, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1544 = stablehlo.divide %v1541, %v1543 : tensor<256x197x197xf32>
    %v1545 = stablehlo.reshape %v1544 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1546 = stablehlo.reshape %v1545 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1547 = stablehlo.reshape %v1525 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1548 = stablehlo.dot_general %v1546, %v1547, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1549 = stablehlo.reshape %v1548 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1550 = stablehlo.reshape %v1549 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1551 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1552 = stablehlo.pad %v1550, %v1551, low = [0, 0, 256], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1553 = stablehlo.reshape %v1552 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1554 = stablehlo.add %v1516, %v1553 : tensor<256x75648xf32>
    %v1555 = stablehlo.reshape %v1355 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1556 = stablehlo.slice %v1555 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1557 = stablehlo.reshape %v1556 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1558 = stablehlo.reshape %v1360 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1559 = stablehlo.slice %v1558 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1560 = stablehlo.reshape %v1559 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1561 = stablehlo.reshape %v1365 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1562 = stablehlo.slice %v1561 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1563 = stablehlo.reshape %v1562 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1564 = stablehlo.reshape %v1560 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1565 = stablehlo.transpose %v1564, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1566 = stablehlo.reshape %v1565 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1567 = stablehlo.reshape %v1557 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1568 = stablehlo.reshape %v1566 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1569 = stablehlo.dot_general %v1567, %v1568, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1570 = stablehlo.reshape %v1569 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1571 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1572 = stablehlo.multiply %v1570, %v1571 : tensor<256x38809xf32>
    %v1573 = stablehlo.reshape %v1572 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1574 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1575 = stablehlo.reduce(%v1573 init: %v1574) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1576 = stablehlo.broadcast_in_dim %v1575, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1577 = stablehlo.subtract %v1573, %v1576 : tensor<256x197x197xf32>
    %v1578 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1579 = stablehlo.exponential %v1577 : tensor<256x197x197xf32>
    %v1580 = stablehlo.reduce(%v1579 init: %v1578) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1581 = stablehlo.broadcast_in_dim %v1580, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1582 = stablehlo.divide %v1579, %v1581 : tensor<256x197x197xf32>
    %v1583 = stablehlo.reshape %v1582 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1584 = stablehlo.reshape %v1583 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1585 = stablehlo.reshape %v1563 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1586 = stablehlo.dot_general %v1584, %v1585, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1587 = stablehlo.reshape %v1586 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1588 = stablehlo.reshape %v1587 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1589 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1590 = stablehlo.pad %v1588, %v1589, low = [0, 0, 320], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1591 = stablehlo.reshape %v1590 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1592 = stablehlo.add %v1554, %v1591 : tensor<256x75648xf32>
    %v1593 = stablehlo.reshape %v1592 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1594 = stablehlo.dot_general %v1593, %b4_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v1595 = stablehlo.broadcast_in_dim %b4_bo, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1596 = stablehlo.add %v1594, %v1595 : tensor<256x197x384xf32>
    %v1597 = stablehlo.reshape %v1596 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1598 = stablehlo.add %v1322, %v1597 : tensor<256x75648xf32>
    %v1599 = stablehlo.reshape %v1598 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1600 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1601 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v1602 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v1603 = stablehlo.reduce(%v1599 init: %v1600) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1604 = stablehlo.broadcast_in_dim %v1603, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1605 = stablehlo.divide %v1604, %v1601 : tensor<256x197x384xf32>
    %v1606 = stablehlo.subtract %v1599, %v1605 : tensor<256x197x384xf32>
    %v1607 = stablehlo.multiply %v1606, %v1606 : tensor<256x197x384xf32>
    %v1608 = stablehlo.reduce(%v1607 init: %v1600) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1609 = stablehlo.broadcast_in_dim %v1608, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1610 = stablehlo.divide %v1609, %v1601 : tensor<256x197x384xf32>
    %v1611 = stablehlo.add %v1610, %v1602 : tensor<256x197x384xf32>
    %v1612 = stablehlo.rsqrt %v1611 : tensor<256x197x384xf32>
    %v1613 = stablehlo.multiply %v1606, %v1612 : tensor<256x197x384xf32>
    %v1614 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1615 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1616 = stablehlo.multiply %v1613, %v1614 : tensor<256x197x384xf32>
    %v1617 = stablehlo.add %v1616, %v1615 : tensor<256x197x384xf32>
    %v1618 = stablehlo.reshape %v1617 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1619 = stablehlo.reshape %v1618 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1620 = stablehlo.broadcast_in_dim %b4_g2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1621 = stablehlo.multiply %v1619, %v1620 : tensor<256x197x384xf32>
    %v1622 = stablehlo.reshape %v1621 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1623 = stablehlo.reshape %v1622 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1624 = stablehlo.broadcast_in_dim %b4_bt2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1625 = stablehlo.add %v1623, %v1624 : tensor<256x197x384xf32>
    %v1626 = stablehlo.reshape %v1625 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1627 = stablehlo.reshape %v1626 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1628 = stablehlo.dot_general %v1627, %b4_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x1536xf32>) -> tensor<256x197x1536xf32>
    %v1629 = stablehlo.broadcast_in_dim %b4_bfc1, dims = [2] : (tensor<1536xf32>) -> tensor<256x197x1536xf32>
    %v1630 = stablehlo.add %v1628, %v1629 : tensor<256x197x1536xf32>
    %v1631 = stablehlo.reshape %v1630 : (tensor<256x197x1536xf32>) -> tensor<256x302592xf32>
    %v1632 = stablehlo.multiply %v1631, %v1631 : tensor<256x302592xf32>
    %v1633 = stablehlo.multiply %v1632, %v1631 : tensor<256x302592xf32>
    %v1634 = stablehlo.constant dense<0.044715> : tensor<256x302592xf32>
    %v1635 = stablehlo.multiply %v1634, %v1633 : tensor<256x302592xf32>
    %v1636 = stablehlo.add %v1631, %v1635 : tensor<256x302592xf32>
    %v1637 = stablehlo.constant dense<0.7978845608028654> : tensor<256x302592xf32>
    %v1638 = stablehlo.multiply %v1637, %v1636 : tensor<256x302592xf32>
    %v1639 = stablehlo.tanh %v1638 : tensor<256x302592xf32>
    %v1640 = stablehlo.constant dense<1.0> : tensor<256x302592xf32>
    %v1641 = stablehlo.add %v1640, %v1639 : tensor<256x302592xf32>
    %v1642 = stablehlo.constant dense<0.5> : tensor<256x302592xf32>
    %v1643 = stablehlo.multiply %v1642, %v1631 : tensor<256x302592xf32>
    %v1644 = stablehlo.multiply %v1643, %v1641 : tensor<256x302592xf32>
    %v1645 = stablehlo.reshape %v1644 : (tensor<256x302592xf32>) -> tensor<256x197x1536xf32>
    %v1646 = stablehlo.dot_general %v1645, %b4_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x1536xf32>, tensor<1536x384xf32>) -> tensor<256x197x384xf32>
    %v1647 = stablehlo.broadcast_in_dim %b4_bfc2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1648 = stablehlo.add %v1646, %v1647 : tensor<256x197x384xf32>
    %v1649 = stablehlo.reshape %v1648 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1650 = stablehlo.add %v1598, %v1649 : tensor<256x75648xf32>
    %v1651 = stablehlo.reshape %v1650 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1652 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1653 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v1654 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v1655 = stablehlo.reduce(%v1651 init: %v1652) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1656 = stablehlo.broadcast_in_dim %v1655, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1657 = stablehlo.divide %v1656, %v1653 : tensor<256x197x384xf32>
    %v1658 = stablehlo.subtract %v1651, %v1657 : tensor<256x197x384xf32>
    %v1659 = stablehlo.multiply %v1658, %v1658 : tensor<256x197x384xf32>
    %v1660 = stablehlo.reduce(%v1659 init: %v1652) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1661 = stablehlo.broadcast_in_dim %v1660, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1662 = stablehlo.divide %v1661, %v1653 : tensor<256x197x384xf32>
    %v1663 = stablehlo.add %v1662, %v1654 : tensor<256x197x384xf32>
    %v1664 = stablehlo.rsqrt %v1663 : tensor<256x197x384xf32>
    %v1665 = stablehlo.multiply %v1658, %v1664 : tensor<256x197x384xf32>
    %v1666 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1667 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1668 = stablehlo.multiply %v1665, %v1666 : tensor<256x197x384xf32>
    %v1669 = stablehlo.add %v1668, %v1667 : tensor<256x197x384xf32>
    %v1670 = stablehlo.reshape %v1669 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1671 = stablehlo.reshape %v1670 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1672 = stablehlo.broadcast_in_dim %b5_g1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1673 = stablehlo.multiply %v1671, %v1672 : tensor<256x197x384xf32>
    %v1674 = stablehlo.reshape %v1673 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1675 = stablehlo.reshape %v1674 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1676 = stablehlo.broadcast_in_dim %b5_bt1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1677 = stablehlo.add %v1675, %v1676 : tensor<256x197x384xf32>
    %v1678 = stablehlo.reshape %v1677 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1679 = stablehlo.reshape %v1678 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1680 = stablehlo.dot_general %v1679, %b5_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v1681 = stablehlo.broadcast_in_dim %b5_bq, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1682 = stablehlo.add %v1680, %v1681 : tensor<256x197x384xf32>
    %v1683 = stablehlo.reshape %v1682 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1684 = stablehlo.reshape %v1678 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1685 = stablehlo.dot_general %v1684, %b5_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v1686 = stablehlo.broadcast_in_dim %b5_bk, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1687 = stablehlo.add %v1685, %v1686 : tensor<256x197x384xf32>
    %v1688 = stablehlo.reshape %v1687 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1689 = stablehlo.reshape %v1678 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1690 = stablehlo.dot_general %v1689, %b5_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v1691 = stablehlo.broadcast_in_dim %b5_bv, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1692 = stablehlo.add %v1690, %v1691 : tensor<256x197x384xf32>
    %v1693 = stablehlo.reshape %v1692 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1694 = stablehlo.reshape %v1683 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1695 = stablehlo.slice %v1694 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1696 = stablehlo.reshape %v1695 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1697 = stablehlo.reshape %v1688 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1698 = stablehlo.slice %v1697 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1699 = stablehlo.reshape %v1698 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1700 = stablehlo.reshape %v1693 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1701 = stablehlo.slice %v1700 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1702 = stablehlo.reshape %v1701 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1703 = stablehlo.reshape %v1699 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1704 = stablehlo.transpose %v1703, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1705 = stablehlo.reshape %v1704 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1706 = stablehlo.reshape %v1696 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1707 = stablehlo.reshape %v1705 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1708 = stablehlo.dot_general %v1706, %v1707, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1709 = stablehlo.reshape %v1708 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1710 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1711 = stablehlo.multiply %v1709, %v1710 : tensor<256x38809xf32>
    %v1712 = stablehlo.reshape %v1711 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1713 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1714 = stablehlo.reduce(%v1712 init: %v1713) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1715 = stablehlo.broadcast_in_dim %v1714, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1716 = stablehlo.subtract %v1712, %v1715 : tensor<256x197x197xf32>
    %v1717 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1718 = stablehlo.exponential %v1716 : tensor<256x197x197xf32>
    %v1719 = stablehlo.reduce(%v1718 init: %v1717) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1720 = stablehlo.broadcast_in_dim %v1719, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1721 = stablehlo.divide %v1718, %v1720 : tensor<256x197x197xf32>
    %v1722 = stablehlo.reshape %v1721 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1723 = stablehlo.reshape %v1722 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1724 = stablehlo.reshape %v1702 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1725 = stablehlo.dot_general %v1723, %v1724, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1726 = stablehlo.reshape %v1725 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1727 = stablehlo.reshape %v1726 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1728 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1729 = stablehlo.pad %v1727, %v1728, low = [0, 0, 0], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1730 = stablehlo.reshape %v1729 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1731 = stablehlo.reshape %v1683 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1732 = stablehlo.slice %v1731 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1733 = stablehlo.reshape %v1732 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1734 = stablehlo.reshape %v1688 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1735 = stablehlo.slice %v1734 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1736 = stablehlo.reshape %v1735 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1737 = stablehlo.reshape %v1693 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1738 = stablehlo.slice %v1737 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1739 = stablehlo.reshape %v1738 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1740 = stablehlo.reshape %v1736 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1741 = stablehlo.transpose %v1740, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1742 = stablehlo.reshape %v1741 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1743 = stablehlo.reshape %v1733 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1744 = stablehlo.reshape %v1742 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1745 = stablehlo.dot_general %v1743, %v1744, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1746 = stablehlo.reshape %v1745 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1747 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1748 = stablehlo.multiply %v1746, %v1747 : tensor<256x38809xf32>
    %v1749 = stablehlo.reshape %v1748 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1750 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1751 = stablehlo.reduce(%v1749 init: %v1750) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1752 = stablehlo.broadcast_in_dim %v1751, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1753 = stablehlo.subtract %v1749, %v1752 : tensor<256x197x197xf32>
    %v1754 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1755 = stablehlo.exponential %v1753 : tensor<256x197x197xf32>
    %v1756 = stablehlo.reduce(%v1755 init: %v1754) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1757 = stablehlo.broadcast_in_dim %v1756, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1758 = stablehlo.divide %v1755, %v1757 : tensor<256x197x197xf32>
    %v1759 = stablehlo.reshape %v1758 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1760 = stablehlo.reshape %v1759 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1761 = stablehlo.reshape %v1739 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1762 = stablehlo.dot_general %v1760, %v1761, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1763 = stablehlo.reshape %v1762 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1764 = stablehlo.reshape %v1763 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1765 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1766 = stablehlo.pad %v1764, %v1765, low = [0, 0, 64], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1767 = stablehlo.reshape %v1766 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1768 = stablehlo.add %v1730, %v1767 : tensor<256x75648xf32>
    %v1769 = stablehlo.reshape %v1683 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1770 = stablehlo.slice %v1769 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1771 = stablehlo.reshape %v1770 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1772 = stablehlo.reshape %v1688 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1773 = stablehlo.slice %v1772 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1774 = stablehlo.reshape %v1773 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1775 = stablehlo.reshape %v1693 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1776 = stablehlo.slice %v1775 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1777 = stablehlo.reshape %v1776 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1778 = stablehlo.reshape %v1774 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1779 = stablehlo.transpose %v1778, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1780 = stablehlo.reshape %v1779 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1781 = stablehlo.reshape %v1771 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1782 = stablehlo.reshape %v1780 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1783 = stablehlo.dot_general %v1781, %v1782, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1784 = stablehlo.reshape %v1783 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1785 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1786 = stablehlo.multiply %v1784, %v1785 : tensor<256x38809xf32>
    %v1787 = stablehlo.reshape %v1786 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1788 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1789 = stablehlo.reduce(%v1787 init: %v1788) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1790 = stablehlo.broadcast_in_dim %v1789, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1791 = stablehlo.subtract %v1787, %v1790 : tensor<256x197x197xf32>
    %v1792 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1793 = stablehlo.exponential %v1791 : tensor<256x197x197xf32>
    %v1794 = stablehlo.reduce(%v1793 init: %v1792) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1795 = stablehlo.broadcast_in_dim %v1794, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1796 = stablehlo.divide %v1793, %v1795 : tensor<256x197x197xf32>
    %v1797 = stablehlo.reshape %v1796 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1798 = stablehlo.reshape %v1797 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1799 = stablehlo.reshape %v1777 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1800 = stablehlo.dot_general %v1798, %v1799, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1801 = stablehlo.reshape %v1800 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1802 = stablehlo.reshape %v1801 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1803 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1804 = stablehlo.pad %v1802, %v1803, low = [0, 0, 128], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1805 = stablehlo.reshape %v1804 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1806 = stablehlo.add %v1768, %v1805 : tensor<256x75648xf32>
    %v1807 = stablehlo.reshape %v1683 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1808 = stablehlo.slice %v1807 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1809 = stablehlo.reshape %v1808 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1810 = stablehlo.reshape %v1688 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1811 = stablehlo.slice %v1810 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1812 = stablehlo.reshape %v1811 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1813 = stablehlo.reshape %v1693 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1814 = stablehlo.slice %v1813 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1815 = stablehlo.reshape %v1814 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1816 = stablehlo.reshape %v1812 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1817 = stablehlo.transpose %v1816, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1818 = stablehlo.reshape %v1817 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1819 = stablehlo.reshape %v1809 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1820 = stablehlo.reshape %v1818 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1821 = stablehlo.dot_general %v1819, %v1820, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1822 = stablehlo.reshape %v1821 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1823 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1824 = stablehlo.multiply %v1822, %v1823 : tensor<256x38809xf32>
    %v1825 = stablehlo.reshape %v1824 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1826 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1827 = stablehlo.reduce(%v1825 init: %v1826) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1828 = stablehlo.broadcast_in_dim %v1827, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1829 = stablehlo.subtract %v1825, %v1828 : tensor<256x197x197xf32>
    %v1830 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1831 = stablehlo.exponential %v1829 : tensor<256x197x197xf32>
    %v1832 = stablehlo.reduce(%v1831 init: %v1830) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1833 = stablehlo.broadcast_in_dim %v1832, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1834 = stablehlo.divide %v1831, %v1833 : tensor<256x197x197xf32>
    %v1835 = stablehlo.reshape %v1834 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1836 = stablehlo.reshape %v1835 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1837 = stablehlo.reshape %v1815 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1838 = stablehlo.dot_general %v1836, %v1837, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1839 = stablehlo.reshape %v1838 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1840 = stablehlo.reshape %v1839 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1841 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1842 = stablehlo.pad %v1840, %v1841, low = [0, 0, 192], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1843 = stablehlo.reshape %v1842 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1844 = stablehlo.add %v1806, %v1843 : tensor<256x75648xf32>
    %v1845 = stablehlo.reshape %v1683 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1846 = stablehlo.slice %v1845 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1847 = stablehlo.reshape %v1846 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1848 = stablehlo.reshape %v1688 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1849 = stablehlo.slice %v1848 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1850 = stablehlo.reshape %v1849 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1851 = stablehlo.reshape %v1693 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1852 = stablehlo.slice %v1851 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1853 = stablehlo.reshape %v1852 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1854 = stablehlo.reshape %v1850 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1855 = stablehlo.transpose %v1854, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1856 = stablehlo.reshape %v1855 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1857 = stablehlo.reshape %v1847 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1858 = stablehlo.reshape %v1856 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1859 = stablehlo.dot_general %v1857, %v1858, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1860 = stablehlo.reshape %v1859 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1861 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1862 = stablehlo.multiply %v1860, %v1861 : tensor<256x38809xf32>
    %v1863 = stablehlo.reshape %v1862 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1864 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1865 = stablehlo.reduce(%v1863 init: %v1864) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1866 = stablehlo.broadcast_in_dim %v1865, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1867 = stablehlo.subtract %v1863, %v1866 : tensor<256x197x197xf32>
    %v1868 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1869 = stablehlo.exponential %v1867 : tensor<256x197x197xf32>
    %v1870 = stablehlo.reduce(%v1869 init: %v1868) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1871 = stablehlo.broadcast_in_dim %v1870, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1872 = stablehlo.divide %v1869, %v1871 : tensor<256x197x197xf32>
    %v1873 = stablehlo.reshape %v1872 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1874 = stablehlo.reshape %v1873 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1875 = stablehlo.reshape %v1853 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1876 = stablehlo.dot_general %v1874, %v1875, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1877 = stablehlo.reshape %v1876 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1878 = stablehlo.reshape %v1877 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1879 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1880 = stablehlo.pad %v1878, %v1879, low = [0, 0, 256], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1881 = stablehlo.reshape %v1880 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1882 = stablehlo.add %v1844, %v1881 : tensor<256x75648xf32>
    %v1883 = stablehlo.reshape %v1683 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1884 = stablehlo.slice %v1883 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1885 = stablehlo.reshape %v1884 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1886 = stablehlo.reshape %v1688 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1887 = stablehlo.slice %v1886 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1888 = stablehlo.reshape %v1887 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1889 = stablehlo.reshape %v1693 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1890 = stablehlo.slice %v1889 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v1891 = stablehlo.reshape %v1890 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1892 = stablehlo.reshape %v1888 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1893 = stablehlo.transpose %v1892, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1894 = stablehlo.reshape %v1893 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1895 = stablehlo.reshape %v1885 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1896 = stablehlo.reshape %v1894 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1897 = stablehlo.dot_general %v1895, %v1896, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1898 = stablehlo.reshape %v1897 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1899 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1900 = stablehlo.multiply %v1898, %v1899 : tensor<256x38809xf32>
    %v1901 = stablehlo.reshape %v1900 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1902 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1903 = stablehlo.reduce(%v1901 init: %v1902) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1904 = stablehlo.broadcast_in_dim %v1903, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1905 = stablehlo.subtract %v1901, %v1904 : tensor<256x197x197xf32>
    %v1906 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1907 = stablehlo.exponential %v1905 : tensor<256x197x197xf32>
    %v1908 = stablehlo.reduce(%v1907 init: %v1906) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1909 = stablehlo.broadcast_in_dim %v1908, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1910 = stablehlo.divide %v1907, %v1909 : tensor<256x197x197xf32>
    %v1911 = stablehlo.reshape %v1910 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1912 = stablehlo.reshape %v1911 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1913 = stablehlo.reshape %v1891 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1914 = stablehlo.dot_general %v1912, %v1913, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1915 = stablehlo.reshape %v1914 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1916 = stablehlo.reshape %v1915 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1917 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1918 = stablehlo.pad %v1916, %v1917, low = [0, 0, 320], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v1919 = stablehlo.reshape %v1918 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1920 = stablehlo.add %v1882, %v1919 : tensor<256x75648xf32>
    %v1921 = stablehlo.reshape %v1920 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1922 = stablehlo.dot_general %v1921, %b5_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v1923 = stablehlo.broadcast_in_dim %b5_bo, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1924 = stablehlo.add %v1922, %v1923 : tensor<256x197x384xf32>
    %v1925 = stablehlo.reshape %v1924 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1926 = stablehlo.add %v1650, %v1925 : tensor<256x75648xf32>
    %v1927 = stablehlo.reshape %v1926 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1928 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1929 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v1930 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v1931 = stablehlo.reduce(%v1927 init: %v1928) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1932 = stablehlo.broadcast_in_dim %v1931, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1933 = stablehlo.divide %v1932, %v1929 : tensor<256x197x384xf32>
    %v1934 = stablehlo.subtract %v1927, %v1933 : tensor<256x197x384xf32>
    %v1935 = stablehlo.multiply %v1934, %v1934 : tensor<256x197x384xf32>
    %v1936 = stablehlo.reduce(%v1935 init: %v1928) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1937 = stablehlo.broadcast_in_dim %v1936, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1938 = stablehlo.divide %v1937, %v1929 : tensor<256x197x384xf32>
    %v1939 = stablehlo.add %v1938, %v1930 : tensor<256x197x384xf32>
    %v1940 = stablehlo.rsqrt %v1939 : tensor<256x197x384xf32>
    %v1941 = stablehlo.multiply %v1934, %v1940 : tensor<256x197x384xf32>
    %v1942 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1943 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1944 = stablehlo.multiply %v1941, %v1942 : tensor<256x197x384xf32>
    %v1945 = stablehlo.add %v1944, %v1943 : tensor<256x197x384xf32>
    %v1946 = stablehlo.reshape %v1945 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1947 = stablehlo.reshape %v1946 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1948 = stablehlo.broadcast_in_dim %b5_g2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1949 = stablehlo.multiply %v1947, %v1948 : tensor<256x197x384xf32>
    %v1950 = stablehlo.reshape %v1949 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1951 = stablehlo.reshape %v1950 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1952 = stablehlo.broadcast_in_dim %b5_bt2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1953 = stablehlo.add %v1951, %v1952 : tensor<256x197x384xf32>
    %v1954 = stablehlo.reshape %v1953 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1955 = stablehlo.reshape %v1954 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1956 = stablehlo.dot_general %v1955, %b5_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x1536xf32>) -> tensor<256x197x1536xf32>
    %v1957 = stablehlo.broadcast_in_dim %b5_bfc1, dims = [2] : (tensor<1536xf32>) -> tensor<256x197x1536xf32>
    %v1958 = stablehlo.add %v1956, %v1957 : tensor<256x197x1536xf32>
    %v1959 = stablehlo.reshape %v1958 : (tensor<256x197x1536xf32>) -> tensor<256x302592xf32>
    %v1960 = stablehlo.multiply %v1959, %v1959 : tensor<256x302592xf32>
    %v1961 = stablehlo.multiply %v1960, %v1959 : tensor<256x302592xf32>
    %v1962 = stablehlo.constant dense<0.044715> : tensor<256x302592xf32>
    %v1963 = stablehlo.multiply %v1962, %v1961 : tensor<256x302592xf32>
    %v1964 = stablehlo.add %v1959, %v1963 : tensor<256x302592xf32>
    %v1965 = stablehlo.constant dense<0.7978845608028654> : tensor<256x302592xf32>
    %v1966 = stablehlo.multiply %v1965, %v1964 : tensor<256x302592xf32>
    %v1967 = stablehlo.tanh %v1966 : tensor<256x302592xf32>
    %v1968 = stablehlo.constant dense<1.0> : tensor<256x302592xf32>
    %v1969 = stablehlo.add %v1968, %v1967 : tensor<256x302592xf32>
    %v1970 = stablehlo.constant dense<0.5> : tensor<256x302592xf32>
    %v1971 = stablehlo.multiply %v1970, %v1959 : tensor<256x302592xf32>
    %v1972 = stablehlo.multiply %v1971, %v1969 : tensor<256x302592xf32>
    %v1973 = stablehlo.reshape %v1972 : (tensor<256x302592xf32>) -> tensor<256x197x1536xf32>
    %v1974 = stablehlo.dot_general %v1973, %b5_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x1536xf32>, tensor<1536x384xf32>) -> tensor<256x197x384xf32>
    %v1975 = stablehlo.broadcast_in_dim %b5_bfc2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v1976 = stablehlo.add %v1974, %v1975 : tensor<256x197x384xf32>
    %v1977 = stablehlo.reshape %v1976 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1978 = stablehlo.add %v1926, %v1977 : tensor<256x75648xf32>
    %v1979 = stablehlo.reshape %v1978 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v1980 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1981 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v1982 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v1983 = stablehlo.reduce(%v1979 init: %v1980) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1984 = stablehlo.broadcast_in_dim %v1983, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1985 = stablehlo.divide %v1984, %v1981 : tensor<256x197x384xf32>
    %v1986 = stablehlo.subtract %v1979, %v1985 : tensor<256x197x384xf32>
    %v1987 = stablehlo.multiply %v1986, %v1986 : tensor<256x197x384xf32>
    %v1988 = stablehlo.reduce(%v1987 init: %v1980) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1989 = stablehlo.broadcast_in_dim %v1988, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v1990 = stablehlo.divide %v1989, %v1981 : tensor<256x197x384xf32>
    %v1991 = stablehlo.add %v1990, %v1982 : tensor<256x197x384xf32>
    %v1992 = stablehlo.rsqrt %v1991 : tensor<256x197x384xf32>
    %v1993 = stablehlo.multiply %v1986, %v1992 : tensor<256x197x384xf32>
    %v1994 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1995 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v1996 = stablehlo.multiply %v1993, %v1994 : tensor<256x197x384xf32>
    %v1997 = stablehlo.add %v1996, %v1995 : tensor<256x197x384xf32>
    %v1998 = stablehlo.reshape %v1997 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v1999 = stablehlo.reshape %v1998 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2000 = stablehlo.broadcast_in_dim %b6_g1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2001 = stablehlo.multiply %v1999, %v2000 : tensor<256x197x384xf32>
    %v2002 = stablehlo.reshape %v2001 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2003 = stablehlo.reshape %v2002 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2004 = stablehlo.broadcast_in_dim %b6_bt1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2005 = stablehlo.add %v2003, %v2004 : tensor<256x197x384xf32>
    %v2006 = stablehlo.reshape %v2005 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2007 = stablehlo.reshape %v2006 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2008 = stablehlo.dot_general %v2007, %b6_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2009 = stablehlo.broadcast_in_dim %b6_bq, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2010 = stablehlo.add %v2008, %v2009 : tensor<256x197x384xf32>
    %v2011 = stablehlo.reshape %v2010 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2012 = stablehlo.reshape %v2006 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2013 = stablehlo.dot_general %v2012, %b6_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2014 = stablehlo.broadcast_in_dim %b6_bk, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2015 = stablehlo.add %v2013, %v2014 : tensor<256x197x384xf32>
    %v2016 = stablehlo.reshape %v2015 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2017 = stablehlo.reshape %v2006 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2018 = stablehlo.dot_general %v2017, %b6_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2019 = stablehlo.broadcast_in_dim %b6_bv, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2020 = stablehlo.add %v2018, %v2019 : tensor<256x197x384xf32>
    %v2021 = stablehlo.reshape %v2020 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2022 = stablehlo.reshape %v2011 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2023 = stablehlo.slice %v2022 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2024 = stablehlo.reshape %v2023 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2025 = stablehlo.reshape %v2016 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2026 = stablehlo.slice %v2025 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2027 = stablehlo.reshape %v2026 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2028 = stablehlo.reshape %v2021 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2029 = stablehlo.slice %v2028 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2030 = stablehlo.reshape %v2029 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2031 = stablehlo.reshape %v2027 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2032 = stablehlo.transpose %v2031, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2033 = stablehlo.reshape %v2032 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2034 = stablehlo.reshape %v2024 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2035 = stablehlo.reshape %v2033 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2036 = stablehlo.dot_general %v2034, %v2035, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2037 = stablehlo.reshape %v2036 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2038 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2039 = stablehlo.multiply %v2037, %v2038 : tensor<256x38809xf32>
    %v2040 = stablehlo.reshape %v2039 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2041 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2042 = stablehlo.reduce(%v2040 init: %v2041) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2043 = stablehlo.broadcast_in_dim %v2042, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2044 = stablehlo.subtract %v2040, %v2043 : tensor<256x197x197xf32>
    %v2045 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2046 = stablehlo.exponential %v2044 : tensor<256x197x197xf32>
    %v2047 = stablehlo.reduce(%v2046 init: %v2045) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2048 = stablehlo.broadcast_in_dim %v2047, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2049 = stablehlo.divide %v2046, %v2048 : tensor<256x197x197xf32>
    %v2050 = stablehlo.reshape %v2049 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2051 = stablehlo.reshape %v2050 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2052 = stablehlo.reshape %v2030 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2053 = stablehlo.dot_general %v2051, %v2052, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2054 = stablehlo.reshape %v2053 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2055 = stablehlo.reshape %v2054 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2056 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2057 = stablehlo.pad %v2055, %v2056, low = [0, 0, 0], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2058 = stablehlo.reshape %v2057 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2059 = stablehlo.reshape %v2011 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2060 = stablehlo.slice %v2059 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2061 = stablehlo.reshape %v2060 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2062 = stablehlo.reshape %v2016 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2063 = stablehlo.slice %v2062 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2064 = stablehlo.reshape %v2063 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2065 = stablehlo.reshape %v2021 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2066 = stablehlo.slice %v2065 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2067 = stablehlo.reshape %v2066 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2068 = stablehlo.reshape %v2064 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2069 = stablehlo.transpose %v2068, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2070 = stablehlo.reshape %v2069 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2071 = stablehlo.reshape %v2061 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2072 = stablehlo.reshape %v2070 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2073 = stablehlo.dot_general %v2071, %v2072, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2074 = stablehlo.reshape %v2073 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2075 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2076 = stablehlo.multiply %v2074, %v2075 : tensor<256x38809xf32>
    %v2077 = stablehlo.reshape %v2076 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2078 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2079 = stablehlo.reduce(%v2077 init: %v2078) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2080 = stablehlo.broadcast_in_dim %v2079, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2081 = stablehlo.subtract %v2077, %v2080 : tensor<256x197x197xf32>
    %v2082 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2083 = stablehlo.exponential %v2081 : tensor<256x197x197xf32>
    %v2084 = stablehlo.reduce(%v2083 init: %v2082) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2085 = stablehlo.broadcast_in_dim %v2084, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2086 = stablehlo.divide %v2083, %v2085 : tensor<256x197x197xf32>
    %v2087 = stablehlo.reshape %v2086 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2088 = stablehlo.reshape %v2087 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2089 = stablehlo.reshape %v2067 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2090 = stablehlo.dot_general %v2088, %v2089, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2091 = stablehlo.reshape %v2090 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2092 = stablehlo.reshape %v2091 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2093 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2094 = stablehlo.pad %v2092, %v2093, low = [0, 0, 64], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2095 = stablehlo.reshape %v2094 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2096 = stablehlo.add %v2058, %v2095 : tensor<256x75648xf32>
    %v2097 = stablehlo.reshape %v2011 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2098 = stablehlo.slice %v2097 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2099 = stablehlo.reshape %v2098 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2100 = stablehlo.reshape %v2016 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2101 = stablehlo.slice %v2100 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2102 = stablehlo.reshape %v2101 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2103 = stablehlo.reshape %v2021 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2104 = stablehlo.slice %v2103 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2105 = stablehlo.reshape %v2104 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2106 = stablehlo.reshape %v2102 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2107 = stablehlo.transpose %v2106, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2108 = stablehlo.reshape %v2107 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2109 = stablehlo.reshape %v2099 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2110 = stablehlo.reshape %v2108 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2111 = stablehlo.dot_general %v2109, %v2110, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2112 = stablehlo.reshape %v2111 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2113 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2114 = stablehlo.multiply %v2112, %v2113 : tensor<256x38809xf32>
    %v2115 = stablehlo.reshape %v2114 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2116 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2117 = stablehlo.reduce(%v2115 init: %v2116) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2118 = stablehlo.broadcast_in_dim %v2117, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2119 = stablehlo.subtract %v2115, %v2118 : tensor<256x197x197xf32>
    %v2120 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2121 = stablehlo.exponential %v2119 : tensor<256x197x197xf32>
    %v2122 = stablehlo.reduce(%v2121 init: %v2120) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2123 = stablehlo.broadcast_in_dim %v2122, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2124 = stablehlo.divide %v2121, %v2123 : tensor<256x197x197xf32>
    %v2125 = stablehlo.reshape %v2124 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2126 = stablehlo.reshape %v2125 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2127 = stablehlo.reshape %v2105 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2128 = stablehlo.dot_general %v2126, %v2127, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2129 = stablehlo.reshape %v2128 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2130 = stablehlo.reshape %v2129 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2131 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2132 = stablehlo.pad %v2130, %v2131, low = [0, 0, 128], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2133 = stablehlo.reshape %v2132 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2134 = stablehlo.add %v2096, %v2133 : tensor<256x75648xf32>
    %v2135 = stablehlo.reshape %v2011 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2136 = stablehlo.slice %v2135 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2137 = stablehlo.reshape %v2136 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2138 = stablehlo.reshape %v2016 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2139 = stablehlo.slice %v2138 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2140 = stablehlo.reshape %v2139 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2141 = stablehlo.reshape %v2021 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2142 = stablehlo.slice %v2141 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2143 = stablehlo.reshape %v2142 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2144 = stablehlo.reshape %v2140 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2145 = stablehlo.transpose %v2144, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2146 = stablehlo.reshape %v2145 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2147 = stablehlo.reshape %v2137 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2148 = stablehlo.reshape %v2146 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2149 = stablehlo.dot_general %v2147, %v2148, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2150 = stablehlo.reshape %v2149 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2151 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2152 = stablehlo.multiply %v2150, %v2151 : tensor<256x38809xf32>
    %v2153 = stablehlo.reshape %v2152 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2154 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2155 = stablehlo.reduce(%v2153 init: %v2154) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2156 = stablehlo.broadcast_in_dim %v2155, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2157 = stablehlo.subtract %v2153, %v2156 : tensor<256x197x197xf32>
    %v2158 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2159 = stablehlo.exponential %v2157 : tensor<256x197x197xf32>
    %v2160 = stablehlo.reduce(%v2159 init: %v2158) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2161 = stablehlo.broadcast_in_dim %v2160, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2162 = stablehlo.divide %v2159, %v2161 : tensor<256x197x197xf32>
    %v2163 = stablehlo.reshape %v2162 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2164 = stablehlo.reshape %v2163 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2165 = stablehlo.reshape %v2143 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2166 = stablehlo.dot_general %v2164, %v2165, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2167 = stablehlo.reshape %v2166 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2168 = stablehlo.reshape %v2167 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2169 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2170 = stablehlo.pad %v2168, %v2169, low = [0, 0, 192], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2171 = stablehlo.reshape %v2170 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2172 = stablehlo.add %v2134, %v2171 : tensor<256x75648xf32>
    %v2173 = stablehlo.reshape %v2011 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2174 = stablehlo.slice %v2173 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2175 = stablehlo.reshape %v2174 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2176 = stablehlo.reshape %v2016 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2177 = stablehlo.slice %v2176 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2178 = stablehlo.reshape %v2177 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2179 = stablehlo.reshape %v2021 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2180 = stablehlo.slice %v2179 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2181 = stablehlo.reshape %v2180 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2182 = stablehlo.reshape %v2178 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2183 = stablehlo.transpose %v2182, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2184 = stablehlo.reshape %v2183 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2185 = stablehlo.reshape %v2175 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2186 = stablehlo.reshape %v2184 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2187 = stablehlo.dot_general %v2185, %v2186, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2188 = stablehlo.reshape %v2187 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2189 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2190 = stablehlo.multiply %v2188, %v2189 : tensor<256x38809xf32>
    %v2191 = stablehlo.reshape %v2190 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2192 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2193 = stablehlo.reduce(%v2191 init: %v2192) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2194 = stablehlo.broadcast_in_dim %v2193, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2195 = stablehlo.subtract %v2191, %v2194 : tensor<256x197x197xf32>
    %v2196 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2197 = stablehlo.exponential %v2195 : tensor<256x197x197xf32>
    %v2198 = stablehlo.reduce(%v2197 init: %v2196) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2199 = stablehlo.broadcast_in_dim %v2198, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2200 = stablehlo.divide %v2197, %v2199 : tensor<256x197x197xf32>
    %v2201 = stablehlo.reshape %v2200 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2202 = stablehlo.reshape %v2201 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2203 = stablehlo.reshape %v2181 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2204 = stablehlo.dot_general %v2202, %v2203, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2205 = stablehlo.reshape %v2204 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2206 = stablehlo.reshape %v2205 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2207 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2208 = stablehlo.pad %v2206, %v2207, low = [0, 0, 256], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2209 = stablehlo.reshape %v2208 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2210 = stablehlo.add %v2172, %v2209 : tensor<256x75648xf32>
    %v2211 = stablehlo.reshape %v2011 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2212 = stablehlo.slice %v2211 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2213 = stablehlo.reshape %v2212 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2214 = stablehlo.reshape %v2016 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2215 = stablehlo.slice %v2214 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2216 = stablehlo.reshape %v2215 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2217 = stablehlo.reshape %v2021 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2218 = stablehlo.slice %v2217 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2219 = stablehlo.reshape %v2218 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2220 = stablehlo.reshape %v2216 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2221 = stablehlo.transpose %v2220, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2222 = stablehlo.reshape %v2221 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2223 = stablehlo.reshape %v2213 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2224 = stablehlo.reshape %v2222 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2225 = stablehlo.dot_general %v2223, %v2224, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2226 = stablehlo.reshape %v2225 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2227 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2228 = stablehlo.multiply %v2226, %v2227 : tensor<256x38809xf32>
    %v2229 = stablehlo.reshape %v2228 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2230 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2231 = stablehlo.reduce(%v2229 init: %v2230) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2232 = stablehlo.broadcast_in_dim %v2231, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2233 = stablehlo.subtract %v2229, %v2232 : tensor<256x197x197xf32>
    %v2234 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2235 = stablehlo.exponential %v2233 : tensor<256x197x197xf32>
    %v2236 = stablehlo.reduce(%v2235 init: %v2234) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2237 = stablehlo.broadcast_in_dim %v2236, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2238 = stablehlo.divide %v2235, %v2237 : tensor<256x197x197xf32>
    %v2239 = stablehlo.reshape %v2238 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2240 = stablehlo.reshape %v2239 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2241 = stablehlo.reshape %v2219 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2242 = stablehlo.dot_general %v2240, %v2241, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2243 = stablehlo.reshape %v2242 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2244 = stablehlo.reshape %v2243 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2245 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2246 = stablehlo.pad %v2244, %v2245, low = [0, 0, 320], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2247 = stablehlo.reshape %v2246 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2248 = stablehlo.add %v2210, %v2247 : tensor<256x75648xf32>
    %v2249 = stablehlo.reshape %v2248 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2250 = stablehlo.dot_general %v2249, %b6_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2251 = stablehlo.broadcast_in_dim %b6_bo, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2252 = stablehlo.add %v2250, %v2251 : tensor<256x197x384xf32>
    %v2253 = stablehlo.reshape %v2252 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2254 = stablehlo.add %v1978, %v2253 : tensor<256x75648xf32>
    %v2255 = stablehlo.reshape %v2254 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2256 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2257 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v2258 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v2259 = stablehlo.reduce(%v2255 init: %v2256) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2260 = stablehlo.broadcast_in_dim %v2259, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v2261 = stablehlo.divide %v2260, %v2257 : tensor<256x197x384xf32>
    %v2262 = stablehlo.subtract %v2255, %v2261 : tensor<256x197x384xf32>
    %v2263 = stablehlo.multiply %v2262, %v2262 : tensor<256x197x384xf32>
    %v2264 = stablehlo.reduce(%v2263 init: %v2256) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2265 = stablehlo.broadcast_in_dim %v2264, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v2266 = stablehlo.divide %v2265, %v2257 : tensor<256x197x384xf32>
    %v2267 = stablehlo.add %v2266, %v2258 : tensor<256x197x384xf32>
    %v2268 = stablehlo.rsqrt %v2267 : tensor<256x197x384xf32>
    %v2269 = stablehlo.multiply %v2262, %v2268 : tensor<256x197x384xf32>
    %v2270 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v2271 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v2272 = stablehlo.multiply %v2269, %v2270 : tensor<256x197x384xf32>
    %v2273 = stablehlo.add %v2272, %v2271 : tensor<256x197x384xf32>
    %v2274 = stablehlo.reshape %v2273 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2275 = stablehlo.reshape %v2274 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2276 = stablehlo.broadcast_in_dim %b6_g2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2277 = stablehlo.multiply %v2275, %v2276 : tensor<256x197x384xf32>
    %v2278 = stablehlo.reshape %v2277 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2279 = stablehlo.reshape %v2278 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2280 = stablehlo.broadcast_in_dim %b6_bt2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2281 = stablehlo.add %v2279, %v2280 : tensor<256x197x384xf32>
    %v2282 = stablehlo.reshape %v2281 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2283 = stablehlo.reshape %v2282 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2284 = stablehlo.dot_general %v2283, %b6_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x1536xf32>) -> tensor<256x197x1536xf32>
    %v2285 = stablehlo.broadcast_in_dim %b6_bfc1, dims = [2] : (tensor<1536xf32>) -> tensor<256x197x1536xf32>
    %v2286 = stablehlo.add %v2284, %v2285 : tensor<256x197x1536xf32>
    %v2287 = stablehlo.reshape %v2286 : (tensor<256x197x1536xf32>) -> tensor<256x302592xf32>
    %v2288 = stablehlo.multiply %v2287, %v2287 : tensor<256x302592xf32>
    %v2289 = stablehlo.multiply %v2288, %v2287 : tensor<256x302592xf32>
    %v2290 = stablehlo.constant dense<0.044715> : tensor<256x302592xf32>
    %v2291 = stablehlo.multiply %v2290, %v2289 : tensor<256x302592xf32>
    %v2292 = stablehlo.add %v2287, %v2291 : tensor<256x302592xf32>
    %v2293 = stablehlo.constant dense<0.7978845608028654> : tensor<256x302592xf32>
    %v2294 = stablehlo.multiply %v2293, %v2292 : tensor<256x302592xf32>
    %v2295 = stablehlo.tanh %v2294 : tensor<256x302592xf32>
    %v2296 = stablehlo.constant dense<1.0> : tensor<256x302592xf32>
    %v2297 = stablehlo.add %v2296, %v2295 : tensor<256x302592xf32>
    %v2298 = stablehlo.constant dense<0.5> : tensor<256x302592xf32>
    %v2299 = stablehlo.multiply %v2298, %v2287 : tensor<256x302592xf32>
    %v2300 = stablehlo.multiply %v2299, %v2297 : tensor<256x302592xf32>
    %v2301 = stablehlo.reshape %v2300 : (tensor<256x302592xf32>) -> tensor<256x197x1536xf32>
    %v2302 = stablehlo.dot_general %v2301, %b6_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x1536xf32>, tensor<1536x384xf32>) -> tensor<256x197x384xf32>
    %v2303 = stablehlo.broadcast_in_dim %b6_bfc2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2304 = stablehlo.add %v2302, %v2303 : tensor<256x197x384xf32>
    %v2305 = stablehlo.reshape %v2304 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2306 = stablehlo.add %v2254, %v2305 : tensor<256x75648xf32>
    %v2307 = stablehlo.reshape %v2306 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2308 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2309 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v2310 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v2311 = stablehlo.reduce(%v2307 init: %v2308) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2312 = stablehlo.broadcast_in_dim %v2311, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v2313 = stablehlo.divide %v2312, %v2309 : tensor<256x197x384xf32>
    %v2314 = stablehlo.subtract %v2307, %v2313 : tensor<256x197x384xf32>
    %v2315 = stablehlo.multiply %v2314, %v2314 : tensor<256x197x384xf32>
    %v2316 = stablehlo.reduce(%v2315 init: %v2308) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2317 = stablehlo.broadcast_in_dim %v2316, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v2318 = stablehlo.divide %v2317, %v2309 : tensor<256x197x384xf32>
    %v2319 = stablehlo.add %v2318, %v2310 : tensor<256x197x384xf32>
    %v2320 = stablehlo.rsqrt %v2319 : tensor<256x197x384xf32>
    %v2321 = stablehlo.multiply %v2314, %v2320 : tensor<256x197x384xf32>
    %v2322 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v2323 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v2324 = stablehlo.multiply %v2321, %v2322 : tensor<256x197x384xf32>
    %v2325 = stablehlo.add %v2324, %v2323 : tensor<256x197x384xf32>
    %v2326 = stablehlo.reshape %v2325 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2327 = stablehlo.reshape %v2326 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2328 = stablehlo.broadcast_in_dim %b7_g1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2329 = stablehlo.multiply %v2327, %v2328 : tensor<256x197x384xf32>
    %v2330 = stablehlo.reshape %v2329 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2331 = stablehlo.reshape %v2330 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2332 = stablehlo.broadcast_in_dim %b7_bt1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2333 = stablehlo.add %v2331, %v2332 : tensor<256x197x384xf32>
    %v2334 = stablehlo.reshape %v2333 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2335 = stablehlo.reshape %v2334 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2336 = stablehlo.dot_general %v2335, %b7_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2337 = stablehlo.broadcast_in_dim %b7_bq, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2338 = stablehlo.add %v2336, %v2337 : tensor<256x197x384xf32>
    %v2339 = stablehlo.reshape %v2338 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2340 = stablehlo.reshape %v2334 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2341 = stablehlo.dot_general %v2340, %b7_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2342 = stablehlo.broadcast_in_dim %b7_bk, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2343 = stablehlo.add %v2341, %v2342 : tensor<256x197x384xf32>
    %v2344 = stablehlo.reshape %v2343 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2345 = stablehlo.reshape %v2334 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2346 = stablehlo.dot_general %v2345, %b7_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2347 = stablehlo.broadcast_in_dim %b7_bv, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2348 = stablehlo.add %v2346, %v2347 : tensor<256x197x384xf32>
    %v2349 = stablehlo.reshape %v2348 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2350 = stablehlo.reshape %v2339 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2351 = stablehlo.slice %v2350 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2352 = stablehlo.reshape %v2351 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2353 = stablehlo.reshape %v2344 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2354 = stablehlo.slice %v2353 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2355 = stablehlo.reshape %v2354 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2356 = stablehlo.reshape %v2349 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2357 = stablehlo.slice %v2356 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2358 = stablehlo.reshape %v2357 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2359 = stablehlo.reshape %v2355 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2360 = stablehlo.transpose %v2359, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2361 = stablehlo.reshape %v2360 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2362 = stablehlo.reshape %v2352 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2363 = stablehlo.reshape %v2361 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2364 = stablehlo.dot_general %v2362, %v2363, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2365 = stablehlo.reshape %v2364 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2366 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2367 = stablehlo.multiply %v2365, %v2366 : tensor<256x38809xf32>
    %v2368 = stablehlo.reshape %v2367 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2369 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2370 = stablehlo.reduce(%v2368 init: %v2369) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2371 = stablehlo.broadcast_in_dim %v2370, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2372 = stablehlo.subtract %v2368, %v2371 : tensor<256x197x197xf32>
    %v2373 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2374 = stablehlo.exponential %v2372 : tensor<256x197x197xf32>
    %v2375 = stablehlo.reduce(%v2374 init: %v2373) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2376 = stablehlo.broadcast_in_dim %v2375, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2377 = stablehlo.divide %v2374, %v2376 : tensor<256x197x197xf32>
    %v2378 = stablehlo.reshape %v2377 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2379 = stablehlo.reshape %v2378 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2380 = stablehlo.reshape %v2358 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2381 = stablehlo.dot_general %v2379, %v2380, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2382 = stablehlo.reshape %v2381 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2383 = stablehlo.reshape %v2382 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2384 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2385 = stablehlo.pad %v2383, %v2384, low = [0, 0, 0], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2386 = stablehlo.reshape %v2385 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2387 = stablehlo.reshape %v2339 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2388 = stablehlo.slice %v2387 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2389 = stablehlo.reshape %v2388 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2390 = stablehlo.reshape %v2344 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2391 = stablehlo.slice %v2390 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2392 = stablehlo.reshape %v2391 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2393 = stablehlo.reshape %v2349 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2394 = stablehlo.slice %v2393 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2395 = stablehlo.reshape %v2394 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2396 = stablehlo.reshape %v2392 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2397 = stablehlo.transpose %v2396, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2398 = stablehlo.reshape %v2397 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2399 = stablehlo.reshape %v2389 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2400 = stablehlo.reshape %v2398 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2401 = stablehlo.dot_general %v2399, %v2400, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2402 = stablehlo.reshape %v2401 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2403 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2404 = stablehlo.multiply %v2402, %v2403 : tensor<256x38809xf32>
    %v2405 = stablehlo.reshape %v2404 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2406 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2407 = stablehlo.reduce(%v2405 init: %v2406) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2408 = stablehlo.broadcast_in_dim %v2407, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2409 = stablehlo.subtract %v2405, %v2408 : tensor<256x197x197xf32>
    %v2410 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2411 = stablehlo.exponential %v2409 : tensor<256x197x197xf32>
    %v2412 = stablehlo.reduce(%v2411 init: %v2410) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2413 = stablehlo.broadcast_in_dim %v2412, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2414 = stablehlo.divide %v2411, %v2413 : tensor<256x197x197xf32>
    %v2415 = stablehlo.reshape %v2414 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2416 = stablehlo.reshape %v2415 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2417 = stablehlo.reshape %v2395 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2418 = stablehlo.dot_general %v2416, %v2417, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2419 = stablehlo.reshape %v2418 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2420 = stablehlo.reshape %v2419 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2421 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2422 = stablehlo.pad %v2420, %v2421, low = [0, 0, 64], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2423 = stablehlo.reshape %v2422 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2424 = stablehlo.add %v2386, %v2423 : tensor<256x75648xf32>
    %v2425 = stablehlo.reshape %v2339 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2426 = stablehlo.slice %v2425 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2427 = stablehlo.reshape %v2426 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2428 = stablehlo.reshape %v2344 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2429 = stablehlo.slice %v2428 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2430 = stablehlo.reshape %v2429 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2431 = stablehlo.reshape %v2349 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2432 = stablehlo.slice %v2431 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2433 = stablehlo.reshape %v2432 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2434 = stablehlo.reshape %v2430 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2435 = stablehlo.transpose %v2434, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2436 = stablehlo.reshape %v2435 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2437 = stablehlo.reshape %v2427 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2438 = stablehlo.reshape %v2436 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2439 = stablehlo.dot_general %v2437, %v2438, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2440 = stablehlo.reshape %v2439 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2441 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2442 = stablehlo.multiply %v2440, %v2441 : tensor<256x38809xf32>
    %v2443 = stablehlo.reshape %v2442 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2444 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2445 = stablehlo.reduce(%v2443 init: %v2444) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2446 = stablehlo.broadcast_in_dim %v2445, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2447 = stablehlo.subtract %v2443, %v2446 : tensor<256x197x197xf32>
    %v2448 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2449 = stablehlo.exponential %v2447 : tensor<256x197x197xf32>
    %v2450 = stablehlo.reduce(%v2449 init: %v2448) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2451 = stablehlo.broadcast_in_dim %v2450, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2452 = stablehlo.divide %v2449, %v2451 : tensor<256x197x197xf32>
    %v2453 = stablehlo.reshape %v2452 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2454 = stablehlo.reshape %v2453 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2455 = stablehlo.reshape %v2433 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2456 = stablehlo.dot_general %v2454, %v2455, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2457 = stablehlo.reshape %v2456 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2458 = stablehlo.reshape %v2457 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2459 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2460 = stablehlo.pad %v2458, %v2459, low = [0, 0, 128], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2461 = stablehlo.reshape %v2460 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2462 = stablehlo.add %v2424, %v2461 : tensor<256x75648xf32>
    %v2463 = stablehlo.reshape %v2339 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2464 = stablehlo.slice %v2463 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2465 = stablehlo.reshape %v2464 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2466 = stablehlo.reshape %v2344 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2467 = stablehlo.slice %v2466 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2468 = stablehlo.reshape %v2467 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2469 = stablehlo.reshape %v2349 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2470 = stablehlo.slice %v2469 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2471 = stablehlo.reshape %v2470 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2472 = stablehlo.reshape %v2468 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2473 = stablehlo.transpose %v2472, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2474 = stablehlo.reshape %v2473 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2475 = stablehlo.reshape %v2465 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2476 = stablehlo.reshape %v2474 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2477 = stablehlo.dot_general %v2475, %v2476, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2478 = stablehlo.reshape %v2477 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2479 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2480 = stablehlo.multiply %v2478, %v2479 : tensor<256x38809xf32>
    %v2481 = stablehlo.reshape %v2480 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2482 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2483 = stablehlo.reduce(%v2481 init: %v2482) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2484 = stablehlo.broadcast_in_dim %v2483, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2485 = stablehlo.subtract %v2481, %v2484 : tensor<256x197x197xf32>
    %v2486 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2487 = stablehlo.exponential %v2485 : tensor<256x197x197xf32>
    %v2488 = stablehlo.reduce(%v2487 init: %v2486) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2489 = stablehlo.broadcast_in_dim %v2488, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2490 = stablehlo.divide %v2487, %v2489 : tensor<256x197x197xf32>
    %v2491 = stablehlo.reshape %v2490 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2492 = stablehlo.reshape %v2491 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2493 = stablehlo.reshape %v2471 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2494 = stablehlo.dot_general %v2492, %v2493, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2495 = stablehlo.reshape %v2494 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2496 = stablehlo.reshape %v2495 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2497 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2498 = stablehlo.pad %v2496, %v2497, low = [0, 0, 192], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2499 = stablehlo.reshape %v2498 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2500 = stablehlo.add %v2462, %v2499 : tensor<256x75648xf32>
    %v2501 = stablehlo.reshape %v2339 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2502 = stablehlo.slice %v2501 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2503 = stablehlo.reshape %v2502 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2504 = stablehlo.reshape %v2344 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2505 = stablehlo.slice %v2504 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2506 = stablehlo.reshape %v2505 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2507 = stablehlo.reshape %v2349 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2508 = stablehlo.slice %v2507 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2509 = stablehlo.reshape %v2508 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2510 = stablehlo.reshape %v2506 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2511 = stablehlo.transpose %v2510, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2512 = stablehlo.reshape %v2511 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2513 = stablehlo.reshape %v2503 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2514 = stablehlo.reshape %v2512 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2515 = stablehlo.dot_general %v2513, %v2514, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2516 = stablehlo.reshape %v2515 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2517 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2518 = stablehlo.multiply %v2516, %v2517 : tensor<256x38809xf32>
    %v2519 = stablehlo.reshape %v2518 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2520 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2521 = stablehlo.reduce(%v2519 init: %v2520) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2522 = stablehlo.broadcast_in_dim %v2521, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2523 = stablehlo.subtract %v2519, %v2522 : tensor<256x197x197xf32>
    %v2524 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2525 = stablehlo.exponential %v2523 : tensor<256x197x197xf32>
    %v2526 = stablehlo.reduce(%v2525 init: %v2524) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2527 = stablehlo.broadcast_in_dim %v2526, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2528 = stablehlo.divide %v2525, %v2527 : tensor<256x197x197xf32>
    %v2529 = stablehlo.reshape %v2528 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2530 = stablehlo.reshape %v2529 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2531 = stablehlo.reshape %v2509 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2532 = stablehlo.dot_general %v2530, %v2531, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2533 = stablehlo.reshape %v2532 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2534 = stablehlo.reshape %v2533 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2535 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2536 = stablehlo.pad %v2534, %v2535, low = [0, 0, 256], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2537 = stablehlo.reshape %v2536 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2538 = stablehlo.add %v2500, %v2537 : tensor<256x75648xf32>
    %v2539 = stablehlo.reshape %v2339 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2540 = stablehlo.slice %v2539 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2541 = stablehlo.reshape %v2540 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2542 = stablehlo.reshape %v2344 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2543 = stablehlo.slice %v2542 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2544 = stablehlo.reshape %v2543 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2545 = stablehlo.reshape %v2349 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2546 = stablehlo.slice %v2545 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2547 = stablehlo.reshape %v2546 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2548 = stablehlo.reshape %v2544 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2549 = stablehlo.transpose %v2548, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2550 = stablehlo.reshape %v2549 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2551 = stablehlo.reshape %v2541 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2552 = stablehlo.reshape %v2550 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2553 = stablehlo.dot_general %v2551, %v2552, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2554 = stablehlo.reshape %v2553 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2555 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2556 = stablehlo.multiply %v2554, %v2555 : tensor<256x38809xf32>
    %v2557 = stablehlo.reshape %v2556 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2558 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2559 = stablehlo.reduce(%v2557 init: %v2558) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2560 = stablehlo.broadcast_in_dim %v2559, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2561 = stablehlo.subtract %v2557, %v2560 : tensor<256x197x197xf32>
    %v2562 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2563 = stablehlo.exponential %v2561 : tensor<256x197x197xf32>
    %v2564 = stablehlo.reduce(%v2563 init: %v2562) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2565 = stablehlo.broadcast_in_dim %v2564, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2566 = stablehlo.divide %v2563, %v2565 : tensor<256x197x197xf32>
    %v2567 = stablehlo.reshape %v2566 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2568 = stablehlo.reshape %v2567 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2569 = stablehlo.reshape %v2547 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2570 = stablehlo.dot_general %v2568, %v2569, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2571 = stablehlo.reshape %v2570 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2572 = stablehlo.reshape %v2571 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2573 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2574 = stablehlo.pad %v2572, %v2573, low = [0, 0, 320], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2575 = stablehlo.reshape %v2574 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2576 = stablehlo.add %v2538, %v2575 : tensor<256x75648xf32>
    %v2577 = stablehlo.reshape %v2576 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2578 = stablehlo.dot_general %v2577, %b7_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2579 = stablehlo.broadcast_in_dim %b7_bo, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2580 = stablehlo.add %v2578, %v2579 : tensor<256x197x384xf32>
    %v2581 = stablehlo.reshape %v2580 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2582 = stablehlo.add %v2306, %v2581 : tensor<256x75648xf32>
    %v2583 = stablehlo.reshape %v2582 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2584 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2585 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v2586 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v2587 = stablehlo.reduce(%v2583 init: %v2584) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2588 = stablehlo.broadcast_in_dim %v2587, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v2589 = stablehlo.divide %v2588, %v2585 : tensor<256x197x384xf32>
    %v2590 = stablehlo.subtract %v2583, %v2589 : tensor<256x197x384xf32>
    %v2591 = stablehlo.multiply %v2590, %v2590 : tensor<256x197x384xf32>
    %v2592 = stablehlo.reduce(%v2591 init: %v2584) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2593 = stablehlo.broadcast_in_dim %v2592, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v2594 = stablehlo.divide %v2593, %v2585 : tensor<256x197x384xf32>
    %v2595 = stablehlo.add %v2594, %v2586 : tensor<256x197x384xf32>
    %v2596 = stablehlo.rsqrt %v2595 : tensor<256x197x384xf32>
    %v2597 = stablehlo.multiply %v2590, %v2596 : tensor<256x197x384xf32>
    %v2598 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v2599 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v2600 = stablehlo.multiply %v2597, %v2598 : tensor<256x197x384xf32>
    %v2601 = stablehlo.add %v2600, %v2599 : tensor<256x197x384xf32>
    %v2602 = stablehlo.reshape %v2601 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2603 = stablehlo.reshape %v2602 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2604 = stablehlo.broadcast_in_dim %b7_g2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2605 = stablehlo.multiply %v2603, %v2604 : tensor<256x197x384xf32>
    %v2606 = stablehlo.reshape %v2605 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2607 = stablehlo.reshape %v2606 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2608 = stablehlo.broadcast_in_dim %b7_bt2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2609 = stablehlo.add %v2607, %v2608 : tensor<256x197x384xf32>
    %v2610 = stablehlo.reshape %v2609 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2611 = stablehlo.reshape %v2610 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2612 = stablehlo.dot_general %v2611, %b7_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x1536xf32>) -> tensor<256x197x1536xf32>
    %v2613 = stablehlo.broadcast_in_dim %b7_bfc1, dims = [2] : (tensor<1536xf32>) -> tensor<256x197x1536xf32>
    %v2614 = stablehlo.add %v2612, %v2613 : tensor<256x197x1536xf32>
    %v2615 = stablehlo.reshape %v2614 : (tensor<256x197x1536xf32>) -> tensor<256x302592xf32>
    %v2616 = stablehlo.multiply %v2615, %v2615 : tensor<256x302592xf32>
    %v2617 = stablehlo.multiply %v2616, %v2615 : tensor<256x302592xf32>
    %v2618 = stablehlo.constant dense<0.044715> : tensor<256x302592xf32>
    %v2619 = stablehlo.multiply %v2618, %v2617 : tensor<256x302592xf32>
    %v2620 = stablehlo.add %v2615, %v2619 : tensor<256x302592xf32>
    %v2621 = stablehlo.constant dense<0.7978845608028654> : tensor<256x302592xf32>
    %v2622 = stablehlo.multiply %v2621, %v2620 : tensor<256x302592xf32>
    %v2623 = stablehlo.tanh %v2622 : tensor<256x302592xf32>
    %v2624 = stablehlo.constant dense<1.0> : tensor<256x302592xf32>
    %v2625 = stablehlo.add %v2624, %v2623 : tensor<256x302592xf32>
    %v2626 = stablehlo.constant dense<0.5> : tensor<256x302592xf32>
    %v2627 = stablehlo.multiply %v2626, %v2615 : tensor<256x302592xf32>
    %v2628 = stablehlo.multiply %v2627, %v2625 : tensor<256x302592xf32>
    %v2629 = stablehlo.reshape %v2628 : (tensor<256x302592xf32>) -> tensor<256x197x1536xf32>
    %v2630 = stablehlo.dot_general %v2629, %b7_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x1536xf32>, tensor<1536x384xf32>) -> tensor<256x197x384xf32>
    %v2631 = stablehlo.broadcast_in_dim %b7_bfc2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2632 = stablehlo.add %v2630, %v2631 : tensor<256x197x384xf32>
    %v2633 = stablehlo.reshape %v2632 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2634 = stablehlo.add %v2582, %v2633 : tensor<256x75648xf32>
    %v2635 = stablehlo.reshape %v2634 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2636 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2637 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v2638 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v2639 = stablehlo.reduce(%v2635 init: %v2636) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2640 = stablehlo.broadcast_in_dim %v2639, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v2641 = stablehlo.divide %v2640, %v2637 : tensor<256x197x384xf32>
    %v2642 = stablehlo.subtract %v2635, %v2641 : tensor<256x197x384xf32>
    %v2643 = stablehlo.multiply %v2642, %v2642 : tensor<256x197x384xf32>
    %v2644 = stablehlo.reduce(%v2643 init: %v2636) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2645 = stablehlo.broadcast_in_dim %v2644, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v2646 = stablehlo.divide %v2645, %v2637 : tensor<256x197x384xf32>
    %v2647 = stablehlo.add %v2646, %v2638 : tensor<256x197x384xf32>
    %v2648 = stablehlo.rsqrt %v2647 : tensor<256x197x384xf32>
    %v2649 = stablehlo.multiply %v2642, %v2648 : tensor<256x197x384xf32>
    %v2650 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v2651 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v2652 = stablehlo.multiply %v2649, %v2650 : tensor<256x197x384xf32>
    %v2653 = stablehlo.add %v2652, %v2651 : tensor<256x197x384xf32>
    %v2654 = stablehlo.reshape %v2653 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2655 = stablehlo.reshape %v2654 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2656 = stablehlo.broadcast_in_dim %b8_g1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2657 = stablehlo.multiply %v2655, %v2656 : tensor<256x197x384xf32>
    %v2658 = stablehlo.reshape %v2657 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2659 = stablehlo.reshape %v2658 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2660 = stablehlo.broadcast_in_dim %b8_bt1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2661 = stablehlo.add %v2659, %v2660 : tensor<256x197x384xf32>
    %v2662 = stablehlo.reshape %v2661 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2663 = stablehlo.reshape %v2662 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2664 = stablehlo.dot_general %v2663, %b8_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2665 = stablehlo.broadcast_in_dim %b8_bq, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2666 = stablehlo.add %v2664, %v2665 : tensor<256x197x384xf32>
    %v2667 = stablehlo.reshape %v2666 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2668 = stablehlo.reshape %v2662 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2669 = stablehlo.dot_general %v2668, %b8_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2670 = stablehlo.broadcast_in_dim %b8_bk, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2671 = stablehlo.add %v2669, %v2670 : tensor<256x197x384xf32>
    %v2672 = stablehlo.reshape %v2671 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2673 = stablehlo.reshape %v2662 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2674 = stablehlo.dot_general %v2673, %b8_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2675 = stablehlo.broadcast_in_dim %b8_bv, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2676 = stablehlo.add %v2674, %v2675 : tensor<256x197x384xf32>
    %v2677 = stablehlo.reshape %v2676 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2678 = stablehlo.reshape %v2667 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2679 = stablehlo.slice %v2678 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2680 = stablehlo.reshape %v2679 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2681 = stablehlo.reshape %v2672 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2682 = stablehlo.slice %v2681 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2683 = stablehlo.reshape %v2682 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2684 = stablehlo.reshape %v2677 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2685 = stablehlo.slice %v2684 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2686 = stablehlo.reshape %v2685 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2687 = stablehlo.reshape %v2683 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2688 = stablehlo.transpose %v2687, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2689 = stablehlo.reshape %v2688 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2690 = stablehlo.reshape %v2680 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2691 = stablehlo.reshape %v2689 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2692 = stablehlo.dot_general %v2690, %v2691, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2693 = stablehlo.reshape %v2692 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2694 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2695 = stablehlo.multiply %v2693, %v2694 : tensor<256x38809xf32>
    %v2696 = stablehlo.reshape %v2695 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2697 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2698 = stablehlo.reduce(%v2696 init: %v2697) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2699 = stablehlo.broadcast_in_dim %v2698, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2700 = stablehlo.subtract %v2696, %v2699 : tensor<256x197x197xf32>
    %v2701 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2702 = stablehlo.exponential %v2700 : tensor<256x197x197xf32>
    %v2703 = stablehlo.reduce(%v2702 init: %v2701) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2704 = stablehlo.broadcast_in_dim %v2703, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2705 = stablehlo.divide %v2702, %v2704 : tensor<256x197x197xf32>
    %v2706 = stablehlo.reshape %v2705 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2707 = stablehlo.reshape %v2706 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2708 = stablehlo.reshape %v2686 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2709 = stablehlo.dot_general %v2707, %v2708, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2710 = stablehlo.reshape %v2709 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2711 = stablehlo.reshape %v2710 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2712 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2713 = stablehlo.pad %v2711, %v2712, low = [0, 0, 0], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2714 = stablehlo.reshape %v2713 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2715 = stablehlo.reshape %v2667 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2716 = stablehlo.slice %v2715 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2717 = stablehlo.reshape %v2716 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2718 = stablehlo.reshape %v2672 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2719 = stablehlo.slice %v2718 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2720 = stablehlo.reshape %v2719 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2721 = stablehlo.reshape %v2677 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2722 = stablehlo.slice %v2721 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2723 = stablehlo.reshape %v2722 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2724 = stablehlo.reshape %v2720 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2725 = stablehlo.transpose %v2724, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2726 = stablehlo.reshape %v2725 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2727 = stablehlo.reshape %v2717 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2728 = stablehlo.reshape %v2726 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2729 = stablehlo.dot_general %v2727, %v2728, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2730 = stablehlo.reshape %v2729 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2731 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2732 = stablehlo.multiply %v2730, %v2731 : tensor<256x38809xf32>
    %v2733 = stablehlo.reshape %v2732 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2734 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2735 = stablehlo.reduce(%v2733 init: %v2734) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2736 = stablehlo.broadcast_in_dim %v2735, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2737 = stablehlo.subtract %v2733, %v2736 : tensor<256x197x197xf32>
    %v2738 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2739 = stablehlo.exponential %v2737 : tensor<256x197x197xf32>
    %v2740 = stablehlo.reduce(%v2739 init: %v2738) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2741 = stablehlo.broadcast_in_dim %v2740, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2742 = stablehlo.divide %v2739, %v2741 : tensor<256x197x197xf32>
    %v2743 = stablehlo.reshape %v2742 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2744 = stablehlo.reshape %v2743 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2745 = stablehlo.reshape %v2723 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2746 = stablehlo.dot_general %v2744, %v2745, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2747 = stablehlo.reshape %v2746 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2748 = stablehlo.reshape %v2747 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2749 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2750 = stablehlo.pad %v2748, %v2749, low = [0, 0, 64], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2751 = stablehlo.reshape %v2750 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2752 = stablehlo.add %v2714, %v2751 : tensor<256x75648xf32>
    %v2753 = stablehlo.reshape %v2667 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2754 = stablehlo.slice %v2753 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2755 = stablehlo.reshape %v2754 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2756 = stablehlo.reshape %v2672 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2757 = stablehlo.slice %v2756 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2758 = stablehlo.reshape %v2757 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2759 = stablehlo.reshape %v2677 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2760 = stablehlo.slice %v2759 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2761 = stablehlo.reshape %v2760 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2762 = stablehlo.reshape %v2758 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2763 = stablehlo.transpose %v2762, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2764 = stablehlo.reshape %v2763 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2765 = stablehlo.reshape %v2755 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2766 = stablehlo.reshape %v2764 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2767 = stablehlo.dot_general %v2765, %v2766, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2768 = stablehlo.reshape %v2767 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2769 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2770 = stablehlo.multiply %v2768, %v2769 : tensor<256x38809xf32>
    %v2771 = stablehlo.reshape %v2770 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2772 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2773 = stablehlo.reduce(%v2771 init: %v2772) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2774 = stablehlo.broadcast_in_dim %v2773, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2775 = stablehlo.subtract %v2771, %v2774 : tensor<256x197x197xf32>
    %v2776 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2777 = stablehlo.exponential %v2775 : tensor<256x197x197xf32>
    %v2778 = stablehlo.reduce(%v2777 init: %v2776) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2779 = stablehlo.broadcast_in_dim %v2778, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2780 = stablehlo.divide %v2777, %v2779 : tensor<256x197x197xf32>
    %v2781 = stablehlo.reshape %v2780 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2782 = stablehlo.reshape %v2781 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2783 = stablehlo.reshape %v2761 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2784 = stablehlo.dot_general %v2782, %v2783, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2785 = stablehlo.reshape %v2784 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2786 = stablehlo.reshape %v2785 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2787 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2788 = stablehlo.pad %v2786, %v2787, low = [0, 0, 128], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2789 = stablehlo.reshape %v2788 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2790 = stablehlo.add %v2752, %v2789 : tensor<256x75648xf32>
    %v2791 = stablehlo.reshape %v2667 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2792 = stablehlo.slice %v2791 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2793 = stablehlo.reshape %v2792 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2794 = stablehlo.reshape %v2672 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2795 = stablehlo.slice %v2794 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2796 = stablehlo.reshape %v2795 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2797 = stablehlo.reshape %v2677 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2798 = stablehlo.slice %v2797 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2799 = stablehlo.reshape %v2798 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2800 = stablehlo.reshape %v2796 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2801 = stablehlo.transpose %v2800, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2802 = stablehlo.reshape %v2801 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2803 = stablehlo.reshape %v2793 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2804 = stablehlo.reshape %v2802 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2805 = stablehlo.dot_general %v2803, %v2804, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2806 = stablehlo.reshape %v2805 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2807 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2808 = stablehlo.multiply %v2806, %v2807 : tensor<256x38809xf32>
    %v2809 = stablehlo.reshape %v2808 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2810 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2811 = stablehlo.reduce(%v2809 init: %v2810) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2812 = stablehlo.broadcast_in_dim %v2811, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2813 = stablehlo.subtract %v2809, %v2812 : tensor<256x197x197xf32>
    %v2814 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2815 = stablehlo.exponential %v2813 : tensor<256x197x197xf32>
    %v2816 = stablehlo.reduce(%v2815 init: %v2814) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2817 = stablehlo.broadcast_in_dim %v2816, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2818 = stablehlo.divide %v2815, %v2817 : tensor<256x197x197xf32>
    %v2819 = stablehlo.reshape %v2818 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2820 = stablehlo.reshape %v2819 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2821 = stablehlo.reshape %v2799 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2822 = stablehlo.dot_general %v2820, %v2821, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2823 = stablehlo.reshape %v2822 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2824 = stablehlo.reshape %v2823 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2825 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2826 = stablehlo.pad %v2824, %v2825, low = [0, 0, 192], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2827 = stablehlo.reshape %v2826 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2828 = stablehlo.add %v2790, %v2827 : tensor<256x75648xf32>
    %v2829 = stablehlo.reshape %v2667 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2830 = stablehlo.slice %v2829 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2831 = stablehlo.reshape %v2830 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2832 = stablehlo.reshape %v2672 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2833 = stablehlo.slice %v2832 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2834 = stablehlo.reshape %v2833 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2835 = stablehlo.reshape %v2677 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2836 = stablehlo.slice %v2835 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2837 = stablehlo.reshape %v2836 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2838 = stablehlo.reshape %v2834 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2839 = stablehlo.transpose %v2838, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2840 = stablehlo.reshape %v2839 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2841 = stablehlo.reshape %v2831 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2842 = stablehlo.reshape %v2840 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2843 = stablehlo.dot_general %v2841, %v2842, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2844 = stablehlo.reshape %v2843 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2845 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2846 = stablehlo.multiply %v2844, %v2845 : tensor<256x38809xf32>
    %v2847 = stablehlo.reshape %v2846 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2848 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2849 = stablehlo.reduce(%v2847 init: %v2848) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2850 = stablehlo.broadcast_in_dim %v2849, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2851 = stablehlo.subtract %v2847, %v2850 : tensor<256x197x197xf32>
    %v2852 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2853 = stablehlo.exponential %v2851 : tensor<256x197x197xf32>
    %v2854 = stablehlo.reduce(%v2853 init: %v2852) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2855 = stablehlo.broadcast_in_dim %v2854, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2856 = stablehlo.divide %v2853, %v2855 : tensor<256x197x197xf32>
    %v2857 = stablehlo.reshape %v2856 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2858 = stablehlo.reshape %v2857 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2859 = stablehlo.reshape %v2837 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2860 = stablehlo.dot_general %v2858, %v2859, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2861 = stablehlo.reshape %v2860 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2862 = stablehlo.reshape %v2861 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2863 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2864 = stablehlo.pad %v2862, %v2863, low = [0, 0, 256], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2865 = stablehlo.reshape %v2864 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2866 = stablehlo.add %v2828, %v2865 : tensor<256x75648xf32>
    %v2867 = stablehlo.reshape %v2667 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2868 = stablehlo.slice %v2867 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2869 = stablehlo.reshape %v2868 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2870 = stablehlo.reshape %v2672 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2871 = stablehlo.slice %v2870 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2872 = stablehlo.reshape %v2871 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2873 = stablehlo.reshape %v2677 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2874 = stablehlo.slice %v2873 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v2875 = stablehlo.reshape %v2874 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2876 = stablehlo.reshape %v2872 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2877 = stablehlo.transpose %v2876, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2878 = stablehlo.reshape %v2877 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2879 = stablehlo.reshape %v2869 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2880 = stablehlo.reshape %v2878 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2881 = stablehlo.dot_general %v2879, %v2880, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2882 = stablehlo.reshape %v2881 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2883 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2884 = stablehlo.multiply %v2882, %v2883 : tensor<256x38809xf32>
    %v2885 = stablehlo.reshape %v2884 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2886 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2887 = stablehlo.reduce(%v2885 init: %v2886) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2888 = stablehlo.broadcast_in_dim %v2887, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2889 = stablehlo.subtract %v2885, %v2888 : tensor<256x197x197xf32>
    %v2890 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2891 = stablehlo.exponential %v2889 : tensor<256x197x197xf32>
    %v2892 = stablehlo.reduce(%v2891 init: %v2890) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2893 = stablehlo.broadcast_in_dim %v2892, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2894 = stablehlo.divide %v2891, %v2893 : tensor<256x197x197xf32>
    %v2895 = stablehlo.reshape %v2894 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2896 = stablehlo.reshape %v2895 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2897 = stablehlo.reshape %v2875 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2898 = stablehlo.dot_general %v2896, %v2897, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2899 = stablehlo.reshape %v2898 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2900 = stablehlo.reshape %v2899 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2901 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2902 = stablehlo.pad %v2900, %v2901, low = [0, 0, 320], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v2903 = stablehlo.reshape %v2902 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2904 = stablehlo.add %v2866, %v2903 : tensor<256x75648xf32>
    %v2905 = stablehlo.reshape %v2904 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2906 = stablehlo.dot_general %v2905, %b8_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2907 = stablehlo.broadcast_in_dim %b8_bo, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2908 = stablehlo.add %v2906, %v2907 : tensor<256x197x384xf32>
    %v2909 = stablehlo.reshape %v2908 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2910 = stablehlo.add %v2634, %v2909 : tensor<256x75648xf32>
    %v2911 = stablehlo.reshape %v2910 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2912 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2913 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v2914 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v2915 = stablehlo.reduce(%v2911 init: %v2912) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2916 = stablehlo.broadcast_in_dim %v2915, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v2917 = stablehlo.divide %v2916, %v2913 : tensor<256x197x384xf32>
    %v2918 = stablehlo.subtract %v2911, %v2917 : tensor<256x197x384xf32>
    %v2919 = stablehlo.multiply %v2918, %v2918 : tensor<256x197x384xf32>
    %v2920 = stablehlo.reduce(%v2919 init: %v2912) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2921 = stablehlo.broadcast_in_dim %v2920, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v2922 = stablehlo.divide %v2921, %v2913 : tensor<256x197x384xf32>
    %v2923 = stablehlo.add %v2922, %v2914 : tensor<256x197x384xf32>
    %v2924 = stablehlo.rsqrt %v2923 : tensor<256x197x384xf32>
    %v2925 = stablehlo.multiply %v2918, %v2924 : tensor<256x197x384xf32>
    %v2926 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v2927 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v2928 = stablehlo.multiply %v2925, %v2926 : tensor<256x197x384xf32>
    %v2929 = stablehlo.add %v2928, %v2927 : tensor<256x197x384xf32>
    %v2930 = stablehlo.reshape %v2929 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2931 = stablehlo.reshape %v2930 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2932 = stablehlo.broadcast_in_dim %b8_g2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2933 = stablehlo.multiply %v2931, %v2932 : tensor<256x197x384xf32>
    %v2934 = stablehlo.reshape %v2933 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2935 = stablehlo.reshape %v2934 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2936 = stablehlo.broadcast_in_dim %b8_bt2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2937 = stablehlo.add %v2935, %v2936 : tensor<256x197x384xf32>
    %v2938 = stablehlo.reshape %v2937 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2939 = stablehlo.reshape %v2938 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2940 = stablehlo.dot_general %v2939, %b8_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x1536xf32>) -> tensor<256x197x1536xf32>
    %v2941 = stablehlo.broadcast_in_dim %b8_bfc1, dims = [2] : (tensor<1536xf32>) -> tensor<256x197x1536xf32>
    %v2942 = stablehlo.add %v2940, %v2941 : tensor<256x197x1536xf32>
    %v2943 = stablehlo.reshape %v2942 : (tensor<256x197x1536xf32>) -> tensor<256x302592xf32>
    %v2944 = stablehlo.multiply %v2943, %v2943 : tensor<256x302592xf32>
    %v2945 = stablehlo.multiply %v2944, %v2943 : tensor<256x302592xf32>
    %v2946 = stablehlo.constant dense<0.044715> : tensor<256x302592xf32>
    %v2947 = stablehlo.multiply %v2946, %v2945 : tensor<256x302592xf32>
    %v2948 = stablehlo.add %v2943, %v2947 : tensor<256x302592xf32>
    %v2949 = stablehlo.constant dense<0.7978845608028654> : tensor<256x302592xf32>
    %v2950 = stablehlo.multiply %v2949, %v2948 : tensor<256x302592xf32>
    %v2951 = stablehlo.tanh %v2950 : tensor<256x302592xf32>
    %v2952 = stablehlo.constant dense<1.0> : tensor<256x302592xf32>
    %v2953 = stablehlo.add %v2952, %v2951 : tensor<256x302592xf32>
    %v2954 = stablehlo.constant dense<0.5> : tensor<256x302592xf32>
    %v2955 = stablehlo.multiply %v2954, %v2943 : tensor<256x302592xf32>
    %v2956 = stablehlo.multiply %v2955, %v2953 : tensor<256x302592xf32>
    %v2957 = stablehlo.reshape %v2956 : (tensor<256x302592xf32>) -> tensor<256x197x1536xf32>
    %v2958 = stablehlo.dot_general %v2957, %b8_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x1536xf32>, tensor<1536x384xf32>) -> tensor<256x197x384xf32>
    %v2959 = stablehlo.broadcast_in_dim %b8_bfc2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2960 = stablehlo.add %v2958, %v2959 : tensor<256x197x384xf32>
    %v2961 = stablehlo.reshape %v2960 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2962 = stablehlo.add %v2910, %v2961 : tensor<256x75648xf32>
    %v2963 = stablehlo.reshape %v2962 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2964 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2965 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v2966 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v2967 = stablehlo.reduce(%v2963 init: %v2964) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2968 = stablehlo.broadcast_in_dim %v2967, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v2969 = stablehlo.divide %v2968, %v2965 : tensor<256x197x384xf32>
    %v2970 = stablehlo.subtract %v2963, %v2969 : tensor<256x197x384xf32>
    %v2971 = stablehlo.multiply %v2970, %v2970 : tensor<256x197x384xf32>
    %v2972 = stablehlo.reduce(%v2971 init: %v2964) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2973 = stablehlo.broadcast_in_dim %v2972, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v2974 = stablehlo.divide %v2973, %v2965 : tensor<256x197x384xf32>
    %v2975 = stablehlo.add %v2974, %v2966 : tensor<256x197x384xf32>
    %v2976 = stablehlo.rsqrt %v2975 : tensor<256x197x384xf32>
    %v2977 = stablehlo.multiply %v2970, %v2976 : tensor<256x197x384xf32>
    %v2978 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v2979 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v2980 = stablehlo.multiply %v2977, %v2978 : tensor<256x197x384xf32>
    %v2981 = stablehlo.add %v2980, %v2979 : tensor<256x197x384xf32>
    %v2982 = stablehlo.reshape %v2981 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2983 = stablehlo.reshape %v2982 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2984 = stablehlo.broadcast_in_dim %b9_g1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2985 = stablehlo.multiply %v2983, %v2984 : tensor<256x197x384xf32>
    %v2986 = stablehlo.reshape %v2985 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2987 = stablehlo.reshape %v2986 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2988 = stablehlo.broadcast_in_dim %b9_bt1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2989 = stablehlo.add %v2987, %v2988 : tensor<256x197x384xf32>
    %v2990 = stablehlo.reshape %v2989 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2991 = stablehlo.reshape %v2990 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2992 = stablehlo.dot_general %v2991, %b9_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2993 = stablehlo.broadcast_in_dim %b9_bq, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2994 = stablehlo.add %v2992, %v2993 : tensor<256x197x384xf32>
    %v2995 = stablehlo.reshape %v2994 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v2996 = stablehlo.reshape %v2990 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v2997 = stablehlo.dot_general %v2996, %b9_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v2998 = stablehlo.broadcast_in_dim %b9_bk, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v2999 = stablehlo.add %v2997, %v2998 : tensor<256x197x384xf32>
    %v3000 = stablehlo.reshape %v2999 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3001 = stablehlo.reshape %v2990 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3002 = stablehlo.dot_general %v3001, %b9_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v3003 = stablehlo.broadcast_in_dim %b9_bv, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3004 = stablehlo.add %v3002, %v3003 : tensor<256x197x384xf32>
    %v3005 = stablehlo.reshape %v3004 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3006 = stablehlo.reshape %v2995 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3007 = stablehlo.slice %v3006 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3008 = stablehlo.reshape %v3007 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3009 = stablehlo.reshape %v3000 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3010 = stablehlo.slice %v3009 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3011 = stablehlo.reshape %v3010 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3012 = stablehlo.reshape %v3005 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3013 = stablehlo.slice %v3012 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3014 = stablehlo.reshape %v3013 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3015 = stablehlo.reshape %v3011 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3016 = stablehlo.transpose %v3015, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3017 = stablehlo.reshape %v3016 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3018 = stablehlo.reshape %v3008 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3019 = stablehlo.reshape %v3017 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3020 = stablehlo.dot_general %v3018, %v3019, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3021 = stablehlo.reshape %v3020 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3022 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3023 = stablehlo.multiply %v3021, %v3022 : tensor<256x38809xf32>
    %v3024 = stablehlo.reshape %v3023 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3025 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3026 = stablehlo.reduce(%v3024 init: %v3025) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3027 = stablehlo.broadcast_in_dim %v3026, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3028 = stablehlo.subtract %v3024, %v3027 : tensor<256x197x197xf32>
    %v3029 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3030 = stablehlo.exponential %v3028 : tensor<256x197x197xf32>
    %v3031 = stablehlo.reduce(%v3030 init: %v3029) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3032 = stablehlo.broadcast_in_dim %v3031, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3033 = stablehlo.divide %v3030, %v3032 : tensor<256x197x197xf32>
    %v3034 = stablehlo.reshape %v3033 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3035 = stablehlo.reshape %v3034 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3036 = stablehlo.reshape %v3014 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3037 = stablehlo.dot_general %v3035, %v3036, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3038 = stablehlo.reshape %v3037 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3039 = stablehlo.reshape %v3038 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3040 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3041 = stablehlo.pad %v3039, %v3040, low = [0, 0, 0], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3042 = stablehlo.reshape %v3041 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3043 = stablehlo.reshape %v2995 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3044 = stablehlo.slice %v3043 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3045 = stablehlo.reshape %v3044 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3046 = stablehlo.reshape %v3000 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3047 = stablehlo.slice %v3046 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3048 = stablehlo.reshape %v3047 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3049 = stablehlo.reshape %v3005 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3050 = stablehlo.slice %v3049 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3051 = stablehlo.reshape %v3050 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3052 = stablehlo.reshape %v3048 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3053 = stablehlo.transpose %v3052, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3054 = stablehlo.reshape %v3053 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3055 = stablehlo.reshape %v3045 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3056 = stablehlo.reshape %v3054 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3057 = stablehlo.dot_general %v3055, %v3056, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3058 = stablehlo.reshape %v3057 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3059 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3060 = stablehlo.multiply %v3058, %v3059 : tensor<256x38809xf32>
    %v3061 = stablehlo.reshape %v3060 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3062 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3063 = stablehlo.reduce(%v3061 init: %v3062) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3064 = stablehlo.broadcast_in_dim %v3063, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3065 = stablehlo.subtract %v3061, %v3064 : tensor<256x197x197xf32>
    %v3066 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3067 = stablehlo.exponential %v3065 : tensor<256x197x197xf32>
    %v3068 = stablehlo.reduce(%v3067 init: %v3066) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3069 = stablehlo.broadcast_in_dim %v3068, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3070 = stablehlo.divide %v3067, %v3069 : tensor<256x197x197xf32>
    %v3071 = stablehlo.reshape %v3070 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3072 = stablehlo.reshape %v3071 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3073 = stablehlo.reshape %v3051 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3074 = stablehlo.dot_general %v3072, %v3073, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3075 = stablehlo.reshape %v3074 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3076 = stablehlo.reshape %v3075 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3077 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3078 = stablehlo.pad %v3076, %v3077, low = [0, 0, 64], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3079 = stablehlo.reshape %v3078 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3080 = stablehlo.add %v3042, %v3079 : tensor<256x75648xf32>
    %v3081 = stablehlo.reshape %v2995 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3082 = stablehlo.slice %v3081 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3083 = stablehlo.reshape %v3082 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3084 = stablehlo.reshape %v3000 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3085 = stablehlo.slice %v3084 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3086 = stablehlo.reshape %v3085 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3087 = stablehlo.reshape %v3005 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3088 = stablehlo.slice %v3087 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3089 = stablehlo.reshape %v3088 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3090 = stablehlo.reshape %v3086 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3091 = stablehlo.transpose %v3090, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3092 = stablehlo.reshape %v3091 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3093 = stablehlo.reshape %v3083 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3094 = stablehlo.reshape %v3092 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3095 = stablehlo.dot_general %v3093, %v3094, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3096 = stablehlo.reshape %v3095 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3097 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3098 = stablehlo.multiply %v3096, %v3097 : tensor<256x38809xf32>
    %v3099 = stablehlo.reshape %v3098 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3100 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3101 = stablehlo.reduce(%v3099 init: %v3100) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3102 = stablehlo.broadcast_in_dim %v3101, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3103 = stablehlo.subtract %v3099, %v3102 : tensor<256x197x197xf32>
    %v3104 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3105 = stablehlo.exponential %v3103 : tensor<256x197x197xf32>
    %v3106 = stablehlo.reduce(%v3105 init: %v3104) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3107 = stablehlo.broadcast_in_dim %v3106, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3108 = stablehlo.divide %v3105, %v3107 : tensor<256x197x197xf32>
    %v3109 = stablehlo.reshape %v3108 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3110 = stablehlo.reshape %v3109 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3111 = stablehlo.reshape %v3089 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3112 = stablehlo.dot_general %v3110, %v3111, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3113 = stablehlo.reshape %v3112 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3114 = stablehlo.reshape %v3113 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3115 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3116 = stablehlo.pad %v3114, %v3115, low = [0, 0, 128], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3117 = stablehlo.reshape %v3116 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3118 = stablehlo.add %v3080, %v3117 : tensor<256x75648xf32>
    %v3119 = stablehlo.reshape %v2995 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3120 = stablehlo.slice %v3119 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3121 = stablehlo.reshape %v3120 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3122 = stablehlo.reshape %v3000 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3123 = stablehlo.slice %v3122 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3124 = stablehlo.reshape %v3123 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3125 = stablehlo.reshape %v3005 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3126 = stablehlo.slice %v3125 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3127 = stablehlo.reshape %v3126 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3128 = stablehlo.reshape %v3124 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3129 = stablehlo.transpose %v3128, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3130 = stablehlo.reshape %v3129 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3131 = stablehlo.reshape %v3121 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3132 = stablehlo.reshape %v3130 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3133 = stablehlo.dot_general %v3131, %v3132, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3134 = stablehlo.reshape %v3133 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3135 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3136 = stablehlo.multiply %v3134, %v3135 : tensor<256x38809xf32>
    %v3137 = stablehlo.reshape %v3136 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3138 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3139 = stablehlo.reduce(%v3137 init: %v3138) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3140 = stablehlo.broadcast_in_dim %v3139, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3141 = stablehlo.subtract %v3137, %v3140 : tensor<256x197x197xf32>
    %v3142 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3143 = stablehlo.exponential %v3141 : tensor<256x197x197xf32>
    %v3144 = stablehlo.reduce(%v3143 init: %v3142) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3145 = stablehlo.broadcast_in_dim %v3144, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3146 = stablehlo.divide %v3143, %v3145 : tensor<256x197x197xf32>
    %v3147 = stablehlo.reshape %v3146 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3148 = stablehlo.reshape %v3147 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3149 = stablehlo.reshape %v3127 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3150 = stablehlo.dot_general %v3148, %v3149, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3151 = stablehlo.reshape %v3150 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3152 = stablehlo.reshape %v3151 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3153 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3154 = stablehlo.pad %v3152, %v3153, low = [0, 0, 192], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3155 = stablehlo.reshape %v3154 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3156 = stablehlo.add %v3118, %v3155 : tensor<256x75648xf32>
    %v3157 = stablehlo.reshape %v2995 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3158 = stablehlo.slice %v3157 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3159 = stablehlo.reshape %v3158 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3160 = stablehlo.reshape %v3000 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3161 = stablehlo.slice %v3160 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3162 = stablehlo.reshape %v3161 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3163 = stablehlo.reshape %v3005 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3164 = stablehlo.slice %v3163 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3165 = stablehlo.reshape %v3164 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3166 = stablehlo.reshape %v3162 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3167 = stablehlo.transpose %v3166, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3168 = stablehlo.reshape %v3167 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3169 = stablehlo.reshape %v3159 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3170 = stablehlo.reshape %v3168 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3171 = stablehlo.dot_general %v3169, %v3170, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3172 = stablehlo.reshape %v3171 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3173 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3174 = stablehlo.multiply %v3172, %v3173 : tensor<256x38809xf32>
    %v3175 = stablehlo.reshape %v3174 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3176 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3177 = stablehlo.reduce(%v3175 init: %v3176) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3178 = stablehlo.broadcast_in_dim %v3177, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3179 = stablehlo.subtract %v3175, %v3178 : tensor<256x197x197xf32>
    %v3180 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3181 = stablehlo.exponential %v3179 : tensor<256x197x197xf32>
    %v3182 = stablehlo.reduce(%v3181 init: %v3180) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3183 = stablehlo.broadcast_in_dim %v3182, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3184 = stablehlo.divide %v3181, %v3183 : tensor<256x197x197xf32>
    %v3185 = stablehlo.reshape %v3184 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3186 = stablehlo.reshape %v3185 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3187 = stablehlo.reshape %v3165 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3188 = stablehlo.dot_general %v3186, %v3187, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3189 = stablehlo.reshape %v3188 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3190 = stablehlo.reshape %v3189 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3191 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3192 = stablehlo.pad %v3190, %v3191, low = [0, 0, 256], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3193 = stablehlo.reshape %v3192 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3194 = stablehlo.add %v3156, %v3193 : tensor<256x75648xf32>
    %v3195 = stablehlo.reshape %v2995 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3196 = stablehlo.slice %v3195 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3197 = stablehlo.reshape %v3196 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3198 = stablehlo.reshape %v3000 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3199 = stablehlo.slice %v3198 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3200 = stablehlo.reshape %v3199 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3201 = stablehlo.reshape %v3005 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3202 = stablehlo.slice %v3201 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3203 = stablehlo.reshape %v3202 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3204 = stablehlo.reshape %v3200 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3205 = stablehlo.transpose %v3204, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3206 = stablehlo.reshape %v3205 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3207 = stablehlo.reshape %v3197 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3208 = stablehlo.reshape %v3206 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3209 = stablehlo.dot_general %v3207, %v3208, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3210 = stablehlo.reshape %v3209 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3211 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3212 = stablehlo.multiply %v3210, %v3211 : tensor<256x38809xf32>
    %v3213 = stablehlo.reshape %v3212 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3214 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3215 = stablehlo.reduce(%v3213 init: %v3214) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3216 = stablehlo.broadcast_in_dim %v3215, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3217 = stablehlo.subtract %v3213, %v3216 : tensor<256x197x197xf32>
    %v3218 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3219 = stablehlo.exponential %v3217 : tensor<256x197x197xf32>
    %v3220 = stablehlo.reduce(%v3219 init: %v3218) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3221 = stablehlo.broadcast_in_dim %v3220, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3222 = stablehlo.divide %v3219, %v3221 : tensor<256x197x197xf32>
    %v3223 = stablehlo.reshape %v3222 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3224 = stablehlo.reshape %v3223 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3225 = stablehlo.reshape %v3203 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3226 = stablehlo.dot_general %v3224, %v3225, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3227 = stablehlo.reshape %v3226 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3228 = stablehlo.reshape %v3227 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3229 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3230 = stablehlo.pad %v3228, %v3229, low = [0, 0, 320], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3231 = stablehlo.reshape %v3230 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3232 = stablehlo.add %v3194, %v3231 : tensor<256x75648xf32>
    %v3233 = stablehlo.reshape %v3232 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3234 = stablehlo.dot_general %v3233, %b9_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v3235 = stablehlo.broadcast_in_dim %b9_bo, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3236 = stablehlo.add %v3234, %v3235 : tensor<256x197x384xf32>
    %v3237 = stablehlo.reshape %v3236 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3238 = stablehlo.add %v2962, %v3237 : tensor<256x75648xf32>
    %v3239 = stablehlo.reshape %v3238 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3240 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3241 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v3242 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v3243 = stablehlo.reduce(%v3239 init: %v3240) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3244 = stablehlo.broadcast_in_dim %v3243, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v3245 = stablehlo.divide %v3244, %v3241 : tensor<256x197x384xf32>
    %v3246 = stablehlo.subtract %v3239, %v3245 : tensor<256x197x384xf32>
    %v3247 = stablehlo.multiply %v3246, %v3246 : tensor<256x197x384xf32>
    %v3248 = stablehlo.reduce(%v3247 init: %v3240) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3249 = stablehlo.broadcast_in_dim %v3248, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v3250 = stablehlo.divide %v3249, %v3241 : tensor<256x197x384xf32>
    %v3251 = stablehlo.add %v3250, %v3242 : tensor<256x197x384xf32>
    %v3252 = stablehlo.rsqrt %v3251 : tensor<256x197x384xf32>
    %v3253 = stablehlo.multiply %v3246, %v3252 : tensor<256x197x384xf32>
    %v3254 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v3255 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v3256 = stablehlo.multiply %v3253, %v3254 : tensor<256x197x384xf32>
    %v3257 = stablehlo.add %v3256, %v3255 : tensor<256x197x384xf32>
    %v3258 = stablehlo.reshape %v3257 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3259 = stablehlo.reshape %v3258 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3260 = stablehlo.broadcast_in_dim %b9_g2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3261 = stablehlo.multiply %v3259, %v3260 : tensor<256x197x384xf32>
    %v3262 = stablehlo.reshape %v3261 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3263 = stablehlo.reshape %v3262 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3264 = stablehlo.broadcast_in_dim %b9_bt2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3265 = stablehlo.add %v3263, %v3264 : tensor<256x197x384xf32>
    %v3266 = stablehlo.reshape %v3265 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3267 = stablehlo.reshape %v3266 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3268 = stablehlo.dot_general %v3267, %b9_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x1536xf32>) -> tensor<256x197x1536xf32>
    %v3269 = stablehlo.broadcast_in_dim %b9_bfc1, dims = [2] : (tensor<1536xf32>) -> tensor<256x197x1536xf32>
    %v3270 = stablehlo.add %v3268, %v3269 : tensor<256x197x1536xf32>
    %v3271 = stablehlo.reshape %v3270 : (tensor<256x197x1536xf32>) -> tensor<256x302592xf32>
    %v3272 = stablehlo.multiply %v3271, %v3271 : tensor<256x302592xf32>
    %v3273 = stablehlo.multiply %v3272, %v3271 : tensor<256x302592xf32>
    %v3274 = stablehlo.constant dense<0.044715> : tensor<256x302592xf32>
    %v3275 = stablehlo.multiply %v3274, %v3273 : tensor<256x302592xf32>
    %v3276 = stablehlo.add %v3271, %v3275 : tensor<256x302592xf32>
    %v3277 = stablehlo.constant dense<0.7978845608028654> : tensor<256x302592xf32>
    %v3278 = stablehlo.multiply %v3277, %v3276 : tensor<256x302592xf32>
    %v3279 = stablehlo.tanh %v3278 : tensor<256x302592xf32>
    %v3280 = stablehlo.constant dense<1.0> : tensor<256x302592xf32>
    %v3281 = stablehlo.add %v3280, %v3279 : tensor<256x302592xf32>
    %v3282 = stablehlo.constant dense<0.5> : tensor<256x302592xf32>
    %v3283 = stablehlo.multiply %v3282, %v3271 : tensor<256x302592xf32>
    %v3284 = stablehlo.multiply %v3283, %v3281 : tensor<256x302592xf32>
    %v3285 = stablehlo.reshape %v3284 : (tensor<256x302592xf32>) -> tensor<256x197x1536xf32>
    %v3286 = stablehlo.dot_general %v3285, %b9_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x1536xf32>, tensor<1536x384xf32>) -> tensor<256x197x384xf32>
    %v3287 = stablehlo.broadcast_in_dim %b9_bfc2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3288 = stablehlo.add %v3286, %v3287 : tensor<256x197x384xf32>
    %v3289 = stablehlo.reshape %v3288 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3290 = stablehlo.add %v3238, %v3289 : tensor<256x75648xf32>
    %v3291 = stablehlo.reshape %v3290 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3292 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3293 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v3294 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v3295 = stablehlo.reduce(%v3291 init: %v3292) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3296 = stablehlo.broadcast_in_dim %v3295, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v3297 = stablehlo.divide %v3296, %v3293 : tensor<256x197x384xf32>
    %v3298 = stablehlo.subtract %v3291, %v3297 : tensor<256x197x384xf32>
    %v3299 = stablehlo.multiply %v3298, %v3298 : tensor<256x197x384xf32>
    %v3300 = stablehlo.reduce(%v3299 init: %v3292) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3301 = stablehlo.broadcast_in_dim %v3300, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v3302 = stablehlo.divide %v3301, %v3293 : tensor<256x197x384xf32>
    %v3303 = stablehlo.add %v3302, %v3294 : tensor<256x197x384xf32>
    %v3304 = stablehlo.rsqrt %v3303 : tensor<256x197x384xf32>
    %v3305 = stablehlo.multiply %v3298, %v3304 : tensor<256x197x384xf32>
    %v3306 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v3307 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v3308 = stablehlo.multiply %v3305, %v3306 : tensor<256x197x384xf32>
    %v3309 = stablehlo.add %v3308, %v3307 : tensor<256x197x384xf32>
    %v3310 = stablehlo.reshape %v3309 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3311 = stablehlo.reshape %v3310 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3312 = stablehlo.broadcast_in_dim %b10_g1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3313 = stablehlo.multiply %v3311, %v3312 : tensor<256x197x384xf32>
    %v3314 = stablehlo.reshape %v3313 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3315 = stablehlo.reshape %v3314 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3316 = stablehlo.broadcast_in_dim %b10_bt1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3317 = stablehlo.add %v3315, %v3316 : tensor<256x197x384xf32>
    %v3318 = stablehlo.reshape %v3317 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3319 = stablehlo.reshape %v3318 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3320 = stablehlo.dot_general %v3319, %b10_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v3321 = stablehlo.broadcast_in_dim %b10_bq, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3322 = stablehlo.add %v3320, %v3321 : tensor<256x197x384xf32>
    %v3323 = stablehlo.reshape %v3322 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3324 = stablehlo.reshape %v3318 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3325 = stablehlo.dot_general %v3324, %b10_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v3326 = stablehlo.broadcast_in_dim %b10_bk, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3327 = stablehlo.add %v3325, %v3326 : tensor<256x197x384xf32>
    %v3328 = stablehlo.reshape %v3327 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3329 = stablehlo.reshape %v3318 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3330 = stablehlo.dot_general %v3329, %b10_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v3331 = stablehlo.broadcast_in_dim %b10_bv, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3332 = stablehlo.add %v3330, %v3331 : tensor<256x197x384xf32>
    %v3333 = stablehlo.reshape %v3332 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3334 = stablehlo.reshape %v3323 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3335 = stablehlo.slice %v3334 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3336 = stablehlo.reshape %v3335 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3337 = stablehlo.reshape %v3328 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3338 = stablehlo.slice %v3337 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3339 = stablehlo.reshape %v3338 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3340 = stablehlo.reshape %v3333 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3341 = stablehlo.slice %v3340 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3342 = stablehlo.reshape %v3341 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3343 = stablehlo.reshape %v3339 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3344 = stablehlo.transpose %v3343, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3345 = stablehlo.reshape %v3344 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3346 = stablehlo.reshape %v3336 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3347 = stablehlo.reshape %v3345 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3348 = stablehlo.dot_general %v3346, %v3347, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3349 = stablehlo.reshape %v3348 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3350 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3351 = stablehlo.multiply %v3349, %v3350 : tensor<256x38809xf32>
    %v3352 = stablehlo.reshape %v3351 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3353 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3354 = stablehlo.reduce(%v3352 init: %v3353) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3355 = stablehlo.broadcast_in_dim %v3354, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3356 = stablehlo.subtract %v3352, %v3355 : tensor<256x197x197xf32>
    %v3357 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3358 = stablehlo.exponential %v3356 : tensor<256x197x197xf32>
    %v3359 = stablehlo.reduce(%v3358 init: %v3357) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3360 = stablehlo.broadcast_in_dim %v3359, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3361 = stablehlo.divide %v3358, %v3360 : tensor<256x197x197xf32>
    %v3362 = stablehlo.reshape %v3361 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3363 = stablehlo.reshape %v3362 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3364 = stablehlo.reshape %v3342 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3365 = stablehlo.dot_general %v3363, %v3364, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3366 = stablehlo.reshape %v3365 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3367 = stablehlo.reshape %v3366 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3368 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3369 = stablehlo.pad %v3367, %v3368, low = [0, 0, 0], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3370 = stablehlo.reshape %v3369 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3371 = stablehlo.reshape %v3323 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3372 = stablehlo.slice %v3371 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3373 = stablehlo.reshape %v3372 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3374 = stablehlo.reshape %v3328 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3375 = stablehlo.slice %v3374 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3376 = stablehlo.reshape %v3375 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3377 = stablehlo.reshape %v3333 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3378 = stablehlo.slice %v3377 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3379 = stablehlo.reshape %v3378 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3380 = stablehlo.reshape %v3376 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3381 = stablehlo.transpose %v3380, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3382 = stablehlo.reshape %v3381 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3383 = stablehlo.reshape %v3373 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3384 = stablehlo.reshape %v3382 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3385 = stablehlo.dot_general %v3383, %v3384, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3386 = stablehlo.reshape %v3385 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3387 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3388 = stablehlo.multiply %v3386, %v3387 : tensor<256x38809xf32>
    %v3389 = stablehlo.reshape %v3388 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3390 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3391 = stablehlo.reduce(%v3389 init: %v3390) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3392 = stablehlo.broadcast_in_dim %v3391, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3393 = stablehlo.subtract %v3389, %v3392 : tensor<256x197x197xf32>
    %v3394 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3395 = stablehlo.exponential %v3393 : tensor<256x197x197xf32>
    %v3396 = stablehlo.reduce(%v3395 init: %v3394) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3397 = stablehlo.broadcast_in_dim %v3396, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3398 = stablehlo.divide %v3395, %v3397 : tensor<256x197x197xf32>
    %v3399 = stablehlo.reshape %v3398 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3400 = stablehlo.reshape %v3399 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3401 = stablehlo.reshape %v3379 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3402 = stablehlo.dot_general %v3400, %v3401, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3403 = stablehlo.reshape %v3402 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3404 = stablehlo.reshape %v3403 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3405 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3406 = stablehlo.pad %v3404, %v3405, low = [0, 0, 64], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3407 = stablehlo.reshape %v3406 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3408 = stablehlo.add %v3370, %v3407 : tensor<256x75648xf32>
    %v3409 = stablehlo.reshape %v3323 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3410 = stablehlo.slice %v3409 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3411 = stablehlo.reshape %v3410 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3412 = stablehlo.reshape %v3328 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3413 = stablehlo.slice %v3412 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3414 = stablehlo.reshape %v3413 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3415 = stablehlo.reshape %v3333 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3416 = stablehlo.slice %v3415 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3417 = stablehlo.reshape %v3416 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3418 = stablehlo.reshape %v3414 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3419 = stablehlo.transpose %v3418, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3420 = stablehlo.reshape %v3419 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3421 = stablehlo.reshape %v3411 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3422 = stablehlo.reshape %v3420 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3423 = stablehlo.dot_general %v3421, %v3422, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3424 = stablehlo.reshape %v3423 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3425 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3426 = stablehlo.multiply %v3424, %v3425 : tensor<256x38809xf32>
    %v3427 = stablehlo.reshape %v3426 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3428 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3429 = stablehlo.reduce(%v3427 init: %v3428) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3430 = stablehlo.broadcast_in_dim %v3429, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3431 = stablehlo.subtract %v3427, %v3430 : tensor<256x197x197xf32>
    %v3432 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3433 = stablehlo.exponential %v3431 : tensor<256x197x197xf32>
    %v3434 = stablehlo.reduce(%v3433 init: %v3432) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3435 = stablehlo.broadcast_in_dim %v3434, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3436 = stablehlo.divide %v3433, %v3435 : tensor<256x197x197xf32>
    %v3437 = stablehlo.reshape %v3436 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3438 = stablehlo.reshape %v3437 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3439 = stablehlo.reshape %v3417 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3440 = stablehlo.dot_general %v3438, %v3439, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3441 = stablehlo.reshape %v3440 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3442 = stablehlo.reshape %v3441 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3443 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3444 = stablehlo.pad %v3442, %v3443, low = [0, 0, 128], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3445 = stablehlo.reshape %v3444 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3446 = stablehlo.add %v3408, %v3445 : tensor<256x75648xf32>
    %v3447 = stablehlo.reshape %v3323 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3448 = stablehlo.slice %v3447 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3449 = stablehlo.reshape %v3448 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3450 = stablehlo.reshape %v3328 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3451 = stablehlo.slice %v3450 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3452 = stablehlo.reshape %v3451 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3453 = stablehlo.reshape %v3333 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3454 = stablehlo.slice %v3453 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3455 = stablehlo.reshape %v3454 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3456 = stablehlo.reshape %v3452 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3457 = stablehlo.transpose %v3456, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3458 = stablehlo.reshape %v3457 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3459 = stablehlo.reshape %v3449 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3460 = stablehlo.reshape %v3458 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3461 = stablehlo.dot_general %v3459, %v3460, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3462 = stablehlo.reshape %v3461 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3463 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3464 = stablehlo.multiply %v3462, %v3463 : tensor<256x38809xf32>
    %v3465 = stablehlo.reshape %v3464 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3466 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3467 = stablehlo.reduce(%v3465 init: %v3466) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3468 = stablehlo.broadcast_in_dim %v3467, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3469 = stablehlo.subtract %v3465, %v3468 : tensor<256x197x197xf32>
    %v3470 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3471 = stablehlo.exponential %v3469 : tensor<256x197x197xf32>
    %v3472 = stablehlo.reduce(%v3471 init: %v3470) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3473 = stablehlo.broadcast_in_dim %v3472, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3474 = stablehlo.divide %v3471, %v3473 : tensor<256x197x197xf32>
    %v3475 = stablehlo.reshape %v3474 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3476 = stablehlo.reshape %v3475 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3477 = stablehlo.reshape %v3455 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3478 = stablehlo.dot_general %v3476, %v3477, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3479 = stablehlo.reshape %v3478 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3480 = stablehlo.reshape %v3479 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3481 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3482 = stablehlo.pad %v3480, %v3481, low = [0, 0, 192], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3483 = stablehlo.reshape %v3482 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3484 = stablehlo.add %v3446, %v3483 : tensor<256x75648xf32>
    %v3485 = stablehlo.reshape %v3323 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3486 = stablehlo.slice %v3485 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3487 = stablehlo.reshape %v3486 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3488 = stablehlo.reshape %v3328 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3489 = stablehlo.slice %v3488 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3490 = stablehlo.reshape %v3489 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3491 = stablehlo.reshape %v3333 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3492 = stablehlo.slice %v3491 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3493 = stablehlo.reshape %v3492 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3494 = stablehlo.reshape %v3490 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3495 = stablehlo.transpose %v3494, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3496 = stablehlo.reshape %v3495 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3497 = stablehlo.reshape %v3487 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3498 = stablehlo.reshape %v3496 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3499 = stablehlo.dot_general %v3497, %v3498, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3500 = stablehlo.reshape %v3499 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3501 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3502 = stablehlo.multiply %v3500, %v3501 : tensor<256x38809xf32>
    %v3503 = stablehlo.reshape %v3502 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3504 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3505 = stablehlo.reduce(%v3503 init: %v3504) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3506 = stablehlo.broadcast_in_dim %v3505, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3507 = stablehlo.subtract %v3503, %v3506 : tensor<256x197x197xf32>
    %v3508 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3509 = stablehlo.exponential %v3507 : tensor<256x197x197xf32>
    %v3510 = stablehlo.reduce(%v3509 init: %v3508) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3511 = stablehlo.broadcast_in_dim %v3510, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3512 = stablehlo.divide %v3509, %v3511 : tensor<256x197x197xf32>
    %v3513 = stablehlo.reshape %v3512 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3514 = stablehlo.reshape %v3513 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3515 = stablehlo.reshape %v3493 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3516 = stablehlo.dot_general %v3514, %v3515, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3517 = stablehlo.reshape %v3516 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3518 = stablehlo.reshape %v3517 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3519 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3520 = stablehlo.pad %v3518, %v3519, low = [0, 0, 256], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3521 = stablehlo.reshape %v3520 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3522 = stablehlo.add %v3484, %v3521 : tensor<256x75648xf32>
    %v3523 = stablehlo.reshape %v3323 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3524 = stablehlo.slice %v3523 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3525 = stablehlo.reshape %v3524 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3526 = stablehlo.reshape %v3328 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3527 = stablehlo.slice %v3526 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3528 = stablehlo.reshape %v3527 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3529 = stablehlo.reshape %v3333 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3530 = stablehlo.slice %v3529 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3531 = stablehlo.reshape %v3530 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3532 = stablehlo.reshape %v3528 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3533 = stablehlo.transpose %v3532, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3534 = stablehlo.reshape %v3533 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3535 = stablehlo.reshape %v3525 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3536 = stablehlo.reshape %v3534 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3537 = stablehlo.dot_general %v3535, %v3536, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3538 = stablehlo.reshape %v3537 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3539 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3540 = stablehlo.multiply %v3538, %v3539 : tensor<256x38809xf32>
    %v3541 = stablehlo.reshape %v3540 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3542 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3543 = stablehlo.reduce(%v3541 init: %v3542) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3544 = stablehlo.broadcast_in_dim %v3543, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3545 = stablehlo.subtract %v3541, %v3544 : tensor<256x197x197xf32>
    %v3546 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3547 = stablehlo.exponential %v3545 : tensor<256x197x197xf32>
    %v3548 = stablehlo.reduce(%v3547 init: %v3546) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3549 = stablehlo.broadcast_in_dim %v3548, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3550 = stablehlo.divide %v3547, %v3549 : tensor<256x197x197xf32>
    %v3551 = stablehlo.reshape %v3550 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3552 = stablehlo.reshape %v3551 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3553 = stablehlo.reshape %v3531 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3554 = stablehlo.dot_general %v3552, %v3553, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3555 = stablehlo.reshape %v3554 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3556 = stablehlo.reshape %v3555 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3557 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3558 = stablehlo.pad %v3556, %v3557, low = [0, 0, 320], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3559 = stablehlo.reshape %v3558 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3560 = stablehlo.add %v3522, %v3559 : tensor<256x75648xf32>
    %v3561 = stablehlo.reshape %v3560 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3562 = stablehlo.dot_general %v3561, %b10_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v3563 = stablehlo.broadcast_in_dim %b10_bo, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3564 = stablehlo.add %v3562, %v3563 : tensor<256x197x384xf32>
    %v3565 = stablehlo.reshape %v3564 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3566 = stablehlo.add %v3290, %v3565 : tensor<256x75648xf32>
    %v3567 = stablehlo.reshape %v3566 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3568 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3569 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v3570 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v3571 = stablehlo.reduce(%v3567 init: %v3568) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3572 = stablehlo.broadcast_in_dim %v3571, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v3573 = stablehlo.divide %v3572, %v3569 : tensor<256x197x384xf32>
    %v3574 = stablehlo.subtract %v3567, %v3573 : tensor<256x197x384xf32>
    %v3575 = stablehlo.multiply %v3574, %v3574 : tensor<256x197x384xf32>
    %v3576 = stablehlo.reduce(%v3575 init: %v3568) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3577 = stablehlo.broadcast_in_dim %v3576, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v3578 = stablehlo.divide %v3577, %v3569 : tensor<256x197x384xf32>
    %v3579 = stablehlo.add %v3578, %v3570 : tensor<256x197x384xf32>
    %v3580 = stablehlo.rsqrt %v3579 : tensor<256x197x384xf32>
    %v3581 = stablehlo.multiply %v3574, %v3580 : tensor<256x197x384xf32>
    %v3582 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v3583 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v3584 = stablehlo.multiply %v3581, %v3582 : tensor<256x197x384xf32>
    %v3585 = stablehlo.add %v3584, %v3583 : tensor<256x197x384xf32>
    %v3586 = stablehlo.reshape %v3585 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3587 = stablehlo.reshape %v3586 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3588 = stablehlo.broadcast_in_dim %b10_g2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3589 = stablehlo.multiply %v3587, %v3588 : tensor<256x197x384xf32>
    %v3590 = stablehlo.reshape %v3589 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3591 = stablehlo.reshape %v3590 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3592 = stablehlo.broadcast_in_dim %b10_bt2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3593 = stablehlo.add %v3591, %v3592 : tensor<256x197x384xf32>
    %v3594 = stablehlo.reshape %v3593 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3595 = stablehlo.reshape %v3594 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3596 = stablehlo.dot_general %v3595, %b10_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x1536xf32>) -> tensor<256x197x1536xf32>
    %v3597 = stablehlo.broadcast_in_dim %b10_bfc1, dims = [2] : (tensor<1536xf32>) -> tensor<256x197x1536xf32>
    %v3598 = stablehlo.add %v3596, %v3597 : tensor<256x197x1536xf32>
    %v3599 = stablehlo.reshape %v3598 : (tensor<256x197x1536xf32>) -> tensor<256x302592xf32>
    %v3600 = stablehlo.multiply %v3599, %v3599 : tensor<256x302592xf32>
    %v3601 = stablehlo.multiply %v3600, %v3599 : tensor<256x302592xf32>
    %v3602 = stablehlo.constant dense<0.044715> : tensor<256x302592xf32>
    %v3603 = stablehlo.multiply %v3602, %v3601 : tensor<256x302592xf32>
    %v3604 = stablehlo.add %v3599, %v3603 : tensor<256x302592xf32>
    %v3605 = stablehlo.constant dense<0.7978845608028654> : tensor<256x302592xf32>
    %v3606 = stablehlo.multiply %v3605, %v3604 : tensor<256x302592xf32>
    %v3607 = stablehlo.tanh %v3606 : tensor<256x302592xf32>
    %v3608 = stablehlo.constant dense<1.0> : tensor<256x302592xf32>
    %v3609 = stablehlo.add %v3608, %v3607 : tensor<256x302592xf32>
    %v3610 = stablehlo.constant dense<0.5> : tensor<256x302592xf32>
    %v3611 = stablehlo.multiply %v3610, %v3599 : tensor<256x302592xf32>
    %v3612 = stablehlo.multiply %v3611, %v3609 : tensor<256x302592xf32>
    %v3613 = stablehlo.reshape %v3612 : (tensor<256x302592xf32>) -> tensor<256x197x1536xf32>
    %v3614 = stablehlo.dot_general %v3613, %b10_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x1536xf32>, tensor<1536x384xf32>) -> tensor<256x197x384xf32>
    %v3615 = stablehlo.broadcast_in_dim %b10_bfc2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3616 = stablehlo.add %v3614, %v3615 : tensor<256x197x384xf32>
    %v3617 = stablehlo.reshape %v3616 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3618 = stablehlo.add %v3566, %v3617 : tensor<256x75648xf32>
    %v3619 = stablehlo.reshape %v3618 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3620 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3621 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v3622 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v3623 = stablehlo.reduce(%v3619 init: %v3620) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3624 = stablehlo.broadcast_in_dim %v3623, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v3625 = stablehlo.divide %v3624, %v3621 : tensor<256x197x384xf32>
    %v3626 = stablehlo.subtract %v3619, %v3625 : tensor<256x197x384xf32>
    %v3627 = stablehlo.multiply %v3626, %v3626 : tensor<256x197x384xf32>
    %v3628 = stablehlo.reduce(%v3627 init: %v3620) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3629 = stablehlo.broadcast_in_dim %v3628, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v3630 = stablehlo.divide %v3629, %v3621 : tensor<256x197x384xf32>
    %v3631 = stablehlo.add %v3630, %v3622 : tensor<256x197x384xf32>
    %v3632 = stablehlo.rsqrt %v3631 : tensor<256x197x384xf32>
    %v3633 = stablehlo.multiply %v3626, %v3632 : tensor<256x197x384xf32>
    %v3634 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v3635 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v3636 = stablehlo.multiply %v3633, %v3634 : tensor<256x197x384xf32>
    %v3637 = stablehlo.add %v3636, %v3635 : tensor<256x197x384xf32>
    %v3638 = stablehlo.reshape %v3637 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3639 = stablehlo.reshape %v3638 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3640 = stablehlo.broadcast_in_dim %b11_g1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3641 = stablehlo.multiply %v3639, %v3640 : tensor<256x197x384xf32>
    %v3642 = stablehlo.reshape %v3641 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3643 = stablehlo.reshape %v3642 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3644 = stablehlo.broadcast_in_dim %b11_bt1, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3645 = stablehlo.add %v3643, %v3644 : tensor<256x197x384xf32>
    %v3646 = stablehlo.reshape %v3645 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3647 = stablehlo.reshape %v3646 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3648 = stablehlo.dot_general %v3647, %b11_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v3649 = stablehlo.broadcast_in_dim %b11_bq, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3650 = stablehlo.add %v3648, %v3649 : tensor<256x197x384xf32>
    %v3651 = stablehlo.reshape %v3650 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3652 = stablehlo.reshape %v3646 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3653 = stablehlo.dot_general %v3652, %b11_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v3654 = stablehlo.broadcast_in_dim %b11_bk, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3655 = stablehlo.add %v3653, %v3654 : tensor<256x197x384xf32>
    %v3656 = stablehlo.reshape %v3655 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3657 = stablehlo.reshape %v3646 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3658 = stablehlo.dot_general %v3657, %b11_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v3659 = stablehlo.broadcast_in_dim %b11_bv, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3660 = stablehlo.add %v3658, %v3659 : tensor<256x197x384xf32>
    %v3661 = stablehlo.reshape %v3660 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3662 = stablehlo.reshape %v3651 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3663 = stablehlo.slice %v3662 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3664 = stablehlo.reshape %v3663 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3665 = stablehlo.reshape %v3656 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3666 = stablehlo.slice %v3665 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3667 = stablehlo.reshape %v3666 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3668 = stablehlo.reshape %v3661 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3669 = stablehlo.slice %v3668 [0:256, 0:197, 0:64] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3670 = stablehlo.reshape %v3669 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3671 = stablehlo.reshape %v3667 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3672 = stablehlo.transpose %v3671, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3673 = stablehlo.reshape %v3672 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3674 = stablehlo.reshape %v3664 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3675 = stablehlo.reshape %v3673 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3676 = stablehlo.dot_general %v3674, %v3675, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3677 = stablehlo.reshape %v3676 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3678 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3679 = stablehlo.multiply %v3677, %v3678 : tensor<256x38809xf32>
    %v3680 = stablehlo.reshape %v3679 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3681 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3682 = stablehlo.reduce(%v3680 init: %v3681) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3683 = stablehlo.broadcast_in_dim %v3682, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3684 = stablehlo.subtract %v3680, %v3683 : tensor<256x197x197xf32>
    %v3685 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3686 = stablehlo.exponential %v3684 : tensor<256x197x197xf32>
    %v3687 = stablehlo.reduce(%v3686 init: %v3685) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3688 = stablehlo.broadcast_in_dim %v3687, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3689 = stablehlo.divide %v3686, %v3688 : tensor<256x197x197xf32>
    %v3690 = stablehlo.reshape %v3689 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3691 = stablehlo.reshape %v3690 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3692 = stablehlo.reshape %v3670 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3693 = stablehlo.dot_general %v3691, %v3692, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3694 = stablehlo.reshape %v3693 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3695 = stablehlo.reshape %v3694 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3696 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3697 = stablehlo.pad %v3695, %v3696, low = [0, 0, 0], high = [0, 0, 320], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3698 = stablehlo.reshape %v3697 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3699 = stablehlo.reshape %v3651 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3700 = stablehlo.slice %v3699 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3701 = stablehlo.reshape %v3700 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3702 = stablehlo.reshape %v3656 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3703 = stablehlo.slice %v3702 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3704 = stablehlo.reshape %v3703 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3705 = stablehlo.reshape %v3661 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3706 = stablehlo.slice %v3705 [0:256, 0:197, 64:128] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3707 = stablehlo.reshape %v3706 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3708 = stablehlo.reshape %v3704 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3709 = stablehlo.transpose %v3708, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3710 = stablehlo.reshape %v3709 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3711 = stablehlo.reshape %v3701 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3712 = stablehlo.reshape %v3710 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3713 = stablehlo.dot_general %v3711, %v3712, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3714 = stablehlo.reshape %v3713 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3715 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3716 = stablehlo.multiply %v3714, %v3715 : tensor<256x38809xf32>
    %v3717 = stablehlo.reshape %v3716 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3718 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3719 = stablehlo.reduce(%v3717 init: %v3718) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3720 = stablehlo.broadcast_in_dim %v3719, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3721 = stablehlo.subtract %v3717, %v3720 : tensor<256x197x197xf32>
    %v3722 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3723 = stablehlo.exponential %v3721 : tensor<256x197x197xf32>
    %v3724 = stablehlo.reduce(%v3723 init: %v3722) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3725 = stablehlo.broadcast_in_dim %v3724, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3726 = stablehlo.divide %v3723, %v3725 : tensor<256x197x197xf32>
    %v3727 = stablehlo.reshape %v3726 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3728 = stablehlo.reshape %v3727 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3729 = stablehlo.reshape %v3707 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3730 = stablehlo.dot_general %v3728, %v3729, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3731 = stablehlo.reshape %v3730 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3732 = stablehlo.reshape %v3731 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3733 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3734 = stablehlo.pad %v3732, %v3733, low = [0, 0, 64], high = [0, 0, 256], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3735 = stablehlo.reshape %v3734 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3736 = stablehlo.add %v3698, %v3735 : tensor<256x75648xf32>
    %v3737 = stablehlo.reshape %v3651 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3738 = stablehlo.slice %v3737 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3739 = stablehlo.reshape %v3738 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3740 = stablehlo.reshape %v3656 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3741 = stablehlo.slice %v3740 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3742 = stablehlo.reshape %v3741 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3743 = stablehlo.reshape %v3661 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3744 = stablehlo.slice %v3743 [0:256, 0:197, 128:192] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3745 = stablehlo.reshape %v3744 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3746 = stablehlo.reshape %v3742 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3747 = stablehlo.transpose %v3746, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3748 = stablehlo.reshape %v3747 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3749 = stablehlo.reshape %v3739 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3750 = stablehlo.reshape %v3748 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3751 = stablehlo.dot_general %v3749, %v3750, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3752 = stablehlo.reshape %v3751 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3753 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3754 = stablehlo.multiply %v3752, %v3753 : tensor<256x38809xf32>
    %v3755 = stablehlo.reshape %v3754 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3756 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3757 = stablehlo.reduce(%v3755 init: %v3756) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3758 = stablehlo.broadcast_in_dim %v3757, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3759 = stablehlo.subtract %v3755, %v3758 : tensor<256x197x197xf32>
    %v3760 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3761 = stablehlo.exponential %v3759 : tensor<256x197x197xf32>
    %v3762 = stablehlo.reduce(%v3761 init: %v3760) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3763 = stablehlo.broadcast_in_dim %v3762, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3764 = stablehlo.divide %v3761, %v3763 : tensor<256x197x197xf32>
    %v3765 = stablehlo.reshape %v3764 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3766 = stablehlo.reshape %v3765 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3767 = stablehlo.reshape %v3745 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3768 = stablehlo.dot_general %v3766, %v3767, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3769 = stablehlo.reshape %v3768 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3770 = stablehlo.reshape %v3769 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3771 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3772 = stablehlo.pad %v3770, %v3771, low = [0, 0, 128], high = [0, 0, 192], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3773 = stablehlo.reshape %v3772 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3774 = stablehlo.add %v3736, %v3773 : tensor<256x75648xf32>
    %v3775 = stablehlo.reshape %v3651 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3776 = stablehlo.slice %v3775 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3777 = stablehlo.reshape %v3776 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3778 = stablehlo.reshape %v3656 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3779 = stablehlo.slice %v3778 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3780 = stablehlo.reshape %v3779 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3781 = stablehlo.reshape %v3661 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3782 = stablehlo.slice %v3781 [0:256, 0:197, 192:256] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3783 = stablehlo.reshape %v3782 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3784 = stablehlo.reshape %v3780 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3785 = stablehlo.transpose %v3784, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3786 = stablehlo.reshape %v3785 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3787 = stablehlo.reshape %v3777 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3788 = stablehlo.reshape %v3786 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3789 = stablehlo.dot_general %v3787, %v3788, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3790 = stablehlo.reshape %v3789 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3791 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3792 = stablehlo.multiply %v3790, %v3791 : tensor<256x38809xf32>
    %v3793 = stablehlo.reshape %v3792 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3794 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3795 = stablehlo.reduce(%v3793 init: %v3794) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3796 = stablehlo.broadcast_in_dim %v3795, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3797 = stablehlo.subtract %v3793, %v3796 : tensor<256x197x197xf32>
    %v3798 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3799 = stablehlo.exponential %v3797 : tensor<256x197x197xf32>
    %v3800 = stablehlo.reduce(%v3799 init: %v3798) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3801 = stablehlo.broadcast_in_dim %v3800, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3802 = stablehlo.divide %v3799, %v3801 : tensor<256x197x197xf32>
    %v3803 = stablehlo.reshape %v3802 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3804 = stablehlo.reshape %v3803 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3805 = stablehlo.reshape %v3783 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3806 = stablehlo.dot_general %v3804, %v3805, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3807 = stablehlo.reshape %v3806 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3808 = stablehlo.reshape %v3807 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3809 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3810 = stablehlo.pad %v3808, %v3809, low = [0, 0, 192], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3811 = stablehlo.reshape %v3810 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3812 = stablehlo.add %v3774, %v3811 : tensor<256x75648xf32>
    %v3813 = stablehlo.reshape %v3651 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3814 = stablehlo.slice %v3813 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3815 = stablehlo.reshape %v3814 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3816 = stablehlo.reshape %v3656 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3817 = stablehlo.slice %v3816 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3818 = stablehlo.reshape %v3817 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3819 = stablehlo.reshape %v3661 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3820 = stablehlo.slice %v3819 [0:256, 0:197, 256:320] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3821 = stablehlo.reshape %v3820 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3822 = stablehlo.reshape %v3818 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3823 = stablehlo.transpose %v3822, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3824 = stablehlo.reshape %v3823 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3825 = stablehlo.reshape %v3815 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3826 = stablehlo.reshape %v3824 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3827 = stablehlo.dot_general %v3825, %v3826, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3828 = stablehlo.reshape %v3827 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3829 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3830 = stablehlo.multiply %v3828, %v3829 : tensor<256x38809xf32>
    %v3831 = stablehlo.reshape %v3830 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3832 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3833 = stablehlo.reduce(%v3831 init: %v3832) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3834 = stablehlo.broadcast_in_dim %v3833, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3835 = stablehlo.subtract %v3831, %v3834 : tensor<256x197x197xf32>
    %v3836 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3837 = stablehlo.exponential %v3835 : tensor<256x197x197xf32>
    %v3838 = stablehlo.reduce(%v3837 init: %v3836) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3839 = stablehlo.broadcast_in_dim %v3838, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3840 = stablehlo.divide %v3837, %v3839 : tensor<256x197x197xf32>
    %v3841 = stablehlo.reshape %v3840 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3842 = stablehlo.reshape %v3841 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3843 = stablehlo.reshape %v3821 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3844 = stablehlo.dot_general %v3842, %v3843, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3845 = stablehlo.reshape %v3844 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3846 = stablehlo.reshape %v3845 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3847 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3848 = stablehlo.pad %v3846, %v3847, low = [0, 0, 256], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3849 = stablehlo.reshape %v3848 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3850 = stablehlo.add %v3812, %v3849 : tensor<256x75648xf32>
    %v3851 = stablehlo.reshape %v3651 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3852 = stablehlo.slice %v3851 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3853 = stablehlo.reshape %v3852 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3854 = stablehlo.reshape %v3656 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3855 = stablehlo.slice %v3854 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3856 = stablehlo.reshape %v3855 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3857 = stablehlo.reshape %v3661 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3858 = stablehlo.slice %v3857 [0:256, 0:197, 320:384] : (tensor<256x197x384xf32>) -> tensor<256x197x64xf32>
    %v3859 = stablehlo.reshape %v3858 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3860 = stablehlo.reshape %v3856 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3861 = stablehlo.transpose %v3860, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v3862 = stablehlo.reshape %v3861 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v3863 = stablehlo.reshape %v3853 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3864 = stablehlo.reshape %v3862 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v3865 = stablehlo.dot_general %v3863, %v3864, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v3866 = stablehlo.reshape %v3865 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3867 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v3868 = stablehlo.multiply %v3866, %v3867 : tensor<256x38809xf32>
    %v3869 = stablehlo.reshape %v3868 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3870 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v3871 = stablehlo.reduce(%v3869 init: %v3870) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3872 = stablehlo.broadcast_in_dim %v3871, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3873 = stablehlo.subtract %v3869, %v3872 : tensor<256x197x197xf32>
    %v3874 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3875 = stablehlo.exponential %v3873 : tensor<256x197x197xf32>
    %v3876 = stablehlo.reduce(%v3875 init: %v3874) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3877 = stablehlo.broadcast_in_dim %v3876, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v3878 = stablehlo.divide %v3875, %v3877 : tensor<256x197x197xf32>
    %v3879 = stablehlo.reshape %v3878 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v3880 = stablehlo.reshape %v3879 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v3881 = stablehlo.reshape %v3859 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3882 = stablehlo.dot_general %v3880, %v3881, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v3883 = stablehlo.reshape %v3882 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v3884 = stablehlo.reshape %v3883 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v3885 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3886 = stablehlo.pad %v3884, %v3885, low = [0, 0, 320], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x384xf32>
    %v3887 = stablehlo.reshape %v3886 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3888 = stablehlo.add %v3850, %v3887 : tensor<256x75648xf32>
    %v3889 = stablehlo.reshape %v3888 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3890 = stablehlo.dot_general %v3889, %b11_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x384xf32>) -> tensor<256x197x384xf32>
    %v3891 = stablehlo.broadcast_in_dim %b11_bo, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3892 = stablehlo.add %v3890, %v3891 : tensor<256x197x384xf32>
    %v3893 = stablehlo.reshape %v3892 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3894 = stablehlo.add %v3618, %v3893 : tensor<256x75648xf32>
    %v3895 = stablehlo.reshape %v3894 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3896 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3897 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v3898 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v3899 = stablehlo.reduce(%v3895 init: %v3896) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3900 = stablehlo.broadcast_in_dim %v3899, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v3901 = stablehlo.divide %v3900, %v3897 : tensor<256x197x384xf32>
    %v3902 = stablehlo.subtract %v3895, %v3901 : tensor<256x197x384xf32>
    %v3903 = stablehlo.multiply %v3902, %v3902 : tensor<256x197x384xf32>
    %v3904 = stablehlo.reduce(%v3903 init: %v3896) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3905 = stablehlo.broadcast_in_dim %v3904, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v3906 = stablehlo.divide %v3905, %v3897 : tensor<256x197x384xf32>
    %v3907 = stablehlo.add %v3906, %v3898 : tensor<256x197x384xf32>
    %v3908 = stablehlo.rsqrt %v3907 : tensor<256x197x384xf32>
    %v3909 = stablehlo.multiply %v3902, %v3908 : tensor<256x197x384xf32>
    %v3910 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v3911 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v3912 = stablehlo.multiply %v3909, %v3910 : tensor<256x197x384xf32>
    %v3913 = stablehlo.add %v3912, %v3911 : tensor<256x197x384xf32>
    %v3914 = stablehlo.reshape %v3913 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3915 = stablehlo.reshape %v3914 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3916 = stablehlo.broadcast_in_dim %b11_g2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3917 = stablehlo.multiply %v3915, %v3916 : tensor<256x197x384xf32>
    %v3918 = stablehlo.reshape %v3917 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3919 = stablehlo.reshape %v3918 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3920 = stablehlo.broadcast_in_dim %b11_bt2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3921 = stablehlo.add %v3919, %v3920 : tensor<256x197x384xf32>
    %v3922 = stablehlo.reshape %v3921 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3923 = stablehlo.reshape %v3922 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3924 = stablehlo.dot_general %v3923, %b11_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x384xf32>, tensor<384x1536xf32>) -> tensor<256x197x1536xf32>
    %v3925 = stablehlo.broadcast_in_dim %b11_bfc1, dims = [2] : (tensor<1536xf32>) -> tensor<256x197x1536xf32>
    %v3926 = stablehlo.add %v3924, %v3925 : tensor<256x197x1536xf32>
    %v3927 = stablehlo.reshape %v3926 : (tensor<256x197x1536xf32>) -> tensor<256x302592xf32>
    %v3928 = stablehlo.multiply %v3927, %v3927 : tensor<256x302592xf32>
    %v3929 = stablehlo.multiply %v3928, %v3927 : tensor<256x302592xf32>
    %v3930 = stablehlo.constant dense<0.044715> : tensor<256x302592xf32>
    %v3931 = stablehlo.multiply %v3930, %v3929 : tensor<256x302592xf32>
    %v3932 = stablehlo.add %v3927, %v3931 : tensor<256x302592xf32>
    %v3933 = stablehlo.constant dense<0.7978845608028654> : tensor<256x302592xf32>
    %v3934 = stablehlo.multiply %v3933, %v3932 : tensor<256x302592xf32>
    %v3935 = stablehlo.tanh %v3934 : tensor<256x302592xf32>
    %v3936 = stablehlo.constant dense<1.0> : tensor<256x302592xf32>
    %v3937 = stablehlo.add %v3936, %v3935 : tensor<256x302592xf32>
    %v3938 = stablehlo.constant dense<0.5> : tensor<256x302592xf32>
    %v3939 = stablehlo.multiply %v3938, %v3927 : tensor<256x302592xf32>
    %v3940 = stablehlo.multiply %v3939, %v3937 : tensor<256x302592xf32>
    %v3941 = stablehlo.reshape %v3940 : (tensor<256x302592xf32>) -> tensor<256x197x1536xf32>
    %v3942 = stablehlo.dot_general %v3941, %b11_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x1536xf32>, tensor<1536x384xf32>) -> tensor<256x197x384xf32>
    %v3943 = stablehlo.broadcast_in_dim %b11_bfc2, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3944 = stablehlo.add %v3942, %v3943 : tensor<256x197x384xf32>
    %v3945 = stablehlo.reshape %v3944 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3946 = stablehlo.add %v3894, %v3945 : tensor<256x75648xf32>
    %v3947 = stablehlo.reshape %v3946 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3948 = stablehlo.constant dense<0.0> : tensor<f32>
    %v3949 = stablehlo.constant dense<384.0> : tensor<256x197x384xf32>
    %v3950 = stablehlo.constant dense<1.0e-6> : tensor<256x197x384xf32>
    %v3951 = stablehlo.reduce(%v3947 init: %v3948) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3952 = stablehlo.broadcast_in_dim %v3951, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v3953 = stablehlo.divide %v3952, %v3949 : tensor<256x197x384xf32>
    %v3954 = stablehlo.subtract %v3947, %v3953 : tensor<256x197x384xf32>
    %v3955 = stablehlo.multiply %v3954, %v3954 : tensor<256x197x384xf32>
    %v3956 = stablehlo.reduce(%v3955 init: %v3948) applies stablehlo.add across dimensions = [2] : (tensor<256x197x384xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v3957 = stablehlo.broadcast_in_dim %v3956, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x384xf32>
    %v3958 = stablehlo.divide %v3957, %v3949 : tensor<256x197x384xf32>
    %v3959 = stablehlo.add %v3958, %v3950 : tensor<256x197x384xf32>
    %v3960 = stablehlo.rsqrt %v3959 : tensor<256x197x384xf32>
    %v3961 = stablehlo.multiply %v3954, %v3960 : tensor<256x197x384xf32>
    %v3962 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v3963 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x384xf32>
    %v3964 = stablehlo.multiply %v3961, %v3962 : tensor<256x197x384xf32>
    %v3965 = stablehlo.add %v3964, %v3963 : tensor<256x197x384xf32>
    %v3966 = stablehlo.reshape %v3965 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3967 = stablehlo.reshape %v3966 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3968 = stablehlo.broadcast_in_dim %gF, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3969 = stablehlo.multiply %v3967, %v3968 : tensor<256x197x384xf32>
    %v3970 = stablehlo.reshape %v3969 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3971 = stablehlo.reshape %v3970 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3972 = stablehlo.broadcast_in_dim %btF, dims = [2] : (tensor<384xf32>) -> tensor<256x197x384xf32>
    %v3973 = stablehlo.add %v3971, %v3972 : tensor<256x197x384xf32>
    %v3974 = stablehlo.reshape %v3973 : (tensor<256x197x384xf32>) -> tensor<256x75648xf32>
    %v3975 = stablehlo.reshape %v3974 : (tensor<256x75648xf32>) -> tensor<256x197x384xf32>
    %v3976 = stablehlo.slice %v3975 [0:256, 0:1, 0:384] : (tensor<256x197x384xf32>) -> tensor<256x1x384xf32>
    %v3977 = stablehlo.reshape %v3976 : (tensor<256x1x384xf32>) -> tensor<256x384xf32>
    %v3978 = stablehlo.dot_general %v3977, %Wc, contracting_dims = [1] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x384xf32>, tensor<384x1000xf32>) -> tensor<256x1000xf32>
    %v3979 = stablehlo.broadcast_in_dim %bc, dims = [1] : (tensor<1000xf32>) -> tensor<256x1000xf32>
    %v3980 = stablehlo.add %v3978, %v3979 : tensor<256x1000xf32>
    return %v3980 : tensor<256x1000xf32>
  }
}
