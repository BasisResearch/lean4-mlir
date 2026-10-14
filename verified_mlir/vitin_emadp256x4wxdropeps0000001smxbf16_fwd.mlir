module @m {
  func.func @vitin_emadp256x4wxdropeps0000001smxbf16_fwd(%x: tensor<256x150528xf32>, %wConv: tensor<192x3x16x16xf32>, %bConv: tensor<192xf32>, %cls: tensor<192xf32>, %pos: tensor<197x192xf32>, %b0_g1: tensor<192xf32>, %b0_bt1: tensor<192xf32>, %b0_Wq: tensor<192x192xf32>, %b0_bq: tensor<192xf32>, %b0_Wk: tensor<192x192xf32>, %b0_bk: tensor<192xf32>, %b0_Wv: tensor<192x192xf32>, %b0_bv: tensor<192xf32>, %b0_Wo: tensor<192x192xf32>, %b0_bo: tensor<192xf32>, %b0_g2: tensor<192xf32>, %b0_bt2: tensor<192xf32>, %b0_Wfc1: tensor<192x768xf32>, %b0_bfc1: tensor<768xf32>, %b0_Wfc2: tensor<768x192xf32>, %b0_bfc2: tensor<192xf32>, %b1_g1: tensor<192xf32>, %b1_bt1: tensor<192xf32>, %b1_Wq: tensor<192x192xf32>, %b1_bq: tensor<192xf32>, %b1_Wk: tensor<192x192xf32>, %b1_bk: tensor<192xf32>, %b1_Wv: tensor<192x192xf32>, %b1_bv: tensor<192xf32>, %b1_Wo: tensor<192x192xf32>, %b1_bo: tensor<192xf32>, %b1_g2: tensor<192xf32>, %b1_bt2: tensor<192xf32>, %b1_Wfc1: tensor<192x768xf32>, %b1_bfc1: tensor<768xf32>, %b1_Wfc2: tensor<768x192xf32>, %b1_bfc2: tensor<192xf32>, %b2_g1: tensor<192xf32>, %b2_bt1: tensor<192xf32>, %b2_Wq: tensor<192x192xf32>, %b2_bq: tensor<192xf32>, %b2_Wk: tensor<192x192xf32>, %b2_bk: tensor<192xf32>, %b2_Wv: tensor<192x192xf32>, %b2_bv: tensor<192xf32>, %b2_Wo: tensor<192x192xf32>, %b2_bo: tensor<192xf32>, %b2_g2: tensor<192xf32>, %b2_bt2: tensor<192xf32>, %b2_Wfc1: tensor<192x768xf32>, %b2_bfc1: tensor<768xf32>, %b2_Wfc2: tensor<768x192xf32>, %b2_bfc2: tensor<192xf32>, %b3_g1: tensor<192xf32>, %b3_bt1: tensor<192xf32>, %b3_Wq: tensor<192x192xf32>, %b3_bq: tensor<192xf32>, %b3_Wk: tensor<192x192xf32>, %b3_bk: tensor<192xf32>, %b3_Wv: tensor<192x192xf32>, %b3_bv: tensor<192xf32>, %b3_Wo: tensor<192x192xf32>, %b3_bo: tensor<192xf32>, %b3_g2: tensor<192xf32>, %b3_bt2: tensor<192xf32>, %b3_Wfc1: tensor<192x768xf32>, %b3_bfc1: tensor<768xf32>, %b3_Wfc2: tensor<768x192xf32>, %b3_bfc2: tensor<192xf32>, %b4_g1: tensor<192xf32>, %b4_bt1: tensor<192xf32>, %b4_Wq: tensor<192x192xf32>, %b4_bq: tensor<192xf32>, %b4_Wk: tensor<192x192xf32>, %b4_bk: tensor<192xf32>, %b4_Wv: tensor<192x192xf32>, %b4_bv: tensor<192xf32>, %b4_Wo: tensor<192x192xf32>, %b4_bo: tensor<192xf32>, %b4_g2: tensor<192xf32>, %b4_bt2: tensor<192xf32>, %b4_Wfc1: tensor<192x768xf32>, %b4_bfc1: tensor<768xf32>, %b4_Wfc2: tensor<768x192xf32>, %b4_bfc2: tensor<192xf32>, %b5_g1: tensor<192xf32>, %b5_bt1: tensor<192xf32>, %b5_Wq: tensor<192x192xf32>, %b5_bq: tensor<192xf32>, %b5_Wk: tensor<192x192xf32>, %b5_bk: tensor<192xf32>, %b5_Wv: tensor<192x192xf32>, %b5_bv: tensor<192xf32>, %b5_Wo: tensor<192x192xf32>, %b5_bo: tensor<192xf32>, %b5_g2: tensor<192xf32>, %b5_bt2: tensor<192xf32>, %b5_Wfc1: tensor<192x768xf32>, %b5_bfc1: tensor<768xf32>, %b5_Wfc2: tensor<768x192xf32>, %b5_bfc2: tensor<192xf32>, %b6_g1: tensor<192xf32>, %b6_bt1: tensor<192xf32>, %b6_Wq: tensor<192x192xf32>, %b6_bq: tensor<192xf32>, %b6_Wk: tensor<192x192xf32>, %b6_bk: tensor<192xf32>, %b6_Wv: tensor<192x192xf32>, %b6_bv: tensor<192xf32>, %b6_Wo: tensor<192x192xf32>, %b6_bo: tensor<192xf32>, %b6_g2: tensor<192xf32>, %b6_bt2: tensor<192xf32>, %b6_Wfc1: tensor<192x768xf32>, %b6_bfc1: tensor<768xf32>, %b6_Wfc2: tensor<768x192xf32>, %b6_bfc2: tensor<192xf32>, %b7_g1: tensor<192xf32>, %b7_bt1: tensor<192xf32>, %b7_Wq: tensor<192x192xf32>, %b7_bq: tensor<192xf32>, %b7_Wk: tensor<192x192xf32>, %b7_bk: tensor<192xf32>, %b7_Wv: tensor<192x192xf32>, %b7_bv: tensor<192xf32>, %b7_Wo: tensor<192x192xf32>, %b7_bo: tensor<192xf32>, %b7_g2: tensor<192xf32>, %b7_bt2: tensor<192xf32>, %b7_Wfc1: tensor<192x768xf32>, %b7_bfc1: tensor<768xf32>, %b7_Wfc2: tensor<768x192xf32>, %b7_bfc2: tensor<192xf32>, %b8_g1: tensor<192xf32>, %b8_bt1: tensor<192xf32>, %b8_Wq: tensor<192x192xf32>, %b8_bq: tensor<192xf32>, %b8_Wk: tensor<192x192xf32>, %b8_bk: tensor<192xf32>, %b8_Wv: tensor<192x192xf32>, %b8_bv: tensor<192xf32>, %b8_Wo: tensor<192x192xf32>, %b8_bo: tensor<192xf32>, %b8_g2: tensor<192xf32>, %b8_bt2: tensor<192xf32>, %b8_Wfc1: tensor<192x768xf32>, %b8_bfc1: tensor<768xf32>, %b8_Wfc2: tensor<768x192xf32>, %b8_bfc2: tensor<192xf32>, %b9_g1: tensor<192xf32>, %b9_bt1: tensor<192xf32>, %b9_Wq: tensor<192x192xf32>, %b9_bq: tensor<192xf32>, %b9_Wk: tensor<192x192xf32>, %b9_bk: tensor<192xf32>, %b9_Wv: tensor<192x192xf32>, %b9_bv: tensor<192xf32>, %b9_Wo: tensor<192x192xf32>, %b9_bo: tensor<192xf32>, %b9_g2: tensor<192xf32>, %b9_bt2: tensor<192xf32>, %b9_Wfc1: tensor<192x768xf32>, %b9_bfc1: tensor<768xf32>, %b9_Wfc2: tensor<768x192xf32>, %b9_bfc2: tensor<192xf32>, %b10_g1: tensor<192xf32>, %b10_bt1: tensor<192xf32>, %b10_Wq: tensor<192x192xf32>, %b10_bq: tensor<192xf32>, %b10_Wk: tensor<192x192xf32>, %b10_bk: tensor<192xf32>, %b10_Wv: tensor<192x192xf32>, %b10_bv: tensor<192xf32>, %b10_Wo: tensor<192x192xf32>, %b10_bo: tensor<192xf32>, %b10_g2: tensor<192xf32>, %b10_bt2: tensor<192xf32>, %b10_Wfc1: tensor<192x768xf32>, %b10_bfc1: tensor<768xf32>, %b10_Wfc2: tensor<768x192xf32>, %b10_bfc2: tensor<192xf32>, %b11_g1: tensor<192xf32>, %b11_bt1: tensor<192xf32>, %b11_Wq: tensor<192x192xf32>, %b11_bq: tensor<192xf32>, %b11_Wk: tensor<192x192xf32>, %b11_bk: tensor<192xf32>, %b11_Wv: tensor<192x192xf32>, %b11_bv: tensor<192xf32>, %b11_Wo: tensor<192x192xf32>, %b11_bo: tensor<192xf32>, %b11_g2: tensor<192xf32>, %b11_bt2: tensor<192xf32>, %b11_Wfc1: tensor<192x768xf32>, %b11_bfc1: tensor<768xf32>, %b11_Wfc2: tensor<768x192xf32>, %b11_bfc2: tensor<192xf32>, %gF: tensor<192xf32>, %btF: tensor<192xf32>, %Wc: tensor<192x1000xf32>, %bc: tensor<1000xf32>) -> tensor<256x1000xf32> {
    %one = stablehlo.constant dense<1.0> : tensor<f32>
    %zero = stablehlo.constant dense<0.0> : tensor<f32>
    %sc = stablehlo.constant dense<0.0> : tensor<f32>
    %v0 = stablehlo.reshape %x : (tensor<256x150528xf32>) -> tensor<256x3x224x224xf32>
    %v1 = stablehlo.convolution(%v0, %wConv)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [16, 16], pad = [[0, 0], [0, 0]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<256x3x224x224xf32>, tensor<192x3x16x16xf32>) -> tensor<256x192x14x14xf32>
    %v2 = stablehlo.broadcast_in_dim %bConv, dims = [1] : (tensor<192xf32>) -> tensor<256x192x14x14xf32>
    %v3 = stablehlo.add %v1, %v2 : tensor<256x192x14x14xf32>
    %v4 = stablehlo.transpose %v3, dims = [0, 2, 3, 1] : (tensor<256x192x14x14xf32>) -> tensor<256x14x14x192xf32>
    %v5 = stablehlo.reshape %v4 : (tensor<256x14x14x192xf32>) -> tensor<256x196x192xf32>
    %v6 = stablehlo.broadcast_in_dim %cls, dims = [2] : (tensor<192xf32>) -> tensor<256x1x192xf32>
    %v7 = stablehlo.concatenate %v6, %v5, dim = 1 : (tensor<256x1x192xf32>, tensor<256x196x192xf32>) -> tensor<256x197x192xf32>
    %v8 = stablehlo.broadcast_in_dim %pos, dims = [1, 2] : (tensor<197x192xf32>) -> tensor<256x197x192xf32>
    %v9 = stablehlo.add %v7, %v8 : tensor<256x197x192xf32>
    %v10 = stablehlo.reshape %v9 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v11 = stablehlo.reshape %v10 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v12 = stablehlo.constant dense<0.0> : tensor<f32>
    %v13 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v14 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v15 = stablehlo.reduce(%v11 init: %v12) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v16 = stablehlo.broadcast_in_dim %v15, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v17 = stablehlo.divide %v16, %v13 : tensor<256x197x192xf32>
    %v18 = stablehlo.subtract %v11, %v17 : tensor<256x197x192xf32>
    %v19 = stablehlo.multiply %v18, %v18 : tensor<256x197x192xf32>
    %v20 = stablehlo.reduce(%v19 init: %v12) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v21 = stablehlo.broadcast_in_dim %v20, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v22 = stablehlo.divide %v21, %v13 : tensor<256x197x192xf32>
    %v23 = stablehlo.add %v22, %v14 : tensor<256x197x192xf32>
    %v24 = stablehlo.rsqrt %v23 : tensor<256x197x192xf32>
    %v25 = stablehlo.multiply %v18, %v24 : tensor<256x197x192xf32>
    %v26 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v27 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v28 = stablehlo.multiply %v25, %v26 : tensor<256x197x192xf32>
    %v29 = stablehlo.add %v28, %v27 : tensor<256x197x192xf32>
    %v30 = stablehlo.reshape %v29 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v31 = stablehlo.reshape %v30 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v32 = stablehlo.broadcast_in_dim %b0_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v33 = stablehlo.multiply %v31, %v32 : tensor<256x197x192xf32>
    %v34 = stablehlo.reshape %v33 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v35 = stablehlo.reshape %v34 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v36 = stablehlo.broadcast_in_dim %b0_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v37 = stablehlo.add %v35, %v36 : tensor<256x197x192xf32>
    %v38 = stablehlo.reshape %v37 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v39 = stablehlo.reshape %v38 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v40 = stablehlo.dot_general %v39, %b0_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v41 = stablehlo.broadcast_in_dim %b0_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v42 = stablehlo.add %v40, %v41 : tensor<256x197x192xf32>
    %v43 = stablehlo.reshape %v42 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v44 = stablehlo.reshape %v38 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v45 = stablehlo.dot_general %v44, %b0_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v46 = stablehlo.broadcast_in_dim %b0_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v47 = stablehlo.add %v45, %v46 : tensor<256x197x192xf32>
    %v48 = stablehlo.reshape %v47 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v49 = stablehlo.reshape %v38 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v50 = stablehlo.dot_general %v49, %b0_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v51 = stablehlo.broadcast_in_dim %b0_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v52 = stablehlo.add %v50, %v51 : tensor<256x197x192xf32>
    %v53 = stablehlo.reshape %v52 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v54 = stablehlo.reshape %v43 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v55 = stablehlo.slice %v54 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v56 = stablehlo.reshape %v55 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v57 = stablehlo.reshape %v48 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v58 = stablehlo.slice %v57 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v59 = stablehlo.reshape %v58 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v60 = stablehlo.reshape %v53 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v61 = stablehlo.slice %v60 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
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
    %v89 = stablehlo.pad %v87, %v88, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v90 = stablehlo.reshape %v89 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v91 = stablehlo.reshape %v43 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v92 = stablehlo.slice %v91 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v93 = stablehlo.reshape %v92 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v94 = stablehlo.reshape %v48 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v95 = stablehlo.slice %v94 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v96 = stablehlo.reshape %v95 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v97 = stablehlo.reshape %v53 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v98 = stablehlo.slice %v97 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
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
    %v126 = stablehlo.pad %v124, %v125, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v127 = stablehlo.reshape %v126 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v128 = stablehlo.add %v90, %v127 : tensor<256x37824xf32>
    %v129 = stablehlo.reshape %v43 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v130 = stablehlo.slice %v129 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v131 = stablehlo.reshape %v130 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v132 = stablehlo.reshape %v48 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v133 = stablehlo.slice %v132 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v134 = stablehlo.reshape %v133 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v135 = stablehlo.reshape %v53 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v136 = stablehlo.slice %v135 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
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
    %v164 = stablehlo.pad %v162, %v163, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v165 = stablehlo.reshape %v164 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v166 = stablehlo.add %v128, %v165 : tensor<256x37824xf32>
    %v167 = stablehlo.reshape %v166 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v168 = stablehlo.dot_general %v167, %b0_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v169 = stablehlo.broadcast_in_dim %b0_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v170 = stablehlo.add %v168, %v169 : tensor<256x197x192xf32>
    %v171 = stablehlo.reshape %v170 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v172 = stablehlo.add %v10, %v171 : tensor<256x37824xf32>
    %v173 = stablehlo.reshape %v172 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v174 = stablehlo.constant dense<0.0> : tensor<f32>
    %v175 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v176 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v177 = stablehlo.reduce(%v173 init: %v174) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v178 = stablehlo.broadcast_in_dim %v177, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v179 = stablehlo.divide %v178, %v175 : tensor<256x197x192xf32>
    %v180 = stablehlo.subtract %v173, %v179 : tensor<256x197x192xf32>
    %v181 = stablehlo.multiply %v180, %v180 : tensor<256x197x192xf32>
    %v182 = stablehlo.reduce(%v181 init: %v174) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v183 = stablehlo.broadcast_in_dim %v182, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v184 = stablehlo.divide %v183, %v175 : tensor<256x197x192xf32>
    %v185 = stablehlo.add %v184, %v176 : tensor<256x197x192xf32>
    %v186 = stablehlo.rsqrt %v185 : tensor<256x197x192xf32>
    %v187 = stablehlo.multiply %v180, %v186 : tensor<256x197x192xf32>
    %v188 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v189 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v190 = stablehlo.multiply %v187, %v188 : tensor<256x197x192xf32>
    %v191 = stablehlo.add %v190, %v189 : tensor<256x197x192xf32>
    %v192 = stablehlo.reshape %v191 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v193 = stablehlo.reshape %v192 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v194 = stablehlo.broadcast_in_dim %b0_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v195 = stablehlo.multiply %v193, %v194 : tensor<256x197x192xf32>
    %v196 = stablehlo.reshape %v195 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v197 = stablehlo.reshape %v196 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v198 = stablehlo.broadcast_in_dim %b0_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v199 = stablehlo.add %v197, %v198 : tensor<256x197x192xf32>
    %v200 = stablehlo.reshape %v199 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v201 = stablehlo.reshape %v200 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v202 = stablehlo.dot_general %v201, %b0_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v203 = stablehlo.broadcast_in_dim %b0_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v204 = stablehlo.add %v202, %v203 : tensor<256x197x768xf32>
    %v205 = stablehlo.reshape %v204 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v206 = stablehlo.multiply %v205, %v205 : tensor<256x151296xf32>
    %v207 = stablehlo.multiply %v206, %v205 : tensor<256x151296xf32>
    %v208 = stablehlo.constant dense<0.044715> : tensor<256x151296xf32>
    %v209 = stablehlo.multiply %v208, %v207 : tensor<256x151296xf32>
    %v210 = stablehlo.add %v205, %v209 : tensor<256x151296xf32>
    %v211 = stablehlo.constant dense<0.7978845608028654> : tensor<256x151296xf32>
    %v212 = stablehlo.multiply %v211, %v210 : tensor<256x151296xf32>
    %v213 = stablehlo.tanh %v212 : tensor<256x151296xf32>
    %v214 = stablehlo.constant dense<1.0> : tensor<256x151296xf32>
    %v215 = stablehlo.add %v214, %v213 : tensor<256x151296xf32>
    %v216 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v217 = stablehlo.multiply %v216, %v205 : tensor<256x151296xf32>
    %v218 = stablehlo.multiply %v217, %v215 : tensor<256x151296xf32>
    %v219 = stablehlo.reshape %v218 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v220 = stablehlo.dot_general %v219, %b0_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v221 = stablehlo.broadcast_in_dim %b0_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v222 = stablehlo.add %v220, %v221 : tensor<256x197x192xf32>
    %v223 = stablehlo.reshape %v222 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v224 = stablehlo.add %v172, %v223 : tensor<256x37824xf32>
    %v225 = stablehlo.reshape %v224 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v226 = stablehlo.constant dense<0.0> : tensor<f32>
    %v227 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v228 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v229 = stablehlo.reduce(%v225 init: %v226) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v230 = stablehlo.broadcast_in_dim %v229, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v231 = stablehlo.divide %v230, %v227 : tensor<256x197x192xf32>
    %v232 = stablehlo.subtract %v225, %v231 : tensor<256x197x192xf32>
    %v233 = stablehlo.multiply %v232, %v232 : tensor<256x197x192xf32>
    %v234 = stablehlo.reduce(%v233 init: %v226) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v235 = stablehlo.broadcast_in_dim %v234, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v236 = stablehlo.divide %v235, %v227 : tensor<256x197x192xf32>
    %v237 = stablehlo.add %v236, %v228 : tensor<256x197x192xf32>
    %v238 = stablehlo.rsqrt %v237 : tensor<256x197x192xf32>
    %v239 = stablehlo.multiply %v232, %v238 : tensor<256x197x192xf32>
    %v240 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v241 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v242 = stablehlo.multiply %v239, %v240 : tensor<256x197x192xf32>
    %v243 = stablehlo.add %v242, %v241 : tensor<256x197x192xf32>
    %v244 = stablehlo.reshape %v243 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v245 = stablehlo.reshape %v244 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v246 = stablehlo.broadcast_in_dim %b1_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v247 = stablehlo.multiply %v245, %v246 : tensor<256x197x192xf32>
    %v248 = stablehlo.reshape %v247 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v249 = stablehlo.reshape %v248 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v250 = stablehlo.broadcast_in_dim %b1_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v251 = stablehlo.add %v249, %v250 : tensor<256x197x192xf32>
    %v252 = stablehlo.reshape %v251 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v253 = stablehlo.reshape %v252 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v254 = stablehlo.dot_general %v253, %b1_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v255 = stablehlo.broadcast_in_dim %b1_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v256 = stablehlo.add %v254, %v255 : tensor<256x197x192xf32>
    %v257 = stablehlo.reshape %v256 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v258 = stablehlo.reshape %v252 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v259 = stablehlo.dot_general %v258, %b1_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v260 = stablehlo.broadcast_in_dim %b1_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v261 = stablehlo.add %v259, %v260 : tensor<256x197x192xf32>
    %v262 = stablehlo.reshape %v261 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v263 = stablehlo.reshape %v252 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v264 = stablehlo.dot_general %v263, %b1_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v265 = stablehlo.broadcast_in_dim %b1_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v266 = stablehlo.add %v264, %v265 : tensor<256x197x192xf32>
    %v267 = stablehlo.reshape %v266 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v268 = stablehlo.reshape %v257 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v269 = stablehlo.slice %v268 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v270 = stablehlo.reshape %v269 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v271 = stablehlo.reshape %v262 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v272 = stablehlo.slice %v271 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v273 = stablehlo.reshape %v272 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v274 = stablehlo.reshape %v267 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v275 = stablehlo.slice %v274 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v276 = stablehlo.reshape %v275 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v277 = stablehlo.reshape %v273 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v278 = stablehlo.transpose %v277, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v279 = stablehlo.reshape %v278 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v280 = stablehlo.reshape %v270 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v281 = stablehlo.reshape %v279 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v282 = stablehlo.dot_general %v280, %v281, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v283 = stablehlo.reshape %v282 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v284 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v285 = stablehlo.multiply %v283, %v284 : tensor<256x38809xf32>
    %v286 = stablehlo.reshape %v285 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v287 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v288 = stablehlo.reduce(%v286 init: %v287) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v289 = stablehlo.broadcast_in_dim %v288, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v290 = stablehlo.subtract %v286, %v289 : tensor<256x197x197xf32>
    %v291 = stablehlo.constant dense<0.0> : tensor<f32>
    %v292 = stablehlo.exponential %v290 : tensor<256x197x197xf32>
    %v293 = stablehlo.reduce(%v292 init: %v291) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v294 = stablehlo.broadcast_in_dim %v293, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v295 = stablehlo.divide %v292, %v294 : tensor<256x197x197xf32>
    %v296 = stablehlo.reshape %v295 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v297 = stablehlo.reshape %v296 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v298 = stablehlo.reshape %v276 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v299 = stablehlo.dot_general %v297, %v298, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v300 = stablehlo.reshape %v299 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v301 = stablehlo.reshape %v300 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v302 = stablehlo.constant dense<0.0> : tensor<f32>
    %v303 = stablehlo.pad %v301, %v302, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v304 = stablehlo.reshape %v303 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v305 = stablehlo.reshape %v257 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v306 = stablehlo.slice %v305 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v307 = stablehlo.reshape %v306 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v308 = stablehlo.reshape %v262 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v309 = stablehlo.slice %v308 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v310 = stablehlo.reshape %v309 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v311 = stablehlo.reshape %v267 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v312 = stablehlo.slice %v311 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v313 = stablehlo.reshape %v312 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v314 = stablehlo.reshape %v310 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v315 = stablehlo.transpose %v314, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v316 = stablehlo.reshape %v315 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v317 = stablehlo.reshape %v307 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v318 = stablehlo.reshape %v316 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v319 = stablehlo.dot_general %v317, %v318, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v320 = stablehlo.reshape %v319 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v321 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v322 = stablehlo.multiply %v320, %v321 : tensor<256x38809xf32>
    %v323 = stablehlo.reshape %v322 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v324 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v325 = stablehlo.reduce(%v323 init: %v324) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v326 = stablehlo.broadcast_in_dim %v325, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v327 = stablehlo.subtract %v323, %v326 : tensor<256x197x197xf32>
    %v328 = stablehlo.constant dense<0.0> : tensor<f32>
    %v329 = stablehlo.exponential %v327 : tensor<256x197x197xf32>
    %v330 = stablehlo.reduce(%v329 init: %v328) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v331 = stablehlo.broadcast_in_dim %v330, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v332 = stablehlo.divide %v329, %v331 : tensor<256x197x197xf32>
    %v333 = stablehlo.reshape %v332 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v334 = stablehlo.reshape %v333 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v335 = stablehlo.reshape %v313 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v336 = stablehlo.dot_general %v334, %v335, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v337 = stablehlo.reshape %v336 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v338 = stablehlo.reshape %v337 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v339 = stablehlo.constant dense<0.0> : tensor<f32>
    %v340 = stablehlo.pad %v338, %v339, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v341 = stablehlo.reshape %v340 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v342 = stablehlo.add %v304, %v341 : tensor<256x37824xf32>
    %v343 = stablehlo.reshape %v257 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v344 = stablehlo.slice %v343 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v345 = stablehlo.reshape %v344 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v346 = stablehlo.reshape %v262 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v347 = stablehlo.slice %v346 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v348 = stablehlo.reshape %v347 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v349 = stablehlo.reshape %v267 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v350 = stablehlo.slice %v349 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v351 = stablehlo.reshape %v350 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v352 = stablehlo.reshape %v348 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v353 = stablehlo.transpose %v352, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v354 = stablehlo.reshape %v353 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v355 = stablehlo.reshape %v345 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v356 = stablehlo.reshape %v354 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v357 = stablehlo.dot_general %v355, %v356, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v358 = stablehlo.reshape %v357 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v359 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v360 = stablehlo.multiply %v358, %v359 : tensor<256x38809xf32>
    %v361 = stablehlo.reshape %v360 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v362 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v363 = stablehlo.reduce(%v361 init: %v362) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v364 = stablehlo.broadcast_in_dim %v363, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v365 = stablehlo.subtract %v361, %v364 : tensor<256x197x197xf32>
    %v366 = stablehlo.constant dense<0.0> : tensor<f32>
    %v367 = stablehlo.exponential %v365 : tensor<256x197x197xf32>
    %v368 = stablehlo.reduce(%v367 init: %v366) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v369 = stablehlo.broadcast_in_dim %v368, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v370 = stablehlo.divide %v367, %v369 : tensor<256x197x197xf32>
    %v371 = stablehlo.reshape %v370 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v372 = stablehlo.reshape %v371 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v373 = stablehlo.reshape %v351 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v374 = stablehlo.dot_general %v372, %v373, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v375 = stablehlo.reshape %v374 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v376 = stablehlo.reshape %v375 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v377 = stablehlo.constant dense<0.0> : tensor<f32>
    %v378 = stablehlo.pad %v376, %v377, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v379 = stablehlo.reshape %v378 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v380 = stablehlo.add %v342, %v379 : tensor<256x37824xf32>
    %v381 = stablehlo.reshape %v380 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v382 = stablehlo.dot_general %v381, %b1_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v383 = stablehlo.broadcast_in_dim %b1_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v384 = stablehlo.add %v382, %v383 : tensor<256x197x192xf32>
    %v385 = stablehlo.reshape %v384 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v386 = stablehlo.add %v224, %v385 : tensor<256x37824xf32>
    %v387 = stablehlo.reshape %v386 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v388 = stablehlo.constant dense<0.0> : tensor<f32>
    %v389 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v390 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v391 = stablehlo.reduce(%v387 init: %v388) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v392 = stablehlo.broadcast_in_dim %v391, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v393 = stablehlo.divide %v392, %v389 : tensor<256x197x192xf32>
    %v394 = stablehlo.subtract %v387, %v393 : tensor<256x197x192xf32>
    %v395 = stablehlo.multiply %v394, %v394 : tensor<256x197x192xf32>
    %v396 = stablehlo.reduce(%v395 init: %v388) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v397 = stablehlo.broadcast_in_dim %v396, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v398 = stablehlo.divide %v397, %v389 : tensor<256x197x192xf32>
    %v399 = stablehlo.add %v398, %v390 : tensor<256x197x192xf32>
    %v400 = stablehlo.rsqrt %v399 : tensor<256x197x192xf32>
    %v401 = stablehlo.multiply %v394, %v400 : tensor<256x197x192xf32>
    %v402 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v403 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v404 = stablehlo.multiply %v401, %v402 : tensor<256x197x192xf32>
    %v405 = stablehlo.add %v404, %v403 : tensor<256x197x192xf32>
    %v406 = stablehlo.reshape %v405 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v407 = stablehlo.reshape %v406 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v408 = stablehlo.broadcast_in_dim %b1_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v409 = stablehlo.multiply %v407, %v408 : tensor<256x197x192xf32>
    %v410 = stablehlo.reshape %v409 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v411 = stablehlo.reshape %v410 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v412 = stablehlo.broadcast_in_dim %b1_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v413 = stablehlo.add %v411, %v412 : tensor<256x197x192xf32>
    %v414 = stablehlo.reshape %v413 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v415 = stablehlo.reshape %v414 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v416 = stablehlo.dot_general %v415, %b1_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v417 = stablehlo.broadcast_in_dim %b1_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v418 = stablehlo.add %v416, %v417 : tensor<256x197x768xf32>
    %v419 = stablehlo.reshape %v418 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v420 = stablehlo.multiply %v419, %v419 : tensor<256x151296xf32>
    %v421 = stablehlo.multiply %v420, %v419 : tensor<256x151296xf32>
    %v422 = stablehlo.constant dense<0.044715> : tensor<256x151296xf32>
    %v423 = stablehlo.multiply %v422, %v421 : tensor<256x151296xf32>
    %v424 = stablehlo.add %v419, %v423 : tensor<256x151296xf32>
    %v425 = stablehlo.constant dense<0.7978845608028654> : tensor<256x151296xf32>
    %v426 = stablehlo.multiply %v425, %v424 : tensor<256x151296xf32>
    %v427 = stablehlo.tanh %v426 : tensor<256x151296xf32>
    %v428 = stablehlo.constant dense<1.0> : tensor<256x151296xf32>
    %v429 = stablehlo.add %v428, %v427 : tensor<256x151296xf32>
    %v430 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v431 = stablehlo.multiply %v430, %v419 : tensor<256x151296xf32>
    %v432 = stablehlo.multiply %v431, %v429 : tensor<256x151296xf32>
    %v433 = stablehlo.reshape %v432 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v434 = stablehlo.dot_general %v433, %b1_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v435 = stablehlo.broadcast_in_dim %b1_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v436 = stablehlo.add %v434, %v435 : tensor<256x197x192xf32>
    %v437 = stablehlo.reshape %v436 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v438 = stablehlo.add %v386, %v437 : tensor<256x37824xf32>
    %v439 = stablehlo.reshape %v438 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v440 = stablehlo.constant dense<0.0> : tensor<f32>
    %v441 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v442 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v443 = stablehlo.reduce(%v439 init: %v440) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v444 = stablehlo.broadcast_in_dim %v443, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v445 = stablehlo.divide %v444, %v441 : tensor<256x197x192xf32>
    %v446 = stablehlo.subtract %v439, %v445 : tensor<256x197x192xf32>
    %v447 = stablehlo.multiply %v446, %v446 : tensor<256x197x192xf32>
    %v448 = stablehlo.reduce(%v447 init: %v440) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v449 = stablehlo.broadcast_in_dim %v448, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v450 = stablehlo.divide %v449, %v441 : tensor<256x197x192xf32>
    %v451 = stablehlo.add %v450, %v442 : tensor<256x197x192xf32>
    %v452 = stablehlo.rsqrt %v451 : tensor<256x197x192xf32>
    %v453 = stablehlo.multiply %v446, %v452 : tensor<256x197x192xf32>
    %v454 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v455 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v456 = stablehlo.multiply %v453, %v454 : tensor<256x197x192xf32>
    %v457 = stablehlo.add %v456, %v455 : tensor<256x197x192xf32>
    %v458 = stablehlo.reshape %v457 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v459 = stablehlo.reshape %v458 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v460 = stablehlo.broadcast_in_dim %b2_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v461 = stablehlo.multiply %v459, %v460 : tensor<256x197x192xf32>
    %v462 = stablehlo.reshape %v461 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v463 = stablehlo.reshape %v462 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v464 = stablehlo.broadcast_in_dim %b2_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v465 = stablehlo.add %v463, %v464 : tensor<256x197x192xf32>
    %v466 = stablehlo.reshape %v465 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v467 = stablehlo.reshape %v466 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v468 = stablehlo.dot_general %v467, %b2_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v469 = stablehlo.broadcast_in_dim %b2_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v470 = stablehlo.add %v468, %v469 : tensor<256x197x192xf32>
    %v471 = stablehlo.reshape %v470 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v472 = stablehlo.reshape %v466 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v473 = stablehlo.dot_general %v472, %b2_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v474 = stablehlo.broadcast_in_dim %b2_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v475 = stablehlo.add %v473, %v474 : tensor<256x197x192xf32>
    %v476 = stablehlo.reshape %v475 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v477 = stablehlo.reshape %v466 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v478 = stablehlo.dot_general %v477, %b2_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v479 = stablehlo.broadcast_in_dim %b2_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v480 = stablehlo.add %v478, %v479 : tensor<256x197x192xf32>
    %v481 = stablehlo.reshape %v480 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v482 = stablehlo.reshape %v471 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v483 = stablehlo.slice %v482 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v484 = stablehlo.reshape %v483 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v485 = stablehlo.reshape %v476 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v486 = stablehlo.slice %v485 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v487 = stablehlo.reshape %v486 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v488 = stablehlo.reshape %v481 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v489 = stablehlo.slice %v488 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v490 = stablehlo.reshape %v489 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v491 = stablehlo.reshape %v487 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v492 = stablehlo.transpose %v491, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v493 = stablehlo.reshape %v492 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v494 = stablehlo.reshape %v484 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v495 = stablehlo.reshape %v493 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v496 = stablehlo.dot_general %v494, %v495, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v497 = stablehlo.reshape %v496 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v498 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v499 = stablehlo.multiply %v497, %v498 : tensor<256x38809xf32>
    %v500 = stablehlo.reshape %v499 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v501 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v502 = stablehlo.reduce(%v500 init: %v501) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v503 = stablehlo.broadcast_in_dim %v502, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v504 = stablehlo.subtract %v500, %v503 : tensor<256x197x197xf32>
    %v505 = stablehlo.constant dense<0.0> : tensor<f32>
    %v506 = stablehlo.exponential %v504 : tensor<256x197x197xf32>
    %v507 = stablehlo.reduce(%v506 init: %v505) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v508 = stablehlo.broadcast_in_dim %v507, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v509 = stablehlo.divide %v506, %v508 : tensor<256x197x197xf32>
    %v510 = stablehlo.reshape %v509 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v511 = stablehlo.reshape %v510 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v512 = stablehlo.reshape %v490 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v513 = stablehlo.dot_general %v511, %v512, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v514 = stablehlo.reshape %v513 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v515 = stablehlo.reshape %v514 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v516 = stablehlo.constant dense<0.0> : tensor<f32>
    %v517 = stablehlo.pad %v515, %v516, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v518 = stablehlo.reshape %v517 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v519 = stablehlo.reshape %v471 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v520 = stablehlo.slice %v519 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v521 = stablehlo.reshape %v520 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v522 = stablehlo.reshape %v476 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v523 = stablehlo.slice %v522 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v524 = stablehlo.reshape %v523 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v525 = stablehlo.reshape %v481 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v526 = stablehlo.slice %v525 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v527 = stablehlo.reshape %v526 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v528 = stablehlo.reshape %v524 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v529 = stablehlo.transpose %v528, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v530 = stablehlo.reshape %v529 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v531 = stablehlo.reshape %v521 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v532 = stablehlo.reshape %v530 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v533 = stablehlo.dot_general %v531, %v532, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v534 = stablehlo.reshape %v533 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v535 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v536 = stablehlo.multiply %v534, %v535 : tensor<256x38809xf32>
    %v537 = stablehlo.reshape %v536 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v538 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v539 = stablehlo.reduce(%v537 init: %v538) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v540 = stablehlo.broadcast_in_dim %v539, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v541 = stablehlo.subtract %v537, %v540 : tensor<256x197x197xf32>
    %v542 = stablehlo.constant dense<0.0> : tensor<f32>
    %v543 = stablehlo.exponential %v541 : tensor<256x197x197xf32>
    %v544 = stablehlo.reduce(%v543 init: %v542) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v545 = stablehlo.broadcast_in_dim %v544, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v546 = stablehlo.divide %v543, %v545 : tensor<256x197x197xf32>
    %v547 = stablehlo.reshape %v546 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v548 = stablehlo.reshape %v547 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v549 = stablehlo.reshape %v527 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v550 = stablehlo.dot_general %v548, %v549, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v551 = stablehlo.reshape %v550 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v552 = stablehlo.reshape %v551 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v553 = stablehlo.constant dense<0.0> : tensor<f32>
    %v554 = stablehlo.pad %v552, %v553, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v555 = stablehlo.reshape %v554 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v556 = stablehlo.add %v518, %v555 : tensor<256x37824xf32>
    %v557 = stablehlo.reshape %v471 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v558 = stablehlo.slice %v557 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v559 = stablehlo.reshape %v558 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v560 = stablehlo.reshape %v476 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v561 = stablehlo.slice %v560 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v562 = stablehlo.reshape %v561 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v563 = stablehlo.reshape %v481 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v564 = stablehlo.slice %v563 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v565 = stablehlo.reshape %v564 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v566 = stablehlo.reshape %v562 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v567 = stablehlo.transpose %v566, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v568 = stablehlo.reshape %v567 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v569 = stablehlo.reshape %v559 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v570 = stablehlo.reshape %v568 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v571 = stablehlo.dot_general %v569, %v570, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v572 = stablehlo.reshape %v571 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v573 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v574 = stablehlo.multiply %v572, %v573 : tensor<256x38809xf32>
    %v575 = stablehlo.reshape %v574 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v576 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v577 = stablehlo.reduce(%v575 init: %v576) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v578 = stablehlo.broadcast_in_dim %v577, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v579 = stablehlo.subtract %v575, %v578 : tensor<256x197x197xf32>
    %v580 = stablehlo.constant dense<0.0> : tensor<f32>
    %v581 = stablehlo.exponential %v579 : tensor<256x197x197xf32>
    %v582 = stablehlo.reduce(%v581 init: %v580) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v583 = stablehlo.broadcast_in_dim %v582, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v584 = stablehlo.divide %v581, %v583 : tensor<256x197x197xf32>
    %v585 = stablehlo.reshape %v584 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v586 = stablehlo.reshape %v585 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v587 = stablehlo.reshape %v565 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v588 = stablehlo.dot_general %v586, %v587, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v589 = stablehlo.reshape %v588 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v590 = stablehlo.reshape %v589 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v591 = stablehlo.constant dense<0.0> : tensor<f32>
    %v592 = stablehlo.pad %v590, %v591, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v593 = stablehlo.reshape %v592 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v594 = stablehlo.add %v556, %v593 : tensor<256x37824xf32>
    %v595 = stablehlo.reshape %v594 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v596 = stablehlo.dot_general %v595, %b2_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v597 = stablehlo.broadcast_in_dim %b2_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v598 = stablehlo.add %v596, %v597 : tensor<256x197x192xf32>
    %v599 = stablehlo.reshape %v598 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v600 = stablehlo.add %v438, %v599 : tensor<256x37824xf32>
    %v601 = stablehlo.reshape %v600 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v602 = stablehlo.constant dense<0.0> : tensor<f32>
    %v603 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v604 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v605 = stablehlo.reduce(%v601 init: %v602) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v606 = stablehlo.broadcast_in_dim %v605, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v607 = stablehlo.divide %v606, %v603 : tensor<256x197x192xf32>
    %v608 = stablehlo.subtract %v601, %v607 : tensor<256x197x192xf32>
    %v609 = stablehlo.multiply %v608, %v608 : tensor<256x197x192xf32>
    %v610 = stablehlo.reduce(%v609 init: %v602) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v611 = stablehlo.broadcast_in_dim %v610, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v612 = stablehlo.divide %v611, %v603 : tensor<256x197x192xf32>
    %v613 = stablehlo.add %v612, %v604 : tensor<256x197x192xf32>
    %v614 = stablehlo.rsqrt %v613 : tensor<256x197x192xf32>
    %v615 = stablehlo.multiply %v608, %v614 : tensor<256x197x192xf32>
    %v616 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v617 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v618 = stablehlo.multiply %v615, %v616 : tensor<256x197x192xf32>
    %v619 = stablehlo.add %v618, %v617 : tensor<256x197x192xf32>
    %v620 = stablehlo.reshape %v619 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v621 = stablehlo.reshape %v620 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v622 = stablehlo.broadcast_in_dim %b2_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v623 = stablehlo.multiply %v621, %v622 : tensor<256x197x192xf32>
    %v624 = stablehlo.reshape %v623 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v625 = stablehlo.reshape %v624 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v626 = stablehlo.broadcast_in_dim %b2_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v627 = stablehlo.add %v625, %v626 : tensor<256x197x192xf32>
    %v628 = stablehlo.reshape %v627 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v629 = stablehlo.reshape %v628 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v630 = stablehlo.dot_general %v629, %b2_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v631 = stablehlo.broadcast_in_dim %b2_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v632 = stablehlo.add %v630, %v631 : tensor<256x197x768xf32>
    %v633 = stablehlo.reshape %v632 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v634 = stablehlo.multiply %v633, %v633 : tensor<256x151296xf32>
    %v635 = stablehlo.multiply %v634, %v633 : tensor<256x151296xf32>
    %v636 = stablehlo.constant dense<0.044715> : tensor<256x151296xf32>
    %v637 = stablehlo.multiply %v636, %v635 : tensor<256x151296xf32>
    %v638 = stablehlo.add %v633, %v637 : tensor<256x151296xf32>
    %v639 = stablehlo.constant dense<0.7978845608028654> : tensor<256x151296xf32>
    %v640 = stablehlo.multiply %v639, %v638 : tensor<256x151296xf32>
    %v641 = stablehlo.tanh %v640 : tensor<256x151296xf32>
    %v642 = stablehlo.constant dense<1.0> : tensor<256x151296xf32>
    %v643 = stablehlo.add %v642, %v641 : tensor<256x151296xf32>
    %v644 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v645 = stablehlo.multiply %v644, %v633 : tensor<256x151296xf32>
    %v646 = stablehlo.multiply %v645, %v643 : tensor<256x151296xf32>
    %v647 = stablehlo.reshape %v646 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v648 = stablehlo.dot_general %v647, %b2_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v649 = stablehlo.broadcast_in_dim %b2_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v650 = stablehlo.add %v648, %v649 : tensor<256x197x192xf32>
    %v651 = stablehlo.reshape %v650 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v652 = stablehlo.add %v600, %v651 : tensor<256x37824xf32>
    %v653 = stablehlo.reshape %v652 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v654 = stablehlo.constant dense<0.0> : tensor<f32>
    %v655 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v656 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v657 = stablehlo.reduce(%v653 init: %v654) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v658 = stablehlo.broadcast_in_dim %v657, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v659 = stablehlo.divide %v658, %v655 : tensor<256x197x192xf32>
    %v660 = stablehlo.subtract %v653, %v659 : tensor<256x197x192xf32>
    %v661 = stablehlo.multiply %v660, %v660 : tensor<256x197x192xf32>
    %v662 = stablehlo.reduce(%v661 init: %v654) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v663 = stablehlo.broadcast_in_dim %v662, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v664 = stablehlo.divide %v663, %v655 : tensor<256x197x192xf32>
    %v665 = stablehlo.add %v664, %v656 : tensor<256x197x192xf32>
    %v666 = stablehlo.rsqrt %v665 : tensor<256x197x192xf32>
    %v667 = stablehlo.multiply %v660, %v666 : tensor<256x197x192xf32>
    %v668 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v669 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v670 = stablehlo.multiply %v667, %v668 : tensor<256x197x192xf32>
    %v671 = stablehlo.add %v670, %v669 : tensor<256x197x192xf32>
    %v672 = stablehlo.reshape %v671 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v673 = stablehlo.reshape %v672 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v674 = stablehlo.broadcast_in_dim %b3_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v675 = stablehlo.multiply %v673, %v674 : tensor<256x197x192xf32>
    %v676 = stablehlo.reshape %v675 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v677 = stablehlo.reshape %v676 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v678 = stablehlo.broadcast_in_dim %b3_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v679 = stablehlo.add %v677, %v678 : tensor<256x197x192xf32>
    %v680 = stablehlo.reshape %v679 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v681 = stablehlo.reshape %v680 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v682 = stablehlo.dot_general %v681, %b3_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v683 = stablehlo.broadcast_in_dim %b3_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v684 = stablehlo.add %v682, %v683 : tensor<256x197x192xf32>
    %v685 = stablehlo.reshape %v684 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v686 = stablehlo.reshape %v680 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v687 = stablehlo.dot_general %v686, %b3_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v688 = stablehlo.broadcast_in_dim %b3_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v689 = stablehlo.add %v687, %v688 : tensor<256x197x192xf32>
    %v690 = stablehlo.reshape %v689 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v691 = stablehlo.reshape %v680 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v692 = stablehlo.dot_general %v691, %b3_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v693 = stablehlo.broadcast_in_dim %b3_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v694 = stablehlo.add %v692, %v693 : tensor<256x197x192xf32>
    %v695 = stablehlo.reshape %v694 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v696 = stablehlo.reshape %v685 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v697 = stablehlo.slice %v696 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v698 = stablehlo.reshape %v697 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v699 = stablehlo.reshape %v690 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v700 = stablehlo.slice %v699 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v701 = stablehlo.reshape %v700 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v702 = stablehlo.reshape %v695 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v703 = stablehlo.slice %v702 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v704 = stablehlo.reshape %v703 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v705 = stablehlo.reshape %v701 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v706 = stablehlo.transpose %v705, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v707 = stablehlo.reshape %v706 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v708 = stablehlo.reshape %v698 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v709 = stablehlo.reshape %v707 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v710 = stablehlo.dot_general %v708, %v709, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v711 = stablehlo.reshape %v710 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v712 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v713 = stablehlo.multiply %v711, %v712 : tensor<256x38809xf32>
    %v714 = stablehlo.reshape %v713 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v715 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v716 = stablehlo.reduce(%v714 init: %v715) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v717 = stablehlo.broadcast_in_dim %v716, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v718 = stablehlo.subtract %v714, %v717 : tensor<256x197x197xf32>
    %v719 = stablehlo.constant dense<0.0> : tensor<f32>
    %v720 = stablehlo.exponential %v718 : tensor<256x197x197xf32>
    %v721 = stablehlo.reduce(%v720 init: %v719) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v722 = stablehlo.broadcast_in_dim %v721, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v723 = stablehlo.divide %v720, %v722 : tensor<256x197x197xf32>
    %v724 = stablehlo.reshape %v723 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v725 = stablehlo.reshape %v724 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v726 = stablehlo.reshape %v704 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v727 = stablehlo.dot_general %v725, %v726, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v728 = stablehlo.reshape %v727 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v729 = stablehlo.reshape %v728 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v730 = stablehlo.constant dense<0.0> : tensor<f32>
    %v731 = stablehlo.pad %v729, %v730, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v732 = stablehlo.reshape %v731 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v733 = stablehlo.reshape %v685 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v734 = stablehlo.slice %v733 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v735 = stablehlo.reshape %v734 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v736 = stablehlo.reshape %v690 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v737 = stablehlo.slice %v736 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v738 = stablehlo.reshape %v737 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v739 = stablehlo.reshape %v695 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v740 = stablehlo.slice %v739 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v741 = stablehlo.reshape %v740 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v742 = stablehlo.reshape %v738 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v743 = stablehlo.transpose %v742, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v744 = stablehlo.reshape %v743 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v745 = stablehlo.reshape %v735 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v746 = stablehlo.reshape %v744 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v747 = stablehlo.dot_general %v745, %v746, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v748 = stablehlo.reshape %v747 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v749 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v750 = stablehlo.multiply %v748, %v749 : tensor<256x38809xf32>
    %v751 = stablehlo.reshape %v750 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v752 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v753 = stablehlo.reduce(%v751 init: %v752) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v754 = stablehlo.broadcast_in_dim %v753, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v755 = stablehlo.subtract %v751, %v754 : tensor<256x197x197xf32>
    %v756 = stablehlo.constant dense<0.0> : tensor<f32>
    %v757 = stablehlo.exponential %v755 : tensor<256x197x197xf32>
    %v758 = stablehlo.reduce(%v757 init: %v756) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v759 = stablehlo.broadcast_in_dim %v758, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v760 = stablehlo.divide %v757, %v759 : tensor<256x197x197xf32>
    %v761 = stablehlo.reshape %v760 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v762 = stablehlo.reshape %v761 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v763 = stablehlo.reshape %v741 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v764 = stablehlo.dot_general %v762, %v763, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v765 = stablehlo.reshape %v764 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v766 = stablehlo.reshape %v765 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v767 = stablehlo.constant dense<0.0> : tensor<f32>
    %v768 = stablehlo.pad %v766, %v767, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v769 = stablehlo.reshape %v768 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v770 = stablehlo.add %v732, %v769 : tensor<256x37824xf32>
    %v771 = stablehlo.reshape %v685 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v772 = stablehlo.slice %v771 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v773 = stablehlo.reshape %v772 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v774 = stablehlo.reshape %v690 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v775 = stablehlo.slice %v774 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v776 = stablehlo.reshape %v775 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v777 = stablehlo.reshape %v695 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v778 = stablehlo.slice %v777 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v779 = stablehlo.reshape %v778 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v780 = stablehlo.reshape %v776 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v781 = stablehlo.transpose %v780, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v782 = stablehlo.reshape %v781 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v783 = stablehlo.reshape %v773 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v784 = stablehlo.reshape %v782 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v785 = stablehlo.dot_general %v783, %v784, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v786 = stablehlo.reshape %v785 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v787 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v788 = stablehlo.multiply %v786, %v787 : tensor<256x38809xf32>
    %v789 = stablehlo.reshape %v788 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v790 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v791 = stablehlo.reduce(%v789 init: %v790) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v792 = stablehlo.broadcast_in_dim %v791, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v793 = stablehlo.subtract %v789, %v792 : tensor<256x197x197xf32>
    %v794 = stablehlo.constant dense<0.0> : tensor<f32>
    %v795 = stablehlo.exponential %v793 : tensor<256x197x197xf32>
    %v796 = stablehlo.reduce(%v795 init: %v794) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v797 = stablehlo.broadcast_in_dim %v796, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v798 = stablehlo.divide %v795, %v797 : tensor<256x197x197xf32>
    %v799 = stablehlo.reshape %v798 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v800 = stablehlo.reshape %v799 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v801 = stablehlo.reshape %v779 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v802 = stablehlo.dot_general %v800, %v801, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v803 = stablehlo.reshape %v802 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v804 = stablehlo.reshape %v803 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v805 = stablehlo.constant dense<0.0> : tensor<f32>
    %v806 = stablehlo.pad %v804, %v805, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v807 = stablehlo.reshape %v806 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v808 = stablehlo.add %v770, %v807 : tensor<256x37824xf32>
    %v809 = stablehlo.reshape %v808 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v810 = stablehlo.dot_general %v809, %b3_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v811 = stablehlo.broadcast_in_dim %b3_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v812 = stablehlo.add %v810, %v811 : tensor<256x197x192xf32>
    %v813 = stablehlo.reshape %v812 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v814 = stablehlo.add %v652, %v813 : tensor<256x37824xf32>
    %v815 = stablehlo.reshape %v814 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v816 = stablehlo.constant dense<0.0> : tensor<f32>
    %v817 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v818 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v819 = stablehlo.reduce(%v815 init: %v816) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v820 = stablehlo.broadcast_in_dim %v819, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v821 = stablehlo.divide %v820, %v817 : tensor<256x197x192xf32>
    %v822 = stablehlo.subtract %v815, %v821 : tensor<256x197x192xf32>
    %v823 = stablehlo.multiply %v822, %v822 : tensor<256x197x192xf32>
    %v824 = stablehlo.reduce(%v823 init: %v816) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v825 = stablehlo.broadcast_in_dim %v824, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v826 = stablehlo.divide %v825, %v817 : tensor<256x197x192xf32>
    %v827 = stablehlo.add %v826, %v818 : tensor<256x197x192xf32>
    %v828 = stablehlo.rsqrt %v827 : tensor<256x197x192xf32>
    %v829 = stablehlo.multiply %v822, %v828 : tensor<256x197x192xf32>
    %v830 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v831 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v832 = stablehlo.multiply %v829, %v830 : tensor<256x197x192xf32>
    %v833 = stablehlo.add %v832, %v831 : tensor<256x197x192xf32>
    %v834 = stablehlo.reshape %v833 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v835 = stablehlo.reshape %v834 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v836 = stablehlo.broadcast_in_dim %b3_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v837 = stablehlo.multiply %v835, %v836 : tensor<256x197x192xf32>
    %v838 = stablehlo.reshape %v837 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v839 = stablehlo.reshape %v838 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v840 = stablehlo.broadcast_in_dim %b3_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v841 = stablehlo.add %v839, %v840 : tensor<256x197x192xf32>
    %v842 = stablehlo.reshape %v841 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v843 = stablehlo.reshape %v842 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v844 = stablehlo.dot_general %v843, %b3_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v845 = stablehlo.broadcast_in_dim %b3_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v846 = stablehlo.add %v844, %v845 : tensor<256x197x768xf32>
    %v847 = stablehlo.reshape %v846 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v848 = stablehlo.multiply %v847, %v847 : tensor<256x151296xf32>
    %v849 = stablehlo.multiply %v848, %v847 : tensor<256x151296xf32>
    %v850 = stablehlo.constant dense<0.044715> : tensor<256x151296xf32>
    %v851 = stablehlo.multiply %v850, %v849 : tensor<256x151296xf32>
    %v852 = stablehlo.add %v847, %v851 : tensor<256x151296xf32>
    %v853 = stablehlo.constant dense<0.7978845608028654> : tensor<256x151296xf32>
    %v854 = stablehlo.multiply %v853, %v852 : tensor<256x151296xf32>
    %v855 = stablehlo.tanh %v854 : tensor<256x151296xf32>
    %v856 = stablehlo.constant dense<1.0> : tensor<256x151296xf32>
    %v857 = stablehlo.add %v856, %v855 : tensor<256x151296xf32>
    %v858 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v859 = stablehlo.multiply %v858, %v847 : tensor<256x151296xf32>
    %v860 = stablehlo.multiply %v859, %v857 : tensor<256x151296xf32>
    %v861 = stablehlo.reshape %v860 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v862 = stablehlo.dot_general %v861, %b3_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v863 = stablehlo.broadcast_in_dim %b3_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v864 = stablehlo.add %v862, %v863 : tensor<256x197x192xf32>
    %v865 = stablehlo.reshape %v864 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v866 = stablehlo.add %v814, %v865 : tensor<256x37824xf32>
    %v867 = stablehlo.reshape %v866 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v868 = stablehlo.constant dense<0.0> : tensor<f32>
    %v869 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v870 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v871 = stablehlo.reduce(%v867 init: %v868) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v872 = stablehlo.broadcast_in_dim %v871, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v873 = stablehlo.divide %v872, %v869 : tensor<256x197x192xf32>
    %v874 = stablehlo.subtract %v867, %v873 : tensor<256x197x192xf32>
    %v875 = stablehlo.multiply %v874, %v874 : tensor<256x197x192xf32>
    %v876 = stablehlo.reduce(%v875 init: %v868) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v877 = stablehlo.broadcast_in_dim %v876, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v878 = stablehlo.divide %v877, %v869 : tensor<256x197x192xf32>
    %v879 = stablehlo.add %v878, %v870 : tensor<256x197x192xf32>
    %v880 = stablehlo.rsqrt %v879 : tensor<256x197x192xf32>
    %v881 = stablehlo.multiply %v874, %v880 : tensor<256x197x192xf32>
    %v882 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v883 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v884 = stablehlo.multiply %v881, %v882 : tensor<256x197x192xf32>
    %v885 = stablehlo.add %v884, %v883 : tensor<256x197x192xf32>
    %v886 = stablehlo.reshape %v885 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v887 = stablehlo.reshape %v886 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v888 = stablehlo.broadcast_in_dim %b4_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v889 = stablehlo.multiply %v887, %v888 : tensor<256x197x192xf32>
    %v890 = stablehlo.reshape %v889 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v891 = stablehlo.reshape %v890 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v892 = stablehlo.broadcast_in_dim %b4_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v893 = stablehlo.add %v891, %v892 : tensor<256x197x192xf32>
    %v894 = stablehlo.reshape %v893 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v895 = stablehlo.reshape %v894 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v896 = stablehlo.dot_general %v895, %b4_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v897 = stablehlo.broadcast_in_dim %b4_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v898 = stablehlo.add %v896, %v897 : tensor<256x197x192xf32>
    %v899 = stablehlo.reshape %v898 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v900 = stablehlo.reshape %v894 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v901 = stablehlo.dot_general %v900, %b4_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v902 = stablehlo.broadcast_in_dim %b4_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v903 = stablehlo.add %v901, %v902 : tensor<256x197x192xf32>
    %v904 = stablehlo.reshape %v903 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v905 = stablehlo.reshape %v894 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v906 = stablehlo.dot_general %v905, %b4_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v907 = stablehlo.broadcast_in_dim %b4_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v908 = stablehlo.add %v906, %v907 : tensor<256x197x192xf32>
    %v909 = stablehlo.reshape %v908 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v910 = stablehlo.reshape %v899 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v911 = stablehlo.slice %v910 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v912 = stablehlo.reshape %v911 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v913 = stablehlo.reshape %v904 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v914 = stablehlo.slice %v913 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v915 = stablehlo.reshape %v914 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v916 = stablehlo.reshape %v909 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v917 = stablehlo.slice %v916 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v918 = stablehlo.reshape %v917 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v919 = stablehlo.reshape %v915 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v920 = stablehlo.transpose %v919, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v921 = stablehlo.reshape %v920 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v922 = stablehlo.reshape %v912 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v923 = stablehlo.reshape %v921 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v924 = stablehlo.dot_general %v922, %v923, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v925 = stablehlo.reshape %v924 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v926 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v927 = stablehlo.multiply %v925, %v926 : tensor<256x38809xf32>
    %v928 = stablehlo.reshape %v927 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v929 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v930 = stablehlo.reduce(%v928 init: %v929) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v931 = stablehlo.broadcast_in_dim %v930, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v932 = stablehlo.subtract %v928, %v931 : tensor<256x197x197xf32>
    %v933 = stablehlo.constant dense<0.0> : tensor<f32>
    %v934 = stablehlo.exponential %v932 : tensor<256x197x197xf32>
    %v935 = stablehlo.reduce(%v934 init: %v933) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v936 = stablehlo.broadcast_in_dim %v935, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v937 = stablehlo.divide %v934, %v936 : tensor<256x197x197xf32>
    %v938 = stablehlo.reshape %v937 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v939 = stablehlo.reshape %v938 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v940 = stablehlo.reshape %v918 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v941 = stablehlo.dot_general %v939, %v940, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v942 = stablehlo.reshape %v941 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v943 = stablehlo.reshape %v942 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v944 = stablehlo.constant dense<0.0> : tensor<f32>
    %v945 = stablehlo.pad %v943, %v944, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v946 = stablehlo.reshape %v945 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v947 = stablehlo.reshape %v899 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v948 = stablehlo.slice %v947 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v949 = stablehlo.reshape %v948 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v950 = stablehlo.reshape %v904 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v951 = stablehlo.slice %v950 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v952 = stablehlo.reshape %v951 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v953 = stablehlo.reshape %v909 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v954 = stablehlo.slice %v953 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v955 = stablehlo.reshape %v954 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v956 = stablehlo.reshape %v952 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v957 = stablehlo.transpose %v956, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v958 = stablehlo.reshape %v957 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v959 = stablehlo.reshape %v949 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v960 = stablehlo.reshape %v958 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v961 = stablehlo.dot_general %v959, %v960, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v962 = stablehlo.reshape %v961 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v963 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v964 = stablehlo.multiply %v962, %v963 : tensor<256x38809xf32>
    %v965 = stablehlo.reshape %v964 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v966 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v967 = stablehlo.reduce(%v965 init: %v966) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v968 = stablehlo.broadcast_in_dim %v967, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v969 = stablehlo.subtract %v965, %v968 : tensor<256x197x197xf32>
    %v970 = stablehlo.constant dense<0.0> : tensor<f32>
    %v971 = stablehlo.exponential %v969 : tensor<256x197x197xf32>
    %v972 = stablehlo.reduce(%v971 init: %v970) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v973 = stablehlo.broadcast_in_dim %v972, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v974 = stablehlo.divide %v971, %v973 : tensor<256x197x197xf32>
    %v975 = stablehlo.reshape %v974 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v976 = stablehlo.reshape %v975 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v977 = stablehlo.reshape %v955 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v978 = stablehlo.dot_general %v976, %v977, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v979 = stablehlo.reshape %v978 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v980 = stablehlo.reshape %v979 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v981 = stablehlo.constant dense<0.0> : tensor<f32>
    %v982 = stablehlo.pad %v980, %v981, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v983 = stablehlo.reshape %v982 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v984 = stablehlo.add %v946, %v983 : tensor<256x37824xf32>
    %v985 = stablehlo.reshape %v899 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v986 = stablehlo.slice %v985 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v987 = stablehlo.reshape %v986 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v988 = stablehlo.reshape %v904 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v989 = stablehlo.slice %v988 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v990 = stablehlo.reshape %v989 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v991 = stablehlo.reshape %v909 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v992 = stablehlo.slice %v991 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v993 = stablehlo.reshape %v992 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v994 = stablehlo.reshape %v990 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v995 = stablehlo.transpose %v994, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v996 = stablehlo.reshape %v995 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v997 = stablehlo.reshape %v987 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v998 = stablehlo.reshape %v996 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v999 = stablehlo.dot_general %v997, %v998, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1000 = stablehlo.reshape %v999 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1001 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1002 = stablehlo.multiply %v1000, %v1001 : tensor<256x38809xf32>
    %v1003 = stablehlo.reshape %v1002 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1004 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1005 = stablehlo.reduce(%v1003 init: %v1004) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1006 = stablehlo.broadcast_in_dim %v1005, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1007 = stablehlo.subtract %v1003, %v1006 : tensor<256x197x197xf32>
    %v1008 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1009 = stablehlo.exponential %v1007 : tensor<256x197x197xf32>
    %v1010 = stablehlo.reduce(%v1009 init: %v1008) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1011 = stablehlo.broadcast_in_dim %v1010, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1012 = stablehlo.divide %v1009, %v1011 : tensor<256x197x197xf32>
    %v1013 = stablehlo.reshape %v1012 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1014 = stablehlo.reshape %v1013 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1015 = stablehlo.reshape %v993 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1016 = stablehlo.dot_general %v1014, %v1015, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1017 = stablehlo.reshape %v1016 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1018 = stablehlo.reshape %v1017 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1019 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1020 = stablehlo.pad %v1018, %v1019, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1021 = stablehlo.reshape %v1020 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1022 = stablehlo.add %v984, %v1021 : tensor<256x37824xf32>
    %v1023 = stablehlo.reshape %v1022 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1024 = stablehlo.dot_general %v1023, %b4_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1025 = stablehlo.broadcast_in_dim %b4_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1026 = stablehlo.add %v1024, %v1025 : tensor<256x197x192xf32>
    %v1027 = stablehlo.reshape %v1026 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1028 = stablehlo.add %v866, %v1027 : tensor<256x37824xf32>
    %v1029 = stablehlo.reshape %v1028 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1030 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1031 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1032 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1033 = stablehlo.reduce(%v1029 init: %v1030) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1034 = stablehlo.broadcast_in_dim %v1033, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1035 = stablehlo.divide %v1034, %v1031 : tensor<256x197x192xf32>
    %v1036 = stablehlo.subtract %v1029, %v1035 : tensor<256x197x192xf32>
    %v1037 = stablehlo.multiply %v1036, %v1036 : tensor<256x197x192xf32>
    %v1038 = stablehlo.reduce(%v1037 init: %v1030) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1039 = stablehlo.broadcast_in_dim %v1038, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1040 = stablehlo.divide %v1039, %v1031 : tensor<256x197x192xf32>
    %v1041 = stablehlo.add %v1040, %v1032 : tensor<256x197x192xf32>
    %v1042 = stablehlo.rsqrt %v1041 : tensor<256x197x192xf32>
    %v1043 = stablehlo.multiply %v1036, %v1042 : tensor<256x197x192xf32>
    %v1044 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1045 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1046 = stablehlo.multiply %v1043, %v1044 : tensor<256x197x192xf32>
    %v1047 = stablehlo.add %v1046, %v1045 : tensor<256x197x192xf32>
    %v1048 = stablehlo.reshape %v1047 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1049 = stablehlo.reshape %v1048 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1050 = stablehlo.broadcast_in_dim %b4_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1051 = stablehlo.multiply %v1049, %v1050 : tensor<256x197x192xf32>
    %v1052 = stablehlo.reshape %v1051 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1053 = stablehlo.reshape %v1052 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1054 = stablehlo.broadcast_in_dim %b4_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1055 = stablehlo.add %v1053, %v1054 : tensor<256x197x192xf32>
    %v1056 = stablehlo.reshape %v1055 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1057 = stablehlo.reshape %v1056 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1058 = stablehlo.dot_general %v1057, %b4_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v1059 = stablehlo.broadcast_in_dim %b4_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v1060 = stablehlo.add %v1058, %v1059 : tensor<256x197x768xf32>
    %v1061 = stablehlo.reshape %v1060 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v1062 = stablehlo.multiply %v1061, %v1061 : tensor<256x151296xf32>
    %v1063 = stablehlo.multiply %v1062, %v1061 : tensor<256x151296xf32>
    %v1064 = stablehlo.constant dense<0.044715> : tensor<256x151296xf32>
    %v1065 = stablehlo.multiply %v1064, %v1063 : tensor<256x151296xf32>
    %v1066 = stablehlo.add %v1061, %v1065 : tensor<256x151296xf32>
    %v1067 = stablehlo.constant dense<0.7978845608028654> : tensor<256x151296xf32>
    %v1068 = stablehlo.multiply %v1067, %v1066 : tensor<256x151296xf32>
    %v1069 = stablehlo.tanh %v1068 : tensor<256x151296xf32>
    %v1070 = stablehlo.constant dense<1.0> : tensor<256x151296xf32>
    %v1071 = stablehlo.add %v1070, %v1069 : tensor<256x151296xf32>
    %v1072 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v1073 = stablehlo.multiply %v1072, %v1061 : tensor<256x151296xf32>
    %v1074 = stablehlo.multiply %v1073, %v1071 : tensor<256x151296xf32>
    %v1075 = stablehlo.reshape %v1074 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v1076 = stablehlo.dot_general %v1075, %b4_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v1077 = stablehlo.broadcast_in_dim %b4_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1078 = stablehlo.add %v1076, %v1077 : tensor<256x197x192xf32>
    %v1079 = stablehlo.reshape %v1078 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1080 = stablehlo.add %v1028, %v1079 : tensor<256x37824xf32>
    %v1081 = stablehlo.reshape %v1080 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1082 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1083 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1084 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1085 = stablehlo.reduce(%v1081 init: %v1082) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1086 = stablehlo.broadcast_in_dim %v1085, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1087 = stablehlo.divide %v1086, %v1083 : tensor<256x197x192xf32>
    %v1088 = stablehlo.subtract %v1081, %v1087 : tensor<256x197x192xf32>
    %v1089 = stablehlo.multiply %v1088, %v1088 : tensor<256x197x192xf32>
    %v1090 = stablehlo.reduce(%v1089 init: %v1082) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1091 = stablehlo.broadcast_in_dim %v1090, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1092 = stablehlo.divide %v1091, %v1083 : tensor<256x197x192xf32>
    %v1093 = stablehlo.add %v1092, %v1084 : tensor<256x197x192xf32>
    %v1094 = stablehlo.rsqrt %v1093 : tensor<256x197x192xf32>
    %v1095 = stablehlo.multiply %v1088, %v1094 : tensor<256x197x192xf32>
    %v1096 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1097 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1098 = stablehlo.multiply %v1095, %v1096 : tensor<256x197x192xf32>
    %v1099 = stablehlo.add %v1098, %v1097 : tensor<256x197x192xf32>
    %v1100 = stablehlo.reshape %v1099 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1101 = stablehlo.reshape %v1100 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1102 = stablehlo.broadcast_in_dim %b5_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1103 = stablehlo.multiply %v1101, %v1102 : tensor<256x197x192xf32>
    %v1104 = stablehlo.reshape %v1103 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1105 = stablehlo.reshape %v1104 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1106 = stablehlo.broadcast_in_dim %b5_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1107 = stablehlo.add %v1105, %v1106 : tensor<256x197x192xf32>
    %v1108 = stablehlo.reshape %v1107 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1109 = stablehlo.reshape %v1108 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1110 = stablehlo.dot_general %v1109, %b5_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1111 = stablehlo.broadcast_in_dim %b5_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1112 = stablehlo.add %v1110, %v1111 : tensor<256x197x192xf32>
    %v1113 = stablehlo.reshape %v1112 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1114 = stablehlo.reshape %v1108 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1115 = stablehlo.dot_general %v1114, %b5_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1116 = stablehlo.broadcast_in_dim %b5_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1117 = stablehlo.add %v1115, %v1116 : tensor<256x197x192xf32>
    %v1118 = stablehlo.reshape %v1117 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1119 = stablehlo.reshape %v1108 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1120 = stablehlo.dot_general %v1119, %b5_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1121 = stablehlo.broadcast_in_dim %b5_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1122 = stablehlo.add %v1120, %v1121 : tensor<256x197x192xf32>
    %v1123 = stablehlo.reshape %v1122 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1124 = stablehlo.reshape %v1113 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1125 = stablehlo.slice %v1124 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1126 = stablehlo.reshape %v1125 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1127 = stablehlo.reshape %v1118 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1128 = stablehlo.slice %v1127 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1129 = stablehlo.reshape %v1128 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1130 = stablehlo.reshape %v1123 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1131 = stablehlo.slice %v1130 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1132 = stablehlo.reshape %v1131 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1133 = stablehlo.reshape %v1129 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1134 = stablehlo.transpose %v1133, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1135 = stablehlo.reshape %v1134 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1136 = stablehlo.reshape %v1126 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1137 = stablehlo.reshape %v1135 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1138 = stablehlo.dot_general %v1136, %v1137, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1139 = stablehlo.reshape %v1138 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1140 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1141 = stablehlo.multiply %v1139, %v1140 : tensor<256x38809xf32>
    %v1142 = stablehlo.reshape %v1141 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1143 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1144 = stablehlo.reduce(%v1142 init: %v1143) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1145 = stablehlo.broadcast_in_dim %v1144, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1146 = stablehlo.subtract %v1142, %v1145 : tensor<256x197x197xf32>
    %v1147 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1148 = stablehlo.exponential %v1146 : tensor<256x197x197xf32>
    %v1149 = stablehlo.reduce(%v1148 init: %v1147) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1150 = stablehlo.broadcast_in_dim %v1149, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1151 = stablehlo.divide %v1148, %v1150 : tensor<256x197x197xf32>
    %v1152 = stablehlo.reshape %v1151 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1153 = stablehlo.reshape %v1152 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1154 = stablehlo.reshape %v1132 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1155 = stablehlo.dot_general %v1153, %v1154, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1156 = stablehlo.reshape %v1155 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1157 = stablehlo.reshape %v1156 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1158 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1159 = stablehlo.pad %v1157, %v1158, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1160 = stablehlo.reshape %v1159 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1161 = stablehlo.reshape %v1113 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1162 = stablehlo.slice %v1161 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1163 = stablehlo.reshape %v1162 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1164 = stablehlo.reshape %v1118 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1165 = stablehlo.slice %v1164 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1166 = stablehlo.reshape %v1165 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1167 = stablehlo.reshape %v1123 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1168 = stablehlo.slice %v1167 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1169 = stablehlo.reshape %v1168 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1170 = stablehlo.reshape %v1166 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1171 = stablehlo.transpose %v1170, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1172 = stablehlo.reshape %v1171 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1173 = stablehlo.reshape %v1163 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1174 = stablehlo.reshape %v1172 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1175 = stablehlo.dot_general %v1173, %v1174, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1176 = stablehlo.reshape %v1175 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1177 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1178 = stablehlo.multiply %v1176, %v1177 : tensor<256x38809xf32>
    %v1179 = stablehlo.reshape %v1178 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1180 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1181 = stablehlo.reduce(%v1179 init: %v1180) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1182 = stablehlo.broadcast_in_dim %v1181, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1183 = stablehlo.subtract %v1179, %v1182 : tensor<256x197x197xf32>
    %v1184 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1185 = stablehlo.exponential %v1183 : tensor<256x197x197xf32>
    %v1186 = stablehlo.reduce(%v1185 init: %v1184) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1187 = stablehlo.broadcast_in_dim %v1186, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1188 = stablehlo.divide %v1185, %v1187 : tensor<256x197x197xf32>
    %v1189 = stablehlo.reshape %v1188 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1190 = stablehlo.reshape %v1189 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1191 = stablehlo.reshape %v1169 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1192 = stablehlo.dot_general %v1190, %v1191, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1193 = stablehlo.reshape %v1192 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1194 = stablehlo.reshape %v1193 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1195 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1196 = stablehlo.pad %v1194, %v1195, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1197 = stablehlo.reshape %v1196 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1198 = stablehlo.add %v1160, %v1197 : tensor<256x37824xf32>
    %v1199 = stablehlo.reshape %v1113 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1200 = stablehlo.slice %v1199 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1201 = stablehlo.reshape %v1200 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1202 = stablehlo.reshape %v1118 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1203 = stablehlo.slice %v1202 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1204 = stablehlo.reshape %v1203 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1205 = stablehlo.reshape %v1123 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1206 = stablehlo.slice %v1205 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1207 = stablehlo.reshape %v1206 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1208 = stablehlo.reshape %v1204 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1209 = stablehlo.transpose %v1208, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1210 = stablehlo.reshape %v1209 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1211 = stablehlo.reshape %v1201 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1212 = stablehlo.reshape %v1210 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1213 = stablehlo.dot_general %v1211, %v1212, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1214 = stablehlo.reshape %v1213 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1215 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1216 = stablehlo.multiply %v1214, %v1215 : tensor<256x38809xf32>
    %v1217 = stablehlo.reshape %v1216 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1218 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1219 = stablehlo.reduce(%v1217 init: %v1218) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1220 = stablehlo.broadcast_in_dim %v1219, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1221 = stablehlo.subtract %v1217, %v1220 : tensor<256x197x197xf32>
    %v1222 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1223 = stablehlo.exponential %v1221 : tensor<256x197x197xf32>
    %v1224 = stablehlo.reduce(%v1223 init: %v1222) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1225 = stablehlo.broadcast_in_dim %v1224, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1226 = stablehlo.divide %v1223, %v1225 : tensor<256x197x197xf32>
    %v1227 = stablehlo.reshape %v1226 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1228 = stablehlo.reshape %v1227 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1229 = stablehlo.reshape %v1207 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1230 = stablehlo.dot_general %v1228, %v1229, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1231 = stablehlo.reshape %v1230 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1232 = stablehlo.reshape %v1231 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1233 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1234 = stablehlo.pad %v1232, %v1233, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1235 = stablehlo.reshape %v1234 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1236 = stablehlo.add %v1198, %v1235 : tensor<256x37824xf32>
    %v1237 = stablehlo.reshape %v1236 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1238 = stablehlo.dot_general %v1237, %b5_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1239 = stablehlo.broadcast_in_dim %b5_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1240 = stablehlo.add %v1238, %v1239 : tensor<256x197x192xf32>
    %v1241 = stablehlo.reshape %v1240 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1242 = stablehlo.add %v1080, %v1241 : tensor<256x37824xf32>
    %v1243 = stablehlo.reshape %v1242 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1244 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1245 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1246 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1247 = stablehlo.reduce(%v1243 init: %v1244) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1248 = stablehlo.broadcast_in_dim %v1247, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1249 = stablehlo.divide %v1248, %v1245 : tensor<256x197x192xf32>
    %v1250 = stablehlo.subtract %v1243, %v1249 : tensor<256x197x192xf32>
    %v1251 = stablehlo.multiply %v1250, %v1250 : tensor<256x197x192xf32>
    %v1252 = stablehlo.reduce(%v1251 init: %v1244) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1253 = stablehlo.broadcast_in_dim %v1252, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1254 = stablehlo.divide %v1253, %v1245 : tensor<256x197x192xf32>
    %v1255 = stablehlo.add %v1254, %v1246 : tensor<256x197x192xf32>
    %v1256 = stablehlo.rsqrt %v1255 : tensor<256x197x192xf32>
    %v1257 = stablehlo.multiply %v1250, %v1256 : tensor<256x197x192xf32>
    %v1258 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1259 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1260 = stablehlo.multiply %v1257, %v1258 : tensor<256x197x192xf32>
    %v1261 = stablehlo.add %v1260, %v1259 : tensor<256x197x192xf32>
    %v1262 = stablehlo.reshape %v1261 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1263 = stablehlo.reshape %v1262 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1264 = stablehlo.broadcast_in_dim %b5_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1265 = stablehlo.multiply %v1263, %v1264 : tensor<256x197x192xf32>
    %v1266 = stablehlo.reshape %v1265 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1267 = stablehlo.reshape %v1266 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1268 = stablehlo.broadcast_in_dim %b5_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1269 = stablehlo.add %v1267, %v1268 : tensor<256x197x192xf32>
    %v1270 = stablehlo.reshape %v1269 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1271 = stablehlo.reshape %v1270 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1272 = stablehlo.dot_general %v1271, %b5_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v1273 = stablehlo.broadcast_in_dim %b5_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v1274 = stablehlo.add %v1272, %v1273 : tensor<256x197x768xf32>
    %v1275 = stablehlo.reshape %v1274 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v1276 = stablehlo.multiply %v1275, %v1275 : tensor<256x151296xf32>
    %v1277 = stablehlo.multiply %v1276, %v1275 : tensor<256x151296xf32>
    %v1278 = stablehlo.constant dense<0.044715> : tensor<256x151296xf32>
    %v1279 = stablehlo.multiply %v1278, %v1277 : tensor<256x151296xf32>
    %v1280 = stablehlo.add %v1275, %v1279 : tensor<256x151296xf32>
    %v1281 = stablehlo.constant dense<0.7978845608028654> : tensor<256x151296xf32>
    %v1282 = stablehlo.multiply %v1281, %v1280 : tensor<256x151296xf32>
    %v1283 = stablehlo.tanh %v1282 : tensor<256x151296xf32>
    %v1284 = stablehlo.constant dense<1.0> : tensor<256x151296xf32>
    %v1285 = stablehlo.add %v1284, %v1283 : tensor<256x151296xf32>
    %v1286 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v1287 = stablehlo.multiply %v1286, %v1275 : tensor<256x151296xf32>
    %v1288 = stablehlo.multiply %v1287, %v1285 : tensor<256x151296xf32>
    %v1289 = stablehlo.reshape %v1288 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v1290 = stablehlo.dot_general %v1289, %b5_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v1291 = stablehlo.broadcast_in_dim %b5_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1292 = stablehlo.add %v1290, %v1291 : tensor<256x197x192xf32>
    %v1293 = stablehlo.reshape %v1292 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1294 = stablehlo.add %v1242, %v1293 : tensor<256x37824xf32>
    %v1295 = stablehlo.reshape %v1294 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1296 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1297 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1298 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1299 = stablehlo.reduce(%v1295 init: %v1296) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1300 = stablehlo.broadcast_in_dim %v1299, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1301 = stablehlo.divide %v1300, %v1297 : tensor<256x197x192xf32>
    %v1302 = stablehlo.subtract %v1295, %v1301 : tensor<256x197x192xf32>
    %v1303 = stablehlo.multiply %v1302, %v1302 : tensor<256x197x192xf32>
    %v1304 = stablehlo.reduce(%v1303 init: %v1296) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1305 = stablehlo.broadcast_in_dim %v1304, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1306 = stablehlo.divide %v1305, %v1297 : tensor<256x197x192xf32>
    %v1307 = stablehlo.add %v1306, %v1298 : tensor<256x197x192xf32>
    %v1308 = stablehlo.rsqrt %v1307 : tensor<256x197x192xf32>
    %v1309 = stablehlo.multiply %v1302, %v1308 : tensor<256x197x192xf32>
    %v1310 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1311 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1312 = stablehlo.multiply %v1309, %v1310 : tensor<256x197x192xf32>
    %v1313 = stablehlo.add %v1312, %v1311 : tensor<256x197x192xf32>
    %v1314 = stablehlo.reshape %v1313 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1315 = stablehlo.reshape %v1314 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1316 = stablehlo.broadcast_in_dim %b6_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1317 = stablehlo.multiply %v1315, %v1316 : tensor<256x197x192xf32>
    %v1318 = stablehlo.reshape %v1317 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1319 = stablehlo.reshape %v1318 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1320 = stablehlo.broadcast_in_dim %b6_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1321 = stablehlo.add %v1319, %v1320 : tensor<256x197x192xf32>
    %v1322 = stablehlo.reshape %v1321 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1323 = stablehlo.reshape %v1322 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1324 = stablehlo.dot_general %v1323, %b6_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1325 = stablehlo.broadcast_in_dim %b6_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1326 = stablehlo.add %v1324, %v1325 : tensor<256x197x192xf32>
    %v1327 = stablehlo.reshape %v1326 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1328 = stablehlo.reshape %v1322 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1329 = stablehlo.dot_general %v1328, %b6_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1330 = stablehlo.broadcast_in_dim %b6_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1331 = stablehlo.add %v1329, %v1330 : tensor<256x197x192xf32>
    %v1332 = stablehlo.reshape %v1331 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1333 = stablehlo.reshape %v1322 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1334 = stablehlo.dot_general %v1333, %b6_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1335 = stablehlo.broadcast_in_dim %b6_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1336 = stablehlo.add %v1334, %v1335 : tensor<256x197x192xf32>
    %v1337 = stablehlo.reshape %v1336 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1338 = stablehlo.reshape %v1327 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1339 = stablehlo.slice %v1338 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1340 = stablehlo.reshape %v1339 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1341 = stablehlo.reshape %v1332 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1342 = stablehlo.slice %v1341 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1343 = stablehlo.reshape %v1342 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1344 = stablehlo.reshape %v1337 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1345 = stablehlo.slice %v1344 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1346 = stablehlo.reshape %v1345 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1347 = stablehlo.reshape %v1343 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1348 = stablehlo.transpose %v1347, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1349 = stablehlo.reshape %v1348 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1350 = stablehlo.reshape %v1340 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1351 = stablehlo.reshape %v1349 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1352 = stablehlo.dot_general %v1350, %v1351, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1353 = stablehlo.reshape %v1352 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1354 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1355 = stablehlo.multiply %v1353, %v1354 : tensor<256x38809xf32>
    %v1356 = stablehlo.reshape %v1355 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1357 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1358 = stablehlo.reduce(%v1356 init: %v1357) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1359 = stablehlo.broadcast_in_dim %v1358, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1360 = stablehlo.subtract %v1356, %v1359 : tensor<256x197x197xf32>
    %v1361 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1362 = stablehlo.exponential %v1360 : tensor<256x197x197xf32>
    %v1363 = stablehlo.reduce(%v1362 init: %v1361) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1364 = stablehlo.broadcast_in_dim %v1363, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1365 = stablehlo.divide %v1362, %v1364 : tensor<256x197x197xf32>
    %v1366 = stablehlo.reshape %v1365 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1367 = stablehlo.reshape %v1366 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1368 = stablehlo.reshape %v1346 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1369 = stablehlo.dot_general %v1367, %v1368, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1370 = stablehlo.reshape %v1369 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1371 = stablehlo.reshape %v1370 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1372 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1373 = stablehlo.pad %v1371, %v1372, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1374 = stablehlo.reshape %v1373 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1375 = stablehlo.reshape %v1327 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1376 = stablehlo.slice %v1375 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1377 = stablehlo.reshape %v1376 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1378 = stablehlo.reshape %v1332 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1379 = stablehlo.slice %v1378 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1380 = stablehlo.reshape %v1379 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1381 = stablehlo.reshape %v1337 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1382 = stablehlo.slice %v1381 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1383 = stablehlo.reshape %v1382 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1384 = stablehlo.reshape %v1380 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1385 = stablehlo.transpose %v1384, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1386 = stablehlo.reshape %v1385 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1387 = stablehlo.reshape %v1377 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1388 = stablehlo.reshape %v1386 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1389 = stablehlo.dot_general %v1387, %v1388, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1390 = stablehlo.reshape %v1389 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1391 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1392 = stablehlo.multiply %v1390, %v1391 : tensor<256x38809xf32>
    %v1393 = stablehlo.reshape %v1392 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1394 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1395 = stablehlo.reduce(%v1393 init: %v1394) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1396 = stablehlo.broadcast_in_dim %v1395, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1397 = stablehlo.subtract %v1393, %v1396 : tensor<256x197x197xf32>
    %v1398 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1399 = stablehlo.exponential %v1397 : tensor<256x197x197xf32>
    %v1400 = stablehlo.reduce(%v1399 init: %v1398) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1401 = stablehlo.broadcast_in_dim %v1400, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1402 = stablehlo.divide %v1399, %v1401 : tensor<256x197x197xf32>
    %v1403 = stablehlo.reshape %v1402 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1404 = stablehlo.reshape %v1403 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1405 = stablehlo.reshape %v1383 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1406 = stablehlo.dot_general %v1404, %v1405, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1407 = stablehlo.reshape %v1406 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1408 = stablehlo.reshape %v1407 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1409 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1410 = stablehlo.pad %v1408, %v1409, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1411 = stablehlo.reshape %v1410 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1412 = stablehlo.add %v1374, %v1411 : tensor<256x37824xf32>
    %v1413 = stablehlo.reshape %v1327 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1414 = stablehlo.slice %v1413 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1415 = stablehlo.reshape %v1414 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1416 = stablehlo.reshape %v1332 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1417 = stablehlo.slice %v1416 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1418 = stablehlo.reshape %v1417 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1419 = stablehlo.reshape %v1337 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1420 = stablehlo.slice %v1419 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1421 = stablehlo.reshape %v1420 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1422 = stablehlo.reshape %v1418 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1423 = stablehlo.transpose %v1422, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1424 = stablehlo.reshape %v1423 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1425 = stablehlo.reshape %v1415 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1426 = stablehlo.reshape %v1424 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1427 = stablehlo.dot_general %v1425, %v1426, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1428 = stablehlo.reshape %v1427 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1429 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1430 = stablehlo.multiply %v1428, %v1429 : tensor<256x38809xf32>
    %v1431 = stablehlo.reshape %v1430 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1432 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1433 = stablehlo.reduce(%v1431 init: %v1432) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1434 = stablehlo.broadcast_in_dim %v1433, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1435 = stablehlo.subtract %v1431, %v1434 : tensor<256x197x197xf32>
    %v1436 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1437 = stablehlo.exponential %v1435 : tensor<256x197x197xf32>
    %v1438 = stablehlo.reduce(%v1437 init: %v1436) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1439 = stablehlo.broadcast_in_dim %v1438, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1440 = stablehlo.divide %v1437, %v1439 : tensor<256x197x197xf32>
    %v1441 = stablehlo.reshape %v1440 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1442 = stablehlo.reshape %v1441 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1443 = stablehlo.reshape %v1421 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1444 = stablehlo.dot_general %v1442, %v1443, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1445 = stablehlo.reshape %v1444 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1446 = stablehlo.reshape %v1445 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1447 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1448 = stablehlo.pad %v1446, %v1447, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1449 = stablehlo.reshape %v1448 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1450 = stablehlo.add %v1412, %v1449 : tensor<256x37824xf32>
    %v1451 = stablehlo.reshape %v1450 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1452 = stablehlo.dot_general %v1451, %b6_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1453 = stablehlo.broadcast_in_dim %b6_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1454 = stablehlo.add %v1452, %v1453 : tensor<256x197x192xf32>
    %v1455 = stablehlo.reshape %v1454 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1456 = stablehlo.add %v1294, %v1455 : tensor<256x37824xf32>
    %v1457 = stablehlo.reshape %v1456 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1458 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1459 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1460 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1461 = stablehlo.reduce(%v1457 init: %v1458) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1462 = stablehlo.broadcast_in_dim %v1461, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1463 = stablehlo.divide %v1462, %v1459 : tensor<256x197x192xf32>
    %v1464 = stablehlo.subtract %v1457, %v1463 : tensor<256x197x192xf32>
    %v1465 = stablehlo.multiply %v1464, %v1464 : tensor<256x197x192xf32>
    %v1466 = stablehlo.reduce(%v1465 init: %v1458) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1467 = stablehlo.broadcast_in_dim %v1466, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1468 = stablehlo.divide %v1467, %v1459 : tensor<256x197x192xf32>
    %v1469 = stablehlo.add %v1468, %v1460 : tensor<256x197x192xf32>
    %v1470 = stablehlo.rsqrt %v1469 : tensor<256x197x192xf32>
    %v1471 = stablehlo.multiply %v1464, %v1470 : tensor<256x197x192xf32>
    %v1472 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1473 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1474 = stablehlo.multiply %v1471, %v1472 : tensor<256x197x192xf32>
    %v1475 = stablehlo.add %v1474, %v1473 : tensor<256x197x192xf32>
    %v1476 = stablehlo.reshape %v1475 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1477 = stablehlo.reshape %v1476 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1478 = stablehlo.broadcast_in_dim %b6_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1479 = stablehlo.multiply %v1477, %v1478 : tensor<256x197x192xf32>
    %v1480 = stablehlo.reshape %v1479 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1481 = stablehlo.reshape %v1480 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1482 = stablehlo.broadcast_in_dim %b6_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1483 = stablehlo.add %v1481, %v1482 : tensor<256x197x192xf32>
    %v1484 = stablehlo.reshape %v1483 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1485 = stablehlo.reshape %v1484 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1486 = stablehlo.dot_general %v1485, %b6_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v1487 = stablehlo.broadcast_in_dim %b6_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v1488 = stablehlo.add %v1486, %v1487 : tensor<256x197x768xf32>
    %v1489 = stablehlo.reshape %v1488 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v1490 = stablehlo.multiply %v1489, %v1489 : tensor<256x151296xf32>
    %v1491 = stablehlo.multiply %v1490, %v1489 : tensor<256x151296xf32>
    %v1492 = stablehlo.constant dense<0.044715> : tensor<256x151296xf32>
    %v1493 = stablehlo.multiply %v1492, %v1491 : tensor<256x151296xf32>
    %v1494 = stablehlo.add %v1489, %v1493 : tensor<256x151296xf32>
    %v1495 = stablehlo.constant dense<0.7978845608028654> : tensor<256x151296xf32>
    %v1496 = stablehlo.multiply %v1495, %v1494 : tensor<256x151296xf32>
    %v1497 = stablehlo.tanh %v1496 : tensor<256x151296xf32>
    %v1498 = stablehlo.constant dense<1.0> : tensor<256x151296xf32>
    %v1499 = stablehlo.add %v1498, %v1497 : tensor<256x151296xf32>
    %v1500 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v1501 = stablehlo.multiply %v1500, %v1489 : tensor<256x151296xf32>
    %v1502 = stablehlo.multiply %v1501, %v1499 : tensor<256x151296xf32>
    %v1503 = stablehlo.reshape %v1502 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v1504 = stablehlo.dot_general %v1503, %b6_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v1505 = stablehlo.broadcast_in_dim %b6_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1506 = stablehlo.add %v1504, %v1505 : tensor<256x197x192xf32>
    %v1507 = stablehlo.reshape %v1506 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1508 = stablehlo.add %v1456, %v1507 : tensor<256x37824xf32>
    %v1509 = stablehlo.reshape %v1508 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1510 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1511 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1512 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1513 = stablehlo.reduce(%v1509 init: %v1510) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1514 = stablehlo.broadcast_in_dim %v1513, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1515 = stablehlo.divide %v1514, %v1511 : tensor<256x197x192xf32>
    %v1516 = stablehlo.subtract %v1509, %v1515 : tensor<256x197x192xf32>
    %v1517 = stablehlo.multiply %v1516, %v1516 : tensor<256x197x192xf32>
    %v1518 = stablehlo.reduce(%v1517 init: %v1510) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1519 = stablehlo.broadcast_in_dim %v1518, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1520 = stablehlo.divide %v1519, %v1511 : tensor<256x197x192xf32>
    %v1521 = stablehlo.add %v1520, %v1512 : tensor<256x197x192xf32>
    %v1522 = stablehlo.rsqrt %v1521 : tensor<256x197x192xf32>
    %v1523 = stablehlo.multiply %v1516, %v1522 : tensor<256x197x192xf32>
    %v1524 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1525 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1526 = stablehlo.multiply %v1523, %v1524 : tensor<256x197x192xf32>
    %v1527 = stablehlo.add %v1526, %v1525 : tensor<256x197x192xf32>
    %v1528 = stablehlo.reshape %v1527 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1529 = stablehlo.reshape %v1528 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1530 = stablehlo.broadcast_in_dim %b7_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1531 = stablehlo.multiply %v1529, %v1530 : tensor<256x197x192xf32>
    %v1532 = stablehlo.reshape %v1531 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1533 = stablehlo.reshape %v1532 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1534 = stablehlo.broadcast_in_dim %b7_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1535 = stablehlo.add %v1533, %v1534 : tensor<256x197x192xf32>
    %v1536 = stablehlo.reshape %v1535 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1537 = stablehlo.reshape %v1536 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1538 = stablehlo.dot_general %v1537, %b7_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1539 = stablehlo.broadcast_in_dim %b7_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1540 = stablehlo.add %v1538, %v1539 : tensor<256x197x192xf32>
    %v1541 = stablehlo.reshape %v1540 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1542 = stablehlo.reshape %v1536 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1543 = stablehlo.dot_general %v1542, %b7_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1544 = stablehlo.broadcast_in_dim %b7_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1545 = stablehlo.add %v1543, %v1544 : tensor<256x197x192xf32>
    %v1546 = stablehlo.reshape %v1545 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1547 = stablehlo.reshape %v1536 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1548 = stablehlo.dot_general %v1547, %b7_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1549 = stablehlo.broadcast_in_dim %b7_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1550 = stablehlo.add %v1548, %v1549 : tensor<256x197x192xf32>
    %v1551 = stablehlo.reshape %v1550 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1552 = stablehlo.reshape %v1541 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1553 = stablehlo.slice %v1552 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1554 = stablehlo.reshape %v1553 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1555 = stablehlo.reshape %v1546 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1556 = stablehlo.slice %v1555 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1557 = stablehlo.reshape %v1556 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1558 = stablehlo.reshape %v1551 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1559 = stablehlo.slice %v1558 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1560 = stablehlo.reshape %v1559 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1561 = stablehlo.reshape %v1557 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1562 = stablehlo.transpose %v1561, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1563 = stablehlo.reshape %v1562 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1564 = stablehlo.reshape %v1554 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1565 = stablehlo.reshape %v1563 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1566 = stablehlo.dot_general %v1564, %v1565, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1567 = stablehlo.reshape %v1566 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1568 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1569 = stablehlo.multiply %v1567, %v1568 : tensor<256x38809xf32>
    %v1570 = stablehlo.reshape %v1569 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1571 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1572 = stablehlo.reduce(%v1570 init: %v1571) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1573 = stablehlo.broadcast_in_dim %v1572, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1574 = stablehlo.subtract %v1570, %v1573 : tensor<256x197x197xf32>
    %v1575 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1576 = stablehlo.exponential %v1574 : tensor<256x197x197xf32>
    %v1577 = stablehlo.reduce(%v1576 init: %v1575) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1578 = stablehlo.broadcast_in_dim %v1577, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1579 = stablehlo.divide %v1576, %v1578 : tensor<256x197x197xf32>
    %v1580 = stablehlo.reshape %v1579 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1581 = stablehlo.reshape %v1580 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1582 = stablehlo.reshape %v1560 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1583 = stablehlo.dot_general %v1581, %v1582, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1584 = stablehlo.reshape %v1583 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1585 = stablehlo.reshape %v1584 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1586 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1587 = stablehlo.pad %v1585, %v1586, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1588 = stablehlo.reshape %v1587 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1589 = stablehlo.reshape %v1541 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1590 = stablehlo.slice %v1589 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1591 = stablehlo.reshape %v1590 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1592 = stablehlo.reshape %v1546 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1593 = stablehlo.slice %v1592 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1594 = stablehlo.reshape %v1593 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1595 = stablehlo.reshape %v1551 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1596 = stablehlo.slice %v1595 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1597 = stablehlo.reshape %v1596 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1598 = stablehlo.reshape %v1594 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1599 = stablehlo.transpose %v1598, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1600 = stablehlo.reshape %v1599 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1601 = stablehlo.reshape %v1591 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1602 = stablehlo.reshape %v1600 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1603 = stablehlo.dot_general %v1601, %v1602, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1604 = stablehlo.reshape %v1603 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1605 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1606 = stablehlo.multiply %v1604, %v1605 : tensor<256x38809xf32>
    %v1607 = stablehlo.reshape %v1606 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1608 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1609 = stablehlo.reduce(%v1607 init: %v1608) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1610 = stablehlo.broadcast_in_dim %v1609, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1611 = stablehlo.subtract %v1607, %v1610 : tensor<256x197x197xf32>
    %v1612 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1613 = stablehlo.exponential %v1611 : tensor<256x197x197xf32>
    %v1614 = stablehlo.reduce(%v1613 init: %v1612) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1615 = stablehlo.broadcast_in_dim %v1614, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1616 = stablehlo.divide %v1613, %v1615 : tensor<256x197x197xf32>
    %v1617 = stablehlo.reshape %v1616 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1618 = stablehlo.reshape %v1617 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1619 = stablehlo.reshape %v1597 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1620 = stablehlo.dot_general %v1618, %v1619, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1621 = stablehlo.reshape %v1620 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1622 = stablehlo.reshape %v1621 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1623 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1624 = stablehlo.pad %v1622, %v1623, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1625 = stablehlo.reshape %v1624 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1626 = stablehlo.add %v1588, %v1625 : tensor<256x37824xf32>
    %v1627 = stablehlo.reshape %v1541 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1628 = stablehlo.slice %v1627 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1629 = stablehlo.reshape %v1628 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1630 = stablehlo.reshape %v1546 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1631 = stablehlo.slice %v1630 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1632 = stablehlo.reshape %v1631 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1633 = stablehlo.reshape %v1551 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1634 = stablehlo.slice %v1633 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1635 = stablehlo.reshape %v1634 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1636 = stablehlo.reshape %v1632 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1637 = stablehlo.transpose %v1636, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1638 = stablehlo.reshape %v1637 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1639 = stablehlo.reshape %v1629 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1640 = stablehlo.reshape %v1638 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1641 = stablehlo.dot_general %v1639, %v1640, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1642 = stablehlo.reshape %v1641 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1643 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1644 = stablehlo.multiply %v1642, %v1643 : tensor<256x38809xf32>
    %v1645 = stablehlo.reshape %v1644 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1646 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1647 = stablehlo.reduce(%v1645 init: %v1646) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1648 = stablehlo.broadcast_in_dim %v1647, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1649 = stablehlo.subtract %v1645, %v1648 : tensor<256x197x197xf32>
    %v1650 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1651 = stablehlo.exponential %v1649 : tensor<256x197x197xf32>
    %v1652 = stablehlo.reduce(%v1651 init: %v1650) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1653 = stablehlo.broadcast_in_dim %v1652, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1654 = stablehlo.divide %v1651, %v1653 : tensor<256x197x197xf32>
    %v1655 = stablehlo.reshape %v1654 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1656 = stablehlo.reshape %v1655 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1657 = stablehlo.reshape %v1635 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1658 = stablehlo.dot_general %v1656, %v1657, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1659 = stablehlo.reshape %v1658 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1660 = stablehlo.reshape %v1659 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1661 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1662 = stablehlo.pad %v1660, %v1661, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1663 = stablehlo.reshape %v1662 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1664 = stablehlo.add %v1626, %v1663 : tensor<256x37824xf32>
    %v1665 = stablehlo.reshape %v1664 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1666 = stablehlo.dot_general %v1665, %b7_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1667 = stablehlo.broadcast_in_dim %b7_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1668 = stablehlo.add %v1666, %v1667 : tensor<256x197x192xf32>
    %v1669 = stablehlo.reshape %v1668 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1670 = stablehlo.add %v1508, %v1669 : tensor<256x37824xf32>
    %v1671 = stablehlo.reshape %v1670 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1672 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1673 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1674 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1675 = stablehlo.reduce(%v1671 init: %v1672) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1676 = stablehlo.broadcast_in_dim %v1675, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1677 = stablehlo.divide %v1676, %v1673 : tensor<256x197x192xf32>
    %v1678 = stablehlo.subtract %v1671, %v1677 : tensor<256x197x192xf32>
    %v1679 = stablehlo.multiply %v1678, %v1678 : tensor<256x197x192xf32>
    %v1680 = stablehlo.reduce(%v1679 init: %v1672) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1681 = stablehlo.broadcast_in_dim %v1680, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1682 = stablehlo.divide %v1681, %v1673 : tensor<256x197x192xf32>
    %v1683 = stablehlo.add %v1682, %v1674 : tensor<256x197x192xf32>
    %v1684 = stablehlo.rsqrt %v1683 : tensor<256x197x192xf32>
    %v1685 = stablehlo.multiply %v1678, %v1684 : tensor<256x197x192xf32>
    %v1686 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1687 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1688 = stablehlo.multiply %v1685, %v1686 : tensor<256x197x192xf32>
    %v1689 = stablehlo.add %v1688, %v1687 : tensor<256x197x192xf32>
    %v1690 = stablehlo.reshape %v1689 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1691 = stablehlo.reshape %v1690 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1692 = stablehlo.broadcast_in_dim %b7_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1693 = stablehlo.multiply %v1691, %v1692 : tensor<256x197x192xf32>
    %v1694 = stablehlo.reshape %v1693 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1695 = stablehlo.reshape %v1694 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1696 = stablehlo.broadcast_in_dim %b7_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1697 = stablehlo.add %v1695, %v1696 : tensor<256x197x192xf32>
    %v1698 = stablehlo.reshape %v1697 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1699 = stablehlo.reshape %v1698 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1700 = stablehlo.dot_general %v1699, %b7_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v1701 = stablehlo.broadcast_in_dim %b7_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v1702 = stablehlo.add %v1700, %v1701 : tensor<256x197x768xf32>
    %v1703 = stablehlo.reshape %v1702 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v1704 = stablehlo.multiply %v1703, %v1703 : tensor<256x151296xf32>
    %v1705 = stablehlo.multiply %v1704, %v1703 : tensor<256x151296xf32>
    %v1706 = stablehlo.constant dense<0.044715> : tensor<256x151296xf32>
    %v1707 = stablehlo.multiply %v1706, %v1705 : tensor<256x151296xf32>
    %v1708 = stablehlo.add %v1703, %v1707 : tensor<256x151296xf32>
    %v1709 = stablehlo.constant dense<0.7978845608028654> : tensor<256x151296xf32>
    %v1710 = stablehlo.multiply %v1709, %v1708 : tensor<256x151296xf32>
    %v1711 = stablehlo.tanh %v1710 : tensor<256x151296xf32>
    %v1712 = stablehlo.constant dense<1.0> : tensor<256x151296xf32>
    %v1713 = stablehlo.add %v1712, %v1711 : tensor<256x151296xf32>
    %v1714 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v1715 = stablehlo.multiply %v1714, %v1703 : tensor<256x151296xf32>
    %v1716 = stablehlo.multiply %v1715, %v1713 : tensor<256x151296xf32>
    %v1717 = stablehlo.reshape %v1716 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v1718 = stablehlo.dot_general %v1717, %b7_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v1719 = stablehlo.broadcast_in_dim %b7_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1720 = stablehlo.add %v1718, %v1719 : tensor<256x197x192xf32>
    %v1721 = stablehlo.reshape %v1720 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1722 = stablehlo.add %v1670, %v1721 : tensor<256x37824xf32>
    %v1723 = stablehlo.reshape %v1722 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1724 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1725 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1726 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1727 = stablehlo.reduce(%v1723 init: %v1724) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1728 = stablehlo.broadcast_in_dim %v1727, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1729 = stablehlo.divide %v1728, %v1725 : tensor<256x197x192xf32>
    %v1730 = stablehlo.subtract %v1723, %v1729 : tensor<256x197x192xf32>
    %v1731 = stablehlo.multiply %v1730, %v1730 : tensor<256x197x192xf32>
    %v1732 = stablehlo.reduce(%v1731 init: %v1724) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1733 = stablehlo.broadcast_in_dim %v1732, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1734 = stablehlo.divide %v1733, %v1725 : tensor<256x197x192xf32>
    %v1735 = stablehlo.add %v1734, %v1726 : tensor<256x197x192xf32>
    %v1736 = stablehlo.rsqrt %v1735 : tensor<256x197x192xf32>
    %v1737 = stablehlo.multiply %v1730, %v1736 : tensor<256x197x192xf32>
    %v1738 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1739 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1740 = stablehlo.multiply %v1737, %v1738 : tensor<256x197x192xf32>
    %v1741 = stablehlo.add %v1740, %v1739 : tensor<256x197x192xf32>
    %v1742 = stablehlo.reshape %v1741 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1743 = stablehlo.reshape %v1742 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1744 = stablehlo.broadcast_in_dim %b8_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1745 = stablehlo.multiply %v1743, %v1744 : tensor<256x197x192xf32>
    %v1746 = stablehlo.reshape %v1745 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1747 = stablehlo.reshape %v1746 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1748 = stablehlo.broadcast_in_dim %b8_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1749 = stablehlo.add %v1747, %v1748 : tensor<256x197x192xf32>
    %v1750 = stablehlo.reshape %v1749 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1751 = stablehlo.reshape %v1750 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1752 = stablehlo.dot_general %v1751, %b8_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1753 = stablehlo.broadcast_in_dim %b8_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1754 = stablehlo.add %v1752, %v1753 : tensor<256x197x192xf32>
    %v1755 = stablehlo.reshape %v1754 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1756 = stablehlo.reshape %v1750 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1757 = stablehlo.dot_general %v1756, %b8_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1758 = stablehlo.broadcast_in_dim %b8_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1759 = stablehlo.add %v1757, %v1758 : tensor<256x197x192xf32>
    %v1760 = stablehlo.reshape %v1759 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1761 = stablehlo.reshape %v1750 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1762 = stablehlo.dot_general %v1761, %b8_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1763 = stablehlo.broadcast_in_dim %b8_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1764 = stablehlo.add %v1762, %v1763 : tensor<256x197x192xf32>
    %v1765 = stablehlo.reshape %v1764 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1766 = stablehlo.reshape %v1755 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1767 = stablehlo.slice %v1766 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1768 = stablehlo.reshape %v1767 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1769 = stablehlo.reshape %v1760 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1770 = stablehlo.slice %v1769 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1771 = stablehlo.reshape %v1770 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1772 = stablehlo.reshape %v1765 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1773 = stablehlo.slice %v1772 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1774 = stablehlo.reshape %v1773 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1775 = stablehlo.reshape %v1771 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1776 = stablehlo.transpose %v1775, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1777 = stablehlo.reshape %v1776 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1778 = stablehlo.reshape %v1768 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1779 = stablehlo.reshape %v1777 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1780 = stablehlo.dot_general %v1778, %v1779, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1781 = stablehlo.reshape %v1780 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1782 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1783 = stablehlo.multiply %v1781, %v1782 : tensor<256x38809xf32>
    %v1784 = stablehlo.reshape %v1783 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1785 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1786 = stablehlo.reduce(%v1784 init: %v1785) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1787 = stablehlo.broadcast_in_dim %v1786, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1788 = stablehlo.subtract %v1784, %v1787 : tensor<256x197x197xf32>
    %v1789 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1790 = stablehlo.exponential %v1788 : tensor<256x197x197xf32>
    %v1791 = stablehlo.reduce(%v1790 init: %v1789) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1792 = stablehlo.broadcast_in_dim %v1791, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1793 = stablehlo.divide %v1790, %v1792 : tensor<256x197x197xf32>
    %v1794 = stablehlo.reshape %v1793 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1795 = stablehlo.reshape %v1794 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1796 = stablehlo.reshape %v1774 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1797 = stablehlo.dot_general %v1795, %v1796, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1798 = stablehlo.reshape %v1797 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1799 = stablehlo.reshape %v1798 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1800 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1801 = stablehlo.pad %v1799, %v1800, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1802 = stablehlo.reshape %v1801 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1803 = stablehlo.reshape %v1755 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1804 = stablehlo.slice %v1803 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1805 = stablehlo.reshape %v1804 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1806 = stablehlo.reshape %v1760 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1807 = stablehlo.slice %v1806 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1808 = stablehlo.reshape %v1807 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1809 = stablehlo.reshape %v1765 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1810 = stablehlo.slice %v1809 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1811 = stablehlo.reshape %v1810 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1812 = stablehlo.reshape %v1808 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1813 = stablehlo.transpose %v1812, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1814 = stablehlo.reshape %v1813 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1815 = stablehlo.reshape %v1805 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1816 = stablehlo.reshape %v1814 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1817 = stablehlo.dot_general %v1815, %v1816, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1818 = stablehlo.reshape %v1817 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1819 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1820 = stablehlo.multiply %v1818, %v1819 : tensor<256x38809xf32>
    %v1821 = stablehlo.reshape %v1820 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1822 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1823 = stablehlo.reduce(%v1821 init: %v1822) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1824 = stablehlo.broadcast_in_dim %v1823, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1825 = stablehlo.subtract %v1821, %v1824 : tensor<256x197x197xf32>
    %v1826 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1827 = stablehlo.exponential %v1825 : tensor<256x197x197xf32>
    %v1828 = stablehlo.reduce(%v1827 init: %v1826) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1829 = stablehlo.broadcast_in_dim %v1828, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1830 = stablehlo.divide %v1827, %v1829 : tensor<256x197x197xf32>
    %v1831 = stablehlo.reshape %v1830 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1832 = stablehlo.reshape %v1831 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1833 = stablehlo.reshape %v1811 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1834 = stablehlo.dot_general %v1832, %v1833, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1835 = stablehlo.reshape %v1834 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1836 = stablehlo.reshape %v1835 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1837 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1838 = stablehlo.pad %v1836, %v1837, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1839 = stablehlo.reshape %v1838 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1840 = stablehlo.add %v1802, %v1839 : tensor<256x37824xf32>
    %v1841 = stablehlo.reshape %v1755 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1842 = stablehlo.slice %v1841 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1843 = stablehlo.reshape %v1842 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1844 = stablehlo.reshape %v1760 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1845 = stablehlo.slice %v1844 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1846 = stablehlo.reshape %v1845 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1847 = stablehlo.reshape %v1765 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1848 = stablehlo.slice %v1847 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1849 = stablehlo.reshape %v1848 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1850 = stablehlo.reshape %v1846 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1851 = stablehlo.transpose %v1850, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1852 = stablehlo.reshape %v1851 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1853 = stablehlo.reshape %v1843 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1854 = stablehlo.reshape %v1852 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1855 = stablehlo.dot_general %v1853, %v1854, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1856 = stablehlo.reshape %v1855 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1857 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1858 = stablehlo.multiply %v1856, %v1857 : tensor<256x38809xf32>
    %v1859 = stablehlo.reshape %v1858 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1860 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1861 = stablehlo.reduce(%v1859 init: %v1860) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1862 = stablehlo.broadcast_in_dim %v1861, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1863 = stablehlo.subtract %v1859, %v1862 : tensor<256x197x197xf32>
    %v1864 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1865 = stablehlo.exponential %v1863 : tensor<256x197x197xf32>
    %v1866 = stablehlo.reduce(%v1865 init: %v1864) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1867 = stablehlo.broadcast_in_dim %v1866, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1868 = stablehlo.divide %v1865, %v1867 : tensor<256x197x197xf32>
    %v1869 = stablehlo.reshape %v1868 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1870 = stablehlo.reshape %v1869 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1871 = stablehlo.reshape %v1849 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1872 = stablehlo.dot_general %v1870, %v1871, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1873 = stablehlo.reshape %v1872 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1874 = stablehlo.reshape %v1873 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1875 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1876 = stablehlo.pad %v1874, %v1875, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1877 = stablehlo.reshape %v1876 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1878 = stablehlo.add %v1840, %v1877 : tensor<256x37824xf32>
    %v1879 = stablehlo.reshape %v1878 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1880 = stablehlo.dot_general %v1879, %b8_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1881 = stablehlo.broadcast_in_dim %b8_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1882 = stablehlo.add %v1880, %v1881 : tensor<256x197x192xf32>
    %v1883 = stablehlo.reshape %v1882 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1884 = stablehlo.add %v1722, %v1883 : tensor<256x37824xf32>
    %v1885 = stablehlo.reshape %v1884 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1886 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1887 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1888 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1889 = stablehlo.reduce(%v1885 init: %v1886) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1890 = stablehlo.broadcast_in_dim %v1889, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1891 = stablehlo.divide %v1890, %v1887 : tensor<256x197x192xf32>
    %v1892 = stablehlo.subtract %v1885, %v1891 : tensor<256x197x192xf32>
    %v1893 = stablehlo.multiply %v1892, %v1892 : tensor<256x197x192xf32>
    %v1894 = stablehlo.reduce(%v1893 init: %v1886) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1895 = stablehlo.broadcast_in_dim %v1894, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1896 = stablehlo.divide %v1895, %v1887 : tensor<256x197x192xf32>
    %v1897 = stablehlo.add %v1896, %v1888 : tensor<256x197x192xf32>
    %v1898 = stablehlo.rsqrt %v1897 : tensor<256x197x192xf32>
    %v1899 = stablehlo.multiply %v1892, %v1898 : tensor<256x197x192xf32>
    %v1900 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1901 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1902 = stablehlo.multiply %v1899, %v1900 : tensor<256x197x192xf32>
    %v1903 = stablehlo.add %v1902, %v1901 : tensor<256x197x192xf32>
    %v1904 = stablehlo.reshape %v1903 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1905 = stablehlo.reshape %v1904 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1906 = stablehlo.broadcast_in_dim %b8_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1907 = stablehlo.multiply %v1905, %v1906 : tensor<256x197x192xf32>
    %v1908 = stablehlo.reshape %v1907 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1909 = stablehlo.reshape %v1908 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1910 = stablehlo.broadcast_in_dim %b8_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1911 = stablehlo.add %v1909, %v1910 : tensor<256x197x192xf32>
    %v1912 = stablehlo.reshape %v1911 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1913 = stablehlo.reshape %v1912 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1914 = stablehlo.dot_general %v1913, %b8_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v1915 = stablehlo.broadcast_in_dim %b8_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v1916 = stablehlo.add %v1914, %v1915 : tensor<256x197x768xf32>
    %v1917 = stablehlo.reshape %v1916 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v1918 = stablehlo.multiply %v1917, %v1917 : tensor<256x151296xf32>
    %v1919 = stablehlo.multiply %v1918, %v1917 : tensor<256x151296xf32>
    %v1920 = stablehlo.constant dense<0.044715> : tensor<256x151296xf32>
    %v1921 = stablehlo.multiply %v1920, %v1919 : tensor<256x151296xf32>
    %v1922 = stablehlo.add %v1917, %v1921 : tensor<256x151296xf32>
    %v1923 = stablehlo.constant dense<0.7978845608028654> : tensor<256x151296xf32>
    %v1924 = stablehlo.multiply %v1923, %v1922 : tensor<256x151296xf32>
    %v1925 = stablehlo.tanh %v1924 : tensor<256x151296xf32>
    %v1926 = stablehlo.constant dense<1.0> : tensor<256x151296xf32>
    %v1927 = stablehlo.add %v1926, %v1925 : tensor<256x151296xf32>
    %v1928 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v1929 = stablehlo.multiply %v1928, %v1917 : tensor<256x151296xf32>
    %v1930 = stablehlo.multiply %v1929, %v1927 : tensor<256x151296xf32>
    %v1931 = stablehlo.reshape %v1930 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v1932 = stablehlo.dot_general %v1931, %b8_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v1933 = stablehlo.broadcast_in_dim %b8_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1934 = stablehlo.add %v1932, %v1933 : tensor<256x197x192xf32>
    %v1935 = stablehlo.reshape %v1934 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1936 = stablehlo.add %v1884, %v1935 : tensor<256x37824xf32>
    %v1937 = stablehlo.reshape %v1936 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1938 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1939 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1940 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1941 = stablehlo.reduce(%v1937 init: %v1938) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1942 = stablehlo.broadcast_in_dim %v1941, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1943 = stablehlo.divide %v1942, %v1939 : tensor<256x197x192xf32>
    %v1944 = stablehlo.subtract %v1937, %v1943 : tensor<256x197x192xf32>
    %v1945 = stablehlo.multiply %v1944, %v1944 : tensor<256x197x192xf32>
    %v1946 = stablehlo.reduce(%v1945 init: %v1938) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1947 = stablehlo.broadcast_in_dim %v1946, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1948 = stablehlo.divide %v1947, %v1939 : tensor<256x197x192xf32>
    %v1949 = stablehlo.add %v1948, %v1940 : tensor<256x197x192xf32>
    %v1950 = stablehlo.rsqrt %v1949 : tensor<256x197x192xf32>
    %v1951 = stablehlo.multiply %v1944, %v1950 : tensor<256x197x192xf32>
    %v1952 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1953 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1954 = stablehlo.multiply %v1951, %v1952 : tensor<256x197x192xf32>
    %v1955 = stablehlo.add %v1954, %v1953 : tensor<256x197x192xf32>
    %v1956 = stablehlo.reshape %v1955 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1957 = stablehlo.reshape %v1956 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1958 = stablehlo.broadcast_in_dim %b9_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1959 = stablehlo.multiply %v1957, %v1958 : tensor<256x197x192xf32>
    %v1960 = stablehlo.reshape %v1959 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1961 = stablehlo.reshape %v1960 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1962 = stablehlo.broadcast_in_dim %b9_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1963 = stablehlo.add %v1961, %v1962 : tensor<256x197x192xf32>
    %v1964 = stablehlo.reshape %v1963 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1965 = stablehlo.reshape %v1964 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1966 = stablehlo.dot_general %v1965, %b9_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1967 = stablehlo.broadcast_in_dim %b9_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1968 = stablehlo.add %v1966, %v1967 : tensor<256x197x192xf32>
    %v1969 = stablehlo.reshape %v1968 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1970 = stablehlo.reshape %v1964 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1971 = stablehlo.dot_general %v1970, %b9_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1972 = stablehlo.broadcast_in_dim %b9_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1973 = stablehlo.add %v1971, %v1972 : tensor<256x197x192xf32>
    %v1974 = stablehlo.reshape %v1973 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1975 = stablehlo.reshape %v1964 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1976 = stablehlo.dot_general %v1975, %b9_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1977 = stablehlo.broadcast_in_dim %b9_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1978 = stablehlo.add %v1976, %v1977 : tensor<256x197x192xf32>
    %v1979 = stablehlo.reshape %v1978 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1980 = stablehlo.reshape %v1969 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1981 = stablehlo.slice %v1980 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1982 = stablehlo.reshape %v1981 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1983 = stablehlo.reshape %v1974 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1984 = stablehlo.slice %v1983 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1985 = stablehlo.reshape %v1984 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1986 = stablehlo.reshape %v1979 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1987 = stablehlo.slice %v1986 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1988 = stablehlo.reshape %v1987 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1989 = stablehlo.reshape %v1985 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1990 = stablehlo.transpose %v1989, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1991 = stablehlo.reshape %v1990 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1992 = stablehlo.reshape %v1982 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1993 = stablehlo.reshape %v1991 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1994 = stablehlo.dot_general %v1992, %v1993, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1995 = stablehlo.reshape %v1994 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1996 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1997 = stablehlo.multiply %v1995, %v1996 : tensor<256x38809xf32>
    %v1998 = stablehlo.reshape %v1997 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1999 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2000 = stablehlo.reduce(%v1998 init: %v1999) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2001 = stablehlo.broadcast_in_dim %v2000, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2002 = stablehlo.subtract %v1998, %v2001 : tensor<256x197x197xf32>
    %v2003 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2004 = stablehlo.exponential %v2002 : tensor<256x197x197xf32>
    %v2005 = stablehlo.reduce(%v2004 init: %v2003) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2006 = stablehlo.broadcast_in_dim %v2005, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2007 = stablehlo.divide %v2004, %v2006 : tensor<256x197x197xf32>
    %v2008 = stablehlo.reshape %v2007 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2009 = stablehlo.reshape %v2008 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2010 = stablehlo.reshape %v1988 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2011 = stablehlo.dot_general %v2009, %v2010, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2012 = stablehlo.reshape %v2011 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2013 = stablehlo.reshape %v2012 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2014 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2015 = stablehlo.pad %v2013, %v2014, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2016 = stablehlo.reshape %v2015 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2017 = stablehlo.reshape %v1969 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2018 = stablehlo.slice %v2017 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2019 = stablehlo.reshape %v2018 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2020 = stablehlo.reshape %v1974 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2021 = stablehlo.slice %v2020 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2022 = stablehlo.reshape %v2021 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2023 = stablehlo.reshape %v1979 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2024 = stablehlo.slice %v2023 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2025 = stablehlo.reshape %v2024 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2026 = stablehlo.reshape %v2022 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2027 = stablehlo.transpose %v2026, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2028 = stablehlo.reshape %v2027 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2029 = stablehlo.reshape %v2019 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2030 = stablehlo.reshape %v2028 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2031 = stablehlo.dot_general %v2029, %v2030, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2032 = stablehlo.reshape %v2031 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2033 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2034 = stablehlo.multiply %v2032, %v2033 : tensor<256x38809xf32>
    %v2035 = stablehlo.reshape %v2034 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2036 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2037 = stablehlo.reduce(%v2035 init: %v2036) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2038 = stablehlo.broadcast_in_dim %v2037, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2039 = stablehlo.subtract %v2035, %v2038 : tensor<256x197x197xf32>
    %v2040 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2041 = stablehlo.exponential %v2039 : tensor<256x197x197xf32>
    %v2042 = stablehlo.reduce(%v2041 init: %v2040) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2043 = stablehlo.broadcast_in_dim %v2042, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2044 = stablehlo.divide %v2041, %v2043 : tensor<256x197x197xf32>
    %v2045 = stablehlo.reshape %v2044 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2046 = stablehlo.reshape %v2045 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2047 = stablehlo.reshape %v2025 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2048 = stablehlo.dot_general %v2046, %v2047, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2049 = stablehlo.reshape %v2048 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2050 = stablehlo.reshape %v2049 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2051 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2052 = stablehlo.pad %v2050, %v2051, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2053 = stablehlo.reshape %v2052 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2054 = stablehlo.add %v2016, %v2053 : tensor<256x37824xf32>
    %v2055 = stablehlo.reshape %v1969 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2056 = stablehlo.slice %v2055 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2057 = stablehlo.reshape %v2056 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2058 = stablehlo.reshape %v1974 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2059 = stablehlo.slice %v2058 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2060 = stablehlo.reshape %v2059 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2061 = stablehlo.reshape %v1979 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2062 = stablehlo.slice %v2061 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2063 = stablehlo.reshape %v2062 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2064 = stablehlo.reshape %v2060 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2065 = stablehlo.transpose %v2064, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2066 = stablehlo.reshape %v2065 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2067 = stablehlo.reshape %v2057 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2068 = stablehlo.reshape %v2066 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2069 = stablehlo.dot_general %v2067, %v2068, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2070 = stablehlo.reshape %v2069 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2071 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2072 = stablehlo.multiply %v2070, %v2071 : tensor<256x38809xf32>
    %v2073 = stablehlo.reshape %v2072 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2074 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2075 = stablehlo.reduce(%v2073 init: %v2074) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2076 = stablehlo.broadcast_in_dim %v2075, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2077 = stablehlo.subtract %v2073, %v2076 : tensor<256x197x197xf32>
    %v2078 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2079 = stablehlo.exponential %v2077 : tensor<256x197x197xf32>
    %v2080 = stablehlo.reduce(%v2079 init: %v2078) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2081 = stablehlo.broadcast_in_dim %v2080, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2082 = stablehlo.divide %v2079, %v2081 : tensor<256x197x197xf32>
    %v2083 = stablehlo.reshape %v2082 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2084 = stablehlo.reshape %v2083 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2085 = stablehlo.reshape %v2063 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2086 = stablehlo.dot_general %v2084, %v2085, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2087 = stablehlo.reshape %v2086 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2088 = stablehlo.reshape %v2087 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2089 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2090 = stablehlo.pad %v2088, %v2089, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2091 = stablehlo.reshape %v2090 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2092 = stablehlo.add %v2054, %v2091 : tensor<256x37824xf32>
    %v2093 = stablehlo.reshape %v2092 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2094 = stablehlo.dot_general %v2093, %b9_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2095 = stablehlo.broadcast_in_dim %b9_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2096 = stablehlo.add %v2094, %v2095 : tensor<256x197x192xf32>
    %v2097 = stablehlo.reshape %v2096 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2098 = stablehlo.add %v1936, %v2097 : tensor<256x37824xf32>
    %v2099 = stablehlo.reshape %v2098 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2100 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2101 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v2102 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v2103 = stablehlo.reduce(%v2099 init: %v2100) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2104 = stablehlo.broadcast_in_dim %v2103, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2105 = stablehlo.divide %v2104, %v2101 : tensor<256x197x192xf32>
    %v2106 = stablehlo.subtract %v2099, %v2105 : tensor<256x197x192xf32>
    %v2107 = stablehlo.multiply %v2106, %v2106 : tensor<256x197x192xf32>
    %v2108 = stablehlo.reduce(%v2107 init: %v2100) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2109 = stablehlo.broadcast_in_dim %v2108, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2110 = stablehlo.divide %v2109, %v2101 : tensor<256x197x192xf32>
    %v2111 = stablehlo.add %v2110, %v2102 : tensor<256x197x192xf32>
    %v2112 = stablehlo.rsqrt %v2111 : tensor<256x197x192xf32>
    %v2113 = stablehlo.multiply %v2106, %v2112 : tensor<256x197x192xf32>
    %v2114 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2115 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2116 = stablehlo.multiply %v2113, %v2114 : tensor<256x197x192xf32>
    %v2117 = stablehlo.add %v2116, %v2115 : tensor<256x197x192xf32>
    %v2118 = stablehlo.reshape %v2117 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2119 = stablehlo.reshape %v2118 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2120 = stablehlo.broadcast_in_dim %b9_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2121 = stablehlo.multiply %v2119, %v2120 : tensor<256x197x192xf32>
    %v2122 = stablehlo.reshape %v2121 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2123 = stablehlo.reshape %v2122 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2124 = stablehlo.broadcast_in_dim %b9_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2125 = stablehlo.add %v2123, %v2124 : tensor<256x197x192xf32>
    %v2126 = stablehlo.reshape %v2125 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2127 = stablehlo.reshape %v2126 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2128 = stablehlo.dot_general %v2127, %b9_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v2129 = stablehlo.broadcast_in_dim %b9_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v2130 = stablehlo.add %v2128, %v2129 : tensor<256x197x768xf32>
    %v2131 = stablehlo.reshape %v2130 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v2132 = stablehlo.multiply %v2131, %v2131 : tensor<256x151296xf32>
    %v2133 = stablehlo.multiply %v2132, %v2131 : tensor<256x151296xf32>
    %v2134 = stablehlo.constant dense<0.044715> : tensor<256x151296xf32>
    %v2135 = stablehlo.multiply %v2134, %v2133 : tensor<256x151296xf32>
    %v2136 = stablehlo.add %v2131, %v2135 : tensor<256x151296xf32>
    %v2137 = stablehlo.constant dense<0.7978845608028654> : tensor<256x151296xf32>
    %v2138 = stablehlo.multiply %v2137, %v2136 : tensor<256x151296xf32>
    %v2139 = stablehlo.tanh %v2138 : tensor<256x151296xf32>
    %v2140 = stablehlo.constant dense<1.0> : tensor<256x151296xf32>
    %v2141 = stablehlo.add %v2140, %v2139 : tensor<256x151296xf32>
    %v2142 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v2143 = stablehlo.multiply %v2142, %v2131 : tensor<256x151296xf32>
    %v2144 = stablehlo.multiply %v2143, %v2141 : tensor<256x151296xf32>
    %v2145 = stablehlo.reshape %v2144 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v2146 = stablehlo.dot_general %v2145, %b9_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v2147 = stablehlo.broadcast_in_dim %b9_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2148 = stablehlo.add %v2146, %v2147 : tensor<256x197x192xf32>
    %v2149 = stablehlo.reshape %v2148 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2150 = stablehlo.add %v2098, %v2149 : tensor<256x37824xf32>
    %v2151 = stablehlo.reshape %v2150 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2152 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2153 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v2154 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v2155 = stablehlo.reduce(%v2151 init: %v2152) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2156 = stablehlo.broadcast_in_dim %v2155, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2157 = stablehlo.divide %v2156, %v2153 : tensor<256x197x192xf32>
    %v2158 = stablehlo.subtract %v2151, %v2157 : tensor<256x197x192xf32>
    %v2159 = stablehlo.multiply %v2158, %v2158 : tensor<256x197x192xf32>
    %v2160 = stablehlo.reduce(%v2159 init: %v2152) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2161 = stablehlo.broadcast_in_dim %v2160, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2162 = stablehlo.divide %v2161, %v2153 : tensor<256x197x192xf32>
    %v2163 = stablehlo.add %v2162, %v2154 : tensor<256x197x192xf32>
    %v2164 = stablehlo.rsqrt %v2163 : tensor<256x197x192xf32>
    %v2165 = stablehlo.multiply %v2158, %v2164 : tensor<256x197x192xf32>
    %v2166 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2167 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2168 = stablehlo.multiply %v2165, %v2166 : tensor<256x197x192xf32>
    %v2169 = stablehlo.add %v2168, %v2167 : tensor<256x197x192xf32>
    %v2170 = stablehlo.reshape %v2169 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2171 = stablehlo.reshape %v2170 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2172 = stablehlo.broadcast_in_dim %b10_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2173 = stablehlo.multiply %v2171, %v2172 : tensor<256x197x192xf32>
    %v2174 = stablehlo.reshape %v2173 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2175 = stablehlo.reshape %v2174 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2176 = stablehlo.broadcast_in_dim %b10_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2177 = stablehlo.add %v2175, %v2176 : tensor<256x197x192xf32>
    %v2178 = stablehlo.reshape %v2177 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2179 = stablehlo.reshape %v2178 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2180 = stablehlo.dot_general %v2179, %b10_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2181 = stablehlo.broadcast_in_dim %b10_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2182 = stablehlo.add %v2180, %v2181 : tensor<256x197x192xf32>
    %v2183 = stablehlo.reshape %v2182 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2184 = stablehlo.reshape %v2178 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2185 = stablehlo.dot_general %v2184, %b10_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2186 = stablehlo.broadcast_in_dim %b10_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2187 = stablehlo.add %v2185, %v2186 : tensor<256x197x192xf32>
    %v2188 = stablehlo.reshape %v2187 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2189 = stablehlo.reshape %v2178 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2190 = stablehlo.dot_general %v2189, %b10_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2191 = stablehlo.broadcast_in_dim %b10_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2192 = stablehlo.add %v2190, %v2191 : tensor<256x197x192xf32>
    %v2193 = stablehlo.reshape %v2192 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2194 = stablehlo.reshape %v2183 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2195 = stablehlo.slice %v2194 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2196 = stablehlo.reshape %v2195 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2197 = stablehlo.reshape %v2188 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2198 = stablehlo.slice %v2197 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2199 = stablehlo.reshape %v2198 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2200 = stablehlo.reshape %v2193 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2201 = stablehlo.slice %v2200 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2202 = stablehlo.reshape %v2201 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2203 = stablehlo.reshape %v2199 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2204 = stablehlo.transpose %v2203, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2205 = stablehlo.reshape %v2204 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2206 = stablehlo.reshape %v2196 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2207 = stablehlo.reshape %v2205 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2208 = stablehlo.dot_general %v2206, %v2207, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2209 = stablehlo.reshape %v2208 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2210 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2211 = stablehlo.multiply %v2209, %v2210 : tensor<256x38809xf32>
    %v2212 = stablehlo.reshape %v2211 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2213 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2214 = stablehlo.reduce(%v2212 init: %v2213) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2215 = stablehlo.broadcast_in_dim %v2214, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2216 = stablehlo.subtract %v2212, %v2215 : tensor<256x197x197xf32>
    %v2217 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2218 = stablehlo.exponential %v2216 : tensor<256x197x197xf32>
    %v2219 = stablehlo.reduce(%v2218 init: %v2217) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2220 = stablehlo.broadcast_in_dim %v2219, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2221 = stablehlo.divide %v2218, %v2220 : tensor<256x197x197xf32>
    %v2222 = stablehlo.reshape %v2221 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2223 = stablehlo.reshape %v2222 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2224 = stablehlo.reshape %v2202 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2225 = stablehlo.dot_general %v2223, %v2224, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2226 = stablehlo.reshape %v2225 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2227 = stablehlo.reshape %v2226 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2228 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2229 = stablehlo.pad %v2227, %v2228, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2230 = stablehlo.reshape %v2229 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2231 = stablehlo.reshape %v2183 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2232 = stablehlo.slice %v2231 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2233 = stablehlo.reshape %v2232 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2234 = stablehlo.reshape %v2188 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2235 = stablehlo.slice %v2234 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2236 = stablehlo.reshape %v2235 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2237 = stablehlo.reshape %v2193 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2238 = stablehlo.slice %v2237 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2239 = stablehlo.reshape %v2238 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2240 = stablehlo.reshape %v2236 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2241 = stablehlo.transpose %v2240, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2242 = stablehlo.reshape %v2241 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2243 = stablehlo.reshape %v2233 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2244 = stablehlo.reshape %v2242 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2245 = stablehlo.dot_general %v2243, %v2244, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2246 = stablehlo.reshape %v2245 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2247 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2248 = stablehlo.multiply %v2246, %v2247 : tensor<256x38809xf32>
    %v2249 = stablehlo.reshape %v2248 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2250 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2251 = stablehlo.reduce(%v2249 init: %v2250) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2252 = stablehlo.broadcast_in_dim %v2251, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2253 = stablehlo.subtract %v2249, %v2252 : tensor<256x197x197xf32>
    %v2254 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2255 = stablehlo.exponential %v2253 : tensor<256x197x197xf32>
    %v2256 = stablehlo.reduce(%v2255 init: %v2254) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2257 = stablehlo.broadcast_in_dim %v2256, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2258 = stablehlo.divide %v2255, %v2257 : tensor<256x197x197xf32>
    %v2259 = stablehlo.reshape %v2258 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2260 = stablehlo.reshape %v2259 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2261 = stablehlo.reshape %v2239 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2262 = stablehlo.dot_general %v2260, %v2261, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2263 = stablehlo.reshape %v2262 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2264 = stablehlo.reshape %v2263 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2265 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2266 = stablehlo.pad %v2264, %v2265, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2267 = stablehlo.reshape %v2266 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2268 = stablehlo.add %v2230, %v2267 : tensor<256x37824xf32>
    %v2269 = stablehlo.reshape %v2183 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2270 = stablehlo.slice %v2269 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2271 = stablehlo.reshape %v2270 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2272 = stablehlo.reshape %v2188 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2273 = stablehlo.slice %v2272 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2274 = stablehlo.reshape %v2273 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2275 = stablehlo.reshape %v2193 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2276 = stablehlo.slice %v2275 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2277 = stablehlo.reshape %v2276 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2278 = stablehlo.reshape %v2274 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2279 = stablehlo.transpose %v2278, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2280 = stablehlo.reshape %v2279 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2281 = stablehlo.reshape %v2271 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2282 = stablehlo.reshape %v2280 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2283 = stablehlo.dot_general %v2281, %v2282, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2284 = stablehlo.reshape %v2283 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2285 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2286 = stablehlo.multiply %v2284, %v2285 : tensor<256x38809xf32>
    %v2287 = stablehlo.reshape %v2286 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2288 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2289 = stablehlo.reduce(%v2287 init: %v2288) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2290 = stablehlo.broadcast_in_dim %v2289, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2291 = stablehlo.subtract %v2287, %v2290 : tensor<256x197x197xf32>
    %v2292 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2293 = stablehlo.exponential %v2291 : tensor<256x197x197xf32>
    %v2294 = stablehlo.reduce(%v2293 init: %v2292) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2295 = stablehlo.broadcast_in_dim %v2294, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2296 = stablehlo.divide %v2293, %v2295 : tensor<256x197x197xf32>
    %v2297 = stablehlo.reshape %v2296 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2298 = stablehlo.reshape %v2297 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2299 = stablehlo.reshape %v2277 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2300 = stablehlo.dot_general %v2298, %v2299, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2301 = stablehlo.reshape %v2300 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2302 = stablehlo.reshape %v2301 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2303 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2304 = stablehlo.pad %v2302, %v2303, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2305 = stablehlo.reshape %v2304 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2306 = stablehlo.add %v2268, %v2305 : tensor<256x37824xf32>
    %v2307 = stablehlo.reshape %v2306 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2308 = stablehlo.dot_general %v2307, %b10_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2309 = stablehlo.broadcast_in_dim %b10_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2310 = stablehlo.add %v2308, %v2309 : tensor<256x197x192xf32>
    %v2311 = stablehlo.reshape %v2310 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2312 = stablehlo.add %v2150, %v2311 : tensor<256x37824xf32>
    %v2313 = stablehlo.reshape %v2312 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2314 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2315 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v2316 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v2317 = stablehlo.reduce(%v2313 init: %v2314) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2318 = stablehlo.broadcast_in_dim %v2317, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2319 = stablehlo.divide %v2318, %v2315 : tensor<256x197x192xf32>
    %v2320 = stablehlo.subtract %v2313, %v2319 : tensor<256x197x192xf32>
    %v2321 = stablehlo.multiply %v2320, %v2320 : tensor<256x197x192xf32>
    %v2322 = stablehlo.reduce(%v2321 init: %v2314) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2323 = stablehlo.broadcast_in_dim %v2322, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2324 = stablehlo.divide %v2323, %v2315 : tensor<256x197x192xf32>
    %v2325 = stablehlo.add %v2324, %v2316 : tensor<256x197x192xf32>
    %v2326 = stablehlo.rsqrt %v2325 : tensor<256x197x192xf32>
    %v2327 = stablehlo.multiply %v2320, %v2326 : tensor<256x197x192xf32>
    %v2328 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2329 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2330 = stablehlo.multiply %v2327, %v2328 : tensor<256x197x192xf32>
    %v2331 = stablehlo.add %v2330, %v2329 : tensor<256x197x192xf32>
    %v2332 = stablehlo.reshape %v2331 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2333 = stablehlo.reshape %v2332 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2334 = stablehlo.broadcast_in_dim %b10_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2335 = stablehlo.multiply %v2333, %v2334 : tensor<256x197x192xf32>
    %v2336 = stablehlo.reshape %v2335 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2337 = stablehlo.reshape %v2336 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2338 = stablehlo.broadcast_in_dim %b10_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2339 = stablehlo.add %v2337, %v2338 : tensor<256x197x192xf32>
    %v2340 = stablehlo.reshape %v2339 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2341 = stablehlo.reshape %v2340 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2342 = stablehlo.dot_general %v2341, %b10_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v2343 = stablehlo.broadcast_in_dim %b10_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v2344 = stablehlo.add %v2342, %v2343 : tensor<256x197x768xf32>
    %v2345 = stablehlo.reshape %v2344 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v2346 = stablehlo.multiply %v2345, %v2345 : tensor<256x151296xf32>
    %v2347 = stablehlo.multiply %v2346, %v2345 : tensor<256x151296xf32>
    %v2348 = stablehlo.constant dense<0.044715> : tensor<256x151296xf32>
    %v2349 = stablehlo.multiply %v2348, %v2347 : tensor<256x151296xf32>
    %v2350 = stablehlo.add %v2345, %v2349 : tensor<256x151296xf32>
    %v2351 = stablehlo.constant dense<0.7978845608028654> : tensor<256x151296xf32>
    %v2352 = stablehlo.multiply %v2351, %v2350 : tensor<256x151296xf32>
    %v2353 = stablehlo.tanh %v2352 : tensor<256x151296xf32>
    %v2354 = stablehlo.constant dense<1.0> : tensor<256x151296xf32>
    %v2355 = stablehlo.add %v2354, %v2353 : tensor<256x151296xf32>
    %v2356 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v2357 = stablehlo.multiply %v2356, %v2345 : tensor<256x151296xf32>
    %v2358 = stablehlo.multiply %v2357, %v2355 : tensor<256x151296xf32>
    %v2359 = stablehlo.reshape %v2358 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v2360 = stablehlo.dot_general %v2359, %b10_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v2361 = stablehlo.broadcast_in_dim %b10_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2362 = stablehlo.add %v2360, %v2361 : tensor<256x197x192xf32>
    %v2363 = stablehlo.reshape %v2362 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2364 = stablehlo.add %v2312, %v2363 : tensor<256x37824xf32>
    %v2365 = stablehlo.reshape %v2364 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2366 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2367 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v2368 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v2369 = stablehlo.reduce(%v2365 init: %v2366) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2370 = stablehlo.broadcast_in_dim %v2369, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2371 = stablehlo.divide %v2370, %v2367 : tensor<256x197x192xf32>
    %v2372 = stablehlo.subtract %v2365, %v2371 : tensor<256x197x192xf32>
    %v2373 = stablehlo.multiply %v2372, %v2372 : tensor<256x197x192xf32>
    %v2374 = stablehlo.reduce(%v2373 init: %v2366) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2375 = stablehlo.broadcast_in_dim %v2374, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2376 = stablehlo.divide %v2375, %v2367 : tensor<256x197x192xf32>
    %v2377 = stablehlo.add %v2376, %v2368 : tensor<256x197x192xf32>
    %v2378 = stablehlo.rsqrt %v2377 : tensor<256x197x192xf32>
    %v2379 = stablehlo.multiply %v2372, %v2378 : tensor<256x197x192xf32>
    %v2380 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2381 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2382 = stablehlo.multiply %v2379, %v2380 : tensor<256x197x192xf32>
    %v2383 = stablehlo.add %v2382, %v2381 : tensor<256x197x192xf32>
    %v2384 = stablehlo.reshape %v2383 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2385 = stablehlo.reshape %v2384 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2386 = stablehlo.broadcast_in_dim %b11_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2387 = stablehlo.multiply %v2385, %v2386 : tensor<256x197x192xf32>
    %v2388 = stablehlo.reshape %v2387 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2389 = stablehlo.reshape %v2388 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2390 = stablehlo.broadcast_in_dim %b11_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2391 = stablehlo.add %v2389, %v2390 : tensor<256x197x192xf32>
    %v2392 = stablehlo.reshape %v2391 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2393 = stablehlo.reshape %v2392 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2394 = stablehlo.dot_general %v2393, %b11_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2395 = stablehlo.broadcast_in_dim %b11_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2396 = stablehlo.add %v2394, %v2395 : tensor<256x197x192xf32>
    %v2397 = stablehlo.reshape %v2396 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2398 = stablehlo.reshape %v2392 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2399 = stablehlo.dot_general %v2398, %b11_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2400 = stablehlo.broadcast_in_dim %b11_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2401 = stablehlo.add %v2399, %v2400 : tensor<256x197x192xf32>
    %v2402 = stablehlo.reshape %v2401 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2403 = stablehlo.reshape %v2392 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2404 = stablehlo.dot_general %v2403, %b11_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2405 = stablehlo.broadcast_in_dim %b11_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2406 = stablehlo.add %v2404, %v2405 : tensor<256x197x192xf32>
    %v2407 = stablehlo.reshape %v2406 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2408 = stablehlo.reshape %v2397 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2409 = stablehlo.slice %v2408 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2410 = stablehlo.reshape %v2409 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2411 = stablehlo.reshape %v2402 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2412 = stablehlo.slice %v2411 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2413 = stablehlo.reshape %v2412 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2414 = stablehlo.reshape %v2407 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2415 = stablehlo.slice %v2414 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2416 = stablehlo.reshape %v2415 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2417 = stablehlo.reshape %v2413 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2418 = stablehlo.transpose %v2417, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2419 = stablehlo.reshape %v2418 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2420 = stablehlo.reshape %v2410 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2421 = stablehlo.reshape %v2419 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2422 = stablehlo.dot_general %v2420, %v2421, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2423 = stablehlo.reshape %v2422 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2424 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2425 = stablehlo.multiply %v2423, %v2424 : tensor<256x38809xf32>
    %v2426 = stablehlo.reshape %v2425 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2427 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2428 = stablehlo.reduce(%v2426 init: %v2427) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2429 = stablehlo.broadcast_in_dim %v2428, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2430 = stablehlo.subtract %v2426, %v2429 : tensor<256x197x197xf32>
    %v2431 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2432 = stablehlo.exponential %v2430 : tensor<256x197x197xf32>
    %v2433 = stablehlo.reduce(%v2432 init: %v2431) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2434 = stablehlo.broadcast_in_dim %v2433, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2435 = stablehlo.divide %v2432, %v2434 : tensor<256x197x197xf32>
    %v2436 = stablehlo.reshape %v2435 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2437 = stablehlo.reshape %v2436 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2438 = stablehlo.reshape %v2416 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2439 = stablehlo.dot_general %v2437, %v2438, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2440 = stablehlo.reshape %v2439 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2441 = stablehlo.reshape %v2440 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2442 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2443 = stablehlo.pad %v2441, %v2442, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2444 = stablehlo.reshape %v2443 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2445 = stablehlo.reshape %v2397 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2446 = stablehlo.slice %v2445 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2447 = stablehlo.reshape %v2446 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2448 = stablehlo.reshape %v2402 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2449 = stablehlo.slice %v2448 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2450 = stablehlo.reshape %v2449 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2451 = stablehlo.reshape %v2407 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2452 = stablehlo.slice %v2451 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2453 = stablehlo.reshape %v2452 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2454 = stablehlo.reshape %v2450 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2455 = stablehlo.transpose %v2454, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2456 = stablehlo.reshape %v2455 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2457 = stablehlo.reshape %v2447 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2458 = stablehlo.reshape %v2456 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2459 = stablehlo.dot_general %v2457, %v2458, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2460 = stablehlo.reshape %v2459 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2461 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2462 = stablehlo.multiply %v2460, %v2461 : tensor<256x38809xf32>
    %v2463 = stablehlo.reshape %v2462 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2464 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2465 = stablehlo.reduce(%v2463 init: %v2464) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2466 = stablehlo.broadcast_in_dim %v2465, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2467 = stablehlo.subtract %v2463, %v2466 : tensor<256x197x197xf32>
    %v2468 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2469 = stablehlo.exponential %v2467 : tensor<256x197x197xf32>
    %v2470 = stablehlo.reduce(%v2469 init: %v2468) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2471 = stablehlo.broadcast_in_dim %v2470, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2472 = stablehlo.divide %v2469, %v2471 : tensor<256x197x197xf32>
    %v2473 = stablehlo.reshape %v2472 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2474 = stablehlo.reshape %v2473 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2475 = stablehlo.reshape %v2453 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2476 = stablehlo.dot_general %v2474, %v2475, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2477 = stablehlo.reshape %v2476 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2478 = stablehlo.reshape %v2477 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2479 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2480 = stablehlo.pad %v2478, %v2479, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2481 = stablehlo.reshape %v2480 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2482 = stablehlo.add %v2444, %v2481 : tensor<256x37824xf32>
    %v2483 = stablehlo.reshape %v2397 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2484 = stablehlo.slice %v2483 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2485 = stablehlo.reshape %v2484 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2486 = stablehlo.reshape %v2402 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2487 = stablehlo.slice %v2486 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2488 = stablehlo.reshape %v2487 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2489 = stablehlo.reshape %v2407 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2490 = stablehlo.slice %v2489 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2491 = stablehlo.reshape %v2490 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2492 = stablehlo.reshape %v2488 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2493 = stablehlo.transpose %v2492, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2494 = stablehlo.reshape %v2493 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2495 = stablehlo.reshape %v2485 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2496 = stablehlo.reshape %v2494 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2497 = stablehlo.dot_general %v2495, %v2496, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2498 = stablehlo.reshape %v2497 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2499 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2500 = stablehlo.multiply %v2498, %v2499 : tensor<256x38809xf32>
    %v2501 = stablehlo.reshape %v2500 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2502 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2503 = stablehlo.reduce(%v2501 init: %v2502) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2504 = stablehlo.broadcast_in_dim %v2503, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2505 = stablehlo.subtract %v2501, %v2504 : tensor<256x197x197xf32>
    %v2506 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2507 = stablehlo.exponential %v2505 : tensor<256x197x197xf32>
    %v2508 = stablehlo.reduce(%v2507 init: %v2506) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2509 = stablehlo.broadcast_in_dim %v2508, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2510 = stablehlo.divide %v2507, %v2509 : tensor<256x197x197xf32>
    %v2511 = stablehlo.reshape %v2510 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2512 = stablehlo.reshape %v2511 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2513 = stablehlo.reshape %v2491 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2514 = stablehlo.dot_general %v2512, %v2513, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2515 = stablehlo.reshape %v2514 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2516 = stablehlo.reshape %v2515 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2517 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2518 = stablehlo.pad %v2516, %v2517, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2519 = stablehlo.reshape %v2518 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2520 = stablehlo.add %v2482, %v2519 : tensor<256x37824xf32>
    %v2521 = stablehlo.reshape %v2520 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2522 = stablehlo.dot_general %v2521, %b11_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2523 = stablehlo.broadcast_in_dim %b11_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2524 = stablehlo.add %v2522, %v2523 : tensor<256x197x192xf32>
    %v2525 = stablehlo.reshape %v2524 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2526 = stablehlo.add %v2364, %v2525 : tensor<256x37824xf32>
    %v2527 = stablehlo.reshape %v2526 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2528 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2529 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v2530 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v2531 = stablehlo.reduce(%v2527 init: %v2528) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2532 = stablehlo.broadcast_in_dim %v2531, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2533 = stablehlo.divide %v2532, %v2529 : tensor<256x197x192xf32>
    %v2534 = stablehlo.subtract %v2527, %v2533 : tensor<256x197x192xf32>
    %v2535 = stablehlo.multiply %v2534, %v2534 : tensor<256x197x192xf32>
    %v2536 = stablehlo.reduce(%v2535 init: %v2528) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2537 = stablehlo.broadcast_in_dim %v2536, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2538 = stablehlo.divide %v2537, %v2529 : tensor<256x197x192xf32>
    %v2539 = stablehlo.add %v2538, %v2530 : tensor<256x197x192xf32>
    %v2540 = stablehlo.rsqrt %v2539 : tensor<256x197x192xf32>
    %v2541 = stablehlo.multiply %v2534, %v2540 : tensor<256x197x192xf32>
    %v2542 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2543 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2544 = stablehlo.multiply %v2541, %v2542 : tensor<256x197x192xf32>
    %v2545 = stablehlo.add %v2544, %v2543 : tensor<256x197x192xf32>
    %v2546 = stablehlo.reshape %v2545 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2547 = stablehlo.reshape %v2546 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2548 = stablehlo.broadcast_in_dim %b11_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2549 = stablehlo.multiply %v2547, %v2548 : tensor<256x197x192xf32>
    %v2550 = stablehlo.reshape %v2549 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2551 = stablehlo.reshape %v2550 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2552 = stablehlo.broadcast_in_dim %b11_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2553 = stablehlo.add %v2551, %v2552 : tensor<256x197x192xf32>
    %v2554 = stablehlo.reshape %v2553 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2555 = stablehlo.reshape %v2554 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2556 = stablehlo.dot_general %v2555, %b11_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v2557 = stablehlo.broadcast_in_dim %b11_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v2558 = stablehlo.add %v2556, %v2557 : tensor<256x197x768xf32>
    %v2559 = stablehlo.reshape %v2558 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v2560 = stablehlo.multiply %v2559, %v2559 : tensor<256x151296xf32>
    %v2561 = stablehlo.multiply %v2560, %v2559 : tensor<256x151296xf32>
    %v2562 = stablehlo.constant dense<0.044715> : tensor<256x151296xf32>
    %v2563 = stablehlo.multiply %v2562, %v2561 : tensor<256x151296xf32>
    %v2564 = stablehlo.add %v2559, %v2563 : tensor<256x151296xf32>
    %v2565 = stablehlo.constant dense<0.7978845608028654> : tensor<256x151296xf32>
    %v2566 = stablehlo.multiply %v2565, %v2564 : tensor<256x151296xf32>
    %v2567 = stablehlo.tanh %v2566 : tensor<256x151296xf32>
    %v2568 = stablehlo.constant dense<1.0> : tensor<256x151296xf32>
    %v2569 = stablehlo.add %v2568, %v2567 : tensor<256x151296xf32>
    %v2570 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v2571 = stablehlo.multiply %v2570, %v2559 : tensor<256x151296xf32>
    %v2572 = stablehlo.multiply %v2571, %v2569 : tensor<256x151296xf32>
    %v2573 = stablehlo.reshape %v2572 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v2574 = stablehlo.dot_general %v2573, %b11_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v2575 = stablehlo.broadcast_in_dim %b11_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2576 = stablehlo.add %v2574, %v2575 : tensor<256x197x192xf32>
    %v2577 = stablehlo.reshape %v2576 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2578 = stablehlo.add %v2526, %v2577 : tensor<256x37824xf32>
    %v2579 = stablehlo.reshape %v2578 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2580 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2581 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v2582 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v2583 = stablehlo.reduce(%v2579 init: %v2580) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2584 = stablehlo.broadcast_in_dim %v2583, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2585 = stablehlo.divide %v2584, %v2581 : tensor<256x197x192xf32>
    %v2586 = stablehlo.subtract %v2579, %v2585 : tensor<256x197x192xf32>
    %v2587 = stablehlo.multiply %v2586, %v2586 : tensor<256x197x192xf32>
    %v2588 = stablehlo.reduce(%v2587 init: %v2580) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2589 = stablehlo.broadcast_in_dim %v2588, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2590 = stablehlo.divide %v2589, %v2581 : tensor<256x197x192xf32>
    %v2591 = stablehlo.add %v2590, %v2582 : tensor<256x197x192xf32>
    %v2592 = stablehlo.rsqrt %v2591 : tensor<256x197x192xf32>
    %v2593 = stablehlo.multiply %v2586, %v2592 : tensor<256x197x192xf32>
    %v2594 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2595 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2596 = stablehlo.multiply %v2593, %v2594 : tensor<256x197x192xf32>
    %v2597 = stablehlo.add %v2596, %v2595 : tensor<256x197x192xf32>
    %v2598 = stablehlo.reshape %v2597 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2599 = stablehlo.reshape %v2598 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2600 = stablehlo.broadcast_in_dim %gF, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2601 = stablehlo.multiply %v2599, %v2600 : tensor<256x197x192xf32>
    %v2602 = stablehlo.reshape %v2601 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2603 = stablehlo.reshape %v2602 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2604 = stablehlo.broadcast_in_dim %btF, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2605 = stablehlo.add %v2603, %v2604 : tensor<256x197x192xf32>
    %v2606 = stablehlo.reshape %v2605 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2607 = stablehlo.reshape %v2606 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2608 = stablehlo.slice %v2607 [0:256, 0:1, 0:192] : (tensor<256x197x192xf32>) -> tensor<256x1x192xf32>
    %v2609 = stablehlo.reshape %v2608 : (tensor<256x1x192xf32>) -> tensor<256x192xf32>
    %v2610 = stablehlo.dot_general %v2609, %Wc, contracting_dims = [1] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x192xf32>, tensor<192x1000xf32>) -> tensor<256x1000xf32>
    %v2611 = stablehlo.broadcast_in_dim %bc, dims = [1] : (tensor<1000xf32>) -> tensor<256x1000xf32>
    %v2612 = stablehlo.add %v2610, %v2611 : tensor<256x1000xf32>
    return %v2612 : tensor<256x1000xf32>
  }
}
