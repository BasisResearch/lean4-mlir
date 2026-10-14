module @m {
  func.func @vitin_emadp256x4wxdropeps0000001smxerfbf16_fwd(%x: tensor<256x150528xf32>, %wConv: tensor<192x3x16x16xf32>, %bConv: tensor<192xf32>, %cls: tensor<192xf32>, %pos: tensor<197x192xf32>, %b0_g1: tensor<192xf32>, %b0_bt1: tensor<192xf32>, %b0_Wq: tensor<192x192xf32>, %b0_bq: tensor<192xf32>, %b0_Wk: tensor<192x192xf32>, %b0_bk: tensor<192xf32>, %b0_Wv: tensor<192x192xf32>, %b0_bv: tensor<192xf32>, %b0_Wo: tensor<192x192xf32>, %b0_bo: tensor<192xf32>, %b0_g2: tensor<192xf32>, %b0_bt2: tensor<192xf32>, %b0_Wfc1: tensor<192x768xf32>, %b0_bfc1: tensor<768xf32>, %b0_Wfc2: tensor<768x192xf32>, %b0_bfc2: tensor<192xf32>, %b1_g1: tensor<192xf32>, %b1_bt1: tensor<192xf32>, %b1_Wq: tensor<192x192xf32>, %b1_bq: tensor<192xf32>, %b1_Wk: tensor<192x192xf32>, %b1_bk: tensor<192xf32>, %b1_Wv: tensor<192x192xf32>, %b1_bv: tensor<192xf32>, %b1_Wo: tensor<192x192xf32>, %b1_bo: tensor<192xf32>, %b1_g2: tensor<192xf32>, %b1_bt2: tensor<192xf32>, %b1_Wfc1: tensor<192x768xf32>, %b1_bfc1: tensor<768xf32>, %b1_Wfc2: tensor<768x192xf32>, %b1_bfc2: tensor<192xf32>, %b2_g1: tensor<192xf32>, %b2_bt1: tensor<192xf32>, %b2_Wq: tensor<192x192xf32>, %b2_bq: tensor<192xf32>, %b2_Wk: tensor<192x192xf32>, %b2_bk: tensor<192xf32>, %b2_Wv: tensor<192x192xf32>, %b2_bv: tensor<192xf32>, %b2_Wo: tensor<192x192xf32>, %b2_bo: tensor<192xf32>, %b2_g2: tensor<192xf32>, %b2_bt2: tensor<192xf32>, %b2_Wfc1: tensor<192x768xf32>, %b2_bfc1: tensor<768xf32>, %b2_Wfc2: tensor<768x192xf32>, %b2_bfc2: tensor<192xf32>, %b3_g1: tensor<192xf32>, %b3_bt1: tensor<192xf32>, %b3_Wq: tensor<192x192xf32>, %b3_bq: tensor<192xf32>, %b3_Wk: tensor<192x192xf32>, %b3_bk: tensor<192xf32>, %b3_Wv: tensor<192x192xf32>, %b3_bv: tensor<192xf32>, %b3_Wo: tensor<192x192xf32>, %b3_bo: tensor<192xf32>, %b3_g2: tensor<192xf32>, %b3_bt2: tensor<192xf32>, %b3_Wfc1: tensor<192x768xf32>, %b3_bfc1: tensor<768xf32>, %b3_Wfc2: tensor<768x192xf32>, %b3_bfc2: tensor<192xf32>, %b4_g1: tensor<192xf32>, %b4_bt1: tensor<192xf32>, %b4_Wq: tensor<192x192xf32>, %b4_bq: tensor<192xf32>, %b4_Wk: tensor<192x192xf32>, %b4_bk: tensor<192xf32>, %b4_Wv: tensor<192x192xf32>, %b4_bv: tensor<192xf32>, %b4_Wo: tensor<192x192xf32>, %b4_bo: tensor<192xf32>, %b4_g2: tensor<192xf32>, %b4_bt2: tensor<192xf32>, %b4_Wfc1: tensor<192x768xf32>, %b4_bfc1: tensor<768xf32>, %b4_Wfc2: tensor<768x192xf32>, %b4_bfc2: tensor<192xf32>, %b5_g1: tensor<192xf32>, %b5_bt1: tensor<192xf32>, %b5_Wq: tensor<192x192xf32>, %b5_bq: tensor<192xf32>, %b5_Wk: tensor<192x192xf32>, %b5_bk: tensor<192xf32>, %b5_Wv: tensor<192x192xf32>, %b5_bv: tensor<192xf32>, %b5_Wo: tensor<192x192xf32>, %b5_bo: tensor<192xf32>, %b5_g2: tensor<192xf32>, %b5_bt2: tensor<192xf32>, %b5_Wfc1: tensor<192x768xf32>, %b5_bfc1: tensor<768xf32>, %b5_Wfc2: tensor<768x192xf32>, %b5_bfc2: tensor<192xf32>, %b6_g1: tensor<192xf32>, %b6_bt1: tensor<192xf32>, %b6_Wq: tensor<192x192xf32>, %b6_bq: tensor<192xf32>, %b6_Wk: tensor<192x192xf32>, %b6_bk: tensor<192xf32>, %b6_Wv: tensor<192x192xf32>, %b6_bv: tensor<192xf32>, %b6_Wo: tensor<192x192xf32>, %b6_bo: tensor<192xf32>, %b6_g2: tensor<192xf32>, %b6_bt2: tensor<192xf32>, %b6_Wfc1: tensor<192x768xf32>, %b6_bfc1: tensor<768xf32>, %b6_Wfc2: tensor<768x192xf32>, %b6_bfc2: tensor<192xf32>, %b7_g1: tensor<192xf32>, %b7_bt1: tensor<192xf32>, %b7_Wq: tensor<192x192xf32>, %b7_bq: tensor<192xf32>, %b7_Wk: tensor<192x192xf32>, %b7_bk: tensor<192xf32>, %b7_Wv: tensor<192x192xf32>, %b7_bv: tensor<192xf32>, %b7_Wo: tensor<192x192xf32>, %b7_bo: tensor<192xf32>, %b7_g2: tensor<192xf32>, %b7_bt2: tensor<192xf32>, %b7_Wfc1: tensor<192x768xf32>, %b7_bfc1: tensor<768xf32>, %b7_Wfc2: tensor<768x192xf32>, %b7_bfc2: tensor<192xf32>, %b8_g1: tensor<192xf32>, %b8_bt1: tensor<192xf32>, %b8_Wq: tensor<192x192xf32>, %b8_bq: tensor<192xf32>, %b8_Wk: tensor<192x192xf32>, %b8_bk: tensor<192xf32>, %b8_Wv: tensor<192x192xf32>, %b8_bv: tensor<192xf32>, %b8_Wo: tensor<192x192xf32>, %b8_bo: tensor<192xf32>, %b8_g2: tensor<192xf32>, %b8_bt2: tensor<192xf32>, %b8_Wfc1: tensor<192x768xf32>, %b8_bfc1: tensor<768xf32>, %b8_Wfc2: tensor<768x192xf32>, %b8_bfc2: tensor<192xf32>, %b9_g1: tensor<192xf32>, %b9_bt1: tensor<192xf32>, %b9_Wq: tensor<192x192xf32>, %b9_bq: tensor<192xf32>, %b9_Wk: tensor<192x192xf32>, %b9_bk: tensor<192xf32>, %b9_Wv: tensor<192x192xf32>, %b9_bv: tensor<192xf32>, %b9_Wo: tensor<192x192xf32>, %b9_bo: tensor<192xf32>, %b9_g2: tensor<192xf32>, %b9_bt2: tensor<192xf32>, %b9_Wfc1: tensor<192x768xf32>, %b9_bfc1: tensor<768xf32>, %b9_Wfc2: tensor<768x192xf32>, %b9_bfc2: tensor<192xf32>, %b10_g1: tensor<192xf32>, %b10_bt1: tensor<192xf32>, %b10_Wq: tensor<192x192xf32>, %b10_bq: tensor<192xf32>, %b10_Wk: tensor<192x192xf32>, %b10_bk: tensor<192xf32>, %b10_Wv: tensor<192x192xf32>, %b10_bv: tensor<192xf32>, %b10_Wo: tensor<192x192xf32>, %b10_bo: tensor<192xf32>, %b10_g2: tensor<192xf32>, %b10_bt2: tensor<192xf32>, %b10_Wfc1: tensor<192x768xf32>, %b10_bfc1: tensor<768xf32>, %b10_Wfc2: tensor<768x192xf32>, %b10_bfc2: tensor<192xf32>, %b11_g1: tensor<192xf32>, %b11_bt1: tensor<192xf32>, %b11_Wq: tensor<192x192xf32>, %b11_bq: tensor<192xf32>, %b11_Wk: tensor<192x192xf32>, %b11_bk: tensor<192xf32>, %b11_Wv: tensor<192x192xf32>, %b11_bv: tensor<192xf32>, %b11_Wo: tensor<192x192xf32>, %b11_bo: tensor<192xf32>, %b11_g2: tensor<192xf32>, %b11_bt2: tensor<192xf32>, %b11_Wfc1: tensor<192x768xf32>, %b11_bfc1: tensor<768xf32>, %b11_Wfc2: tensor<768x192xf32>, %b11_bfc2: tensor<192xf32>, %gF: tensor<192xf32>, %btF: tensor<192xf32>, %Wc: tensor<192x1000xf32>, %bc: tensor<1000xf32>) -> tensor<256x1000xf32> {
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
    %v206 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v207 = stablehlo.multiply %v206, %v205 : tensor<256x151296xf32>
    %v208 = stablehlo.negate %v205 : tensor<256x151296xf32>
    %v209 = stablehlo.constant dense<0.7071067811865476> : tensor<256x151296xf32>
    %v210 = stablehlo.multiply %v208, %v209 : tensor<256x151296xf32>
    %v211 = chlo.erfc %v210 : tensor<256x151296xf32> -> tensor<256x151296xf32>
    %v212 = stablehlo.multiply %v207, %v211 : tensor<256x151296xf32>
    %v213 = stablehlo.reshape %v212 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v214 = stablehlo.dot_general %v213, %b0_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v215 = stablehlo.broadcast_in_dim %b0_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v216 = stablehlo.add %v214, %v215 : tensor<256x197x192xf32>
    %v217 = stablehlo.reshape %v216 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v218 = stablehlo.add %v172, %v217 : tensor<256x37824xf32>
    %v219 = stablehlo.reshape %v218 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v220 = stablehlo.constant dense<0.0> : tensor<f32>
    %v221 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v222 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v223 = stablehlo.reduce(%v219 init: %v220) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v224 = stablehlo.broadcast_in_dim %v223, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v225 = stablehlo.divide %v224, %v221 : tensor<256x197x192xf32>
    %v226 = stablehlo.subtract %v219, %v225 : tensor<256x197x192xf32>
    %v227 = stablehlo.multiply %v226, %v226 : tensor<256x197x192xf32>
    %v228 = stablehlo.reduce(%v227 init: %v220) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v229 = stablehlo.broadcast_in_dim %v228, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v230 = stablehlo.divide %v229, %v221 : tensor<256x197x192xf32>
    %v231 = stablehlo.add %v230, %v222 : tensor<256x197x192xf32>
    %v232 = stablehlo.rsqrt %v231 : tensor<256x197x192xf32>
    %v233 = stablehlo.multiply %v226, %v232 : tensor<256x197x192xf32>
    %v234 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v235 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v236 = stablehlo.multiply %v233, %v234 : tensor<256x197x192xf32>
    %v237 = stablehlo.add %v236, %v235 : tensor<256x197x192xf32>
    %v238 = stablehlo.reshape %v237 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v239 = stablehlo.reshape %v238 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v240 = stablehlo.broadcast_in_dim %b1_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v241 = stablehlo.multiply %v239, %v240 : tensor<256x197x192xf32>
    %v242 = stablehlo.reshape %v241 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v243 = stablehlo.reshape %v242 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v244 = stablehlo.broadcast_in_dim %b1_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v245 = stablehlo.add %v243, %v244 : tensor<256x197x192xf32>
    %v246 = stablehlo.reshape %v245 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v247 = stablehlo.reshape %v246 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v248 = stablehlo.dot_general %v247, %b1_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v249 = stablehlo.broadcast_in_dim %b1_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v250 = stablehlo.add %v248, %v249 : tensor<256x197x192xf32>
    %v251 = stablehlo.reshape %v250 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v252 = stablehlo.reshape %v246 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v253 = stablehlo.dot_general %v252, %b1_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v254 = stablehlo.broadcast_in_dim %b1_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v255 = stablehlo.add %v253, %v254 : tensor<256x197x192xf32>
    %v256 = stablehlo.reshape %v255 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v257 = stablehlo.reshape %v246 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v258 = stablehlo.dot_general %v257, %b1_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v259 = stablehlo.broadcast_in_dim %b1_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v260 = stablehlo.add %v258, %v259 : tensor<256x197x192xf32>
    %v261 = stablehlo.reshape %v260 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v262 = stablehlo.reshape %v251 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v263 = stablehlo.slice %v262 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v264 = stablehlo.reshape %v263 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v265 = stablehlo.reshape %v256 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v266 = stablehlo.slice %v265 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v267 = stablehlo.reshape %v266 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v268 = stablehlo.reshape %v261 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v269 = stablehlo.slice %v268 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v270 = stablehlo.reshape %v269 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v271 = stablehlo.reshape %v267 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v272 = stablehlo.transpose %v271, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v273 = stablehlo.reshape %v272 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v274 = stablehlo.reshape %v264 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v275 = stablehlo.reshape %v273 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v276 = stablehlo.dot_general %v274, %v275, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v277 = stablehlo.reshape %v276 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v278 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v279 = stablehlo.multiply %v277, %v278 : tensor<256x38809xf32>
    %v280 = stablehlo.reshape %v279 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v281 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v282 = stablehlo.reduce(%v280 init: %v281) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v283 = stablehlo.broadcast_in_dim %v282, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v284 = stablehlo.subtract %v280, %v283 : tensor<256x197x197xf32>
    %v285 = stablehlo.constant dense<0.0> : tensor<f32>
    %v286 = stablehlo.exponential %v284 : tensor<256x197x197xf32>
    %v287 = stablehlo.reduce(%v286 init: %v285) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v288 = stablehlo.broadcast_in_dim %v287, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v289 = stablehlo.divide %v286, %v288 : tensor<256x197x197xf32>
    %v290 = stablehlo.reshape %v289 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v291 = stablehlo.reshape %v290 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v292 = stablehlo.reshape %v270 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v293 = stablehlo.dot_general %v291, %v292, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v294 = stablehlo.reshape %v293 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v295 = stablehlo.reshape %v294 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v296 = stablehlo.constant dense<0.0> : tensor<f32>
    %v297 = stablehlo.pad %v295, %v296, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v298 = stablehlo.reshape %v297 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v299 = stablehlo.reshape %v251 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v300 = stablehlo.slice %v299 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v301 = stablehlo.reshape %v300 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v302 = stablehlo.reshape %v256 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v303 = stablehlo.slice %v302 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v304 = stablehlo.reshape %v303 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v305 = stablehlo.reshape %v261 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v306 = stablehlo.slice %v305 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v307 = stablehlo.reshape %v306 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v308 = stablehlo.reshape %v304 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v309 = stablehlo.transpose %v308, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v310 = stablehlo.reshape %v309 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v311 = stablehlo.reshape %v301 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v312 = stablehlo.reshape %v310 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v313 = stablehlo.dot_general %v311, %v312, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v314 = stablehlo.reshape %v313 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v315 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v316 = stablehlo.multiply %v314, %v315 : tensor<256x38809xf32>
    %v317 = stablehlo.reshape %v316 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v318 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v319 = stablehlo.reduce(%v317 init: %v318) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v320 = stablehlo.broadcast_in_dim %v319, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v321 = stablehlo.subtract %v317, %v320 : tensor<256x197x197xf32>
    %v322 = stablehlo.constant dense<0.0> : tensor<f32>
    %v323 = stablehlo.exponential %v321 : tensor<256x197x197xf32>
    %v324 = stablehlo.reduce(%v323 init: %v322) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v325 = stablehlo.broadcast_in_dim %v324, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v326 = stablehlo.divide %v323, %v325 : tensor<256x197x197xf32>
    %v327 = stablehlo.reshape %v326 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v328 = stablehlo.reshape %v327 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v329 = stablehlo.reshape %v307 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v330 = stablehlo.dot_general %v328, %v329, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v331 = stablehlo.reshape %v330 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v332 = stablehlo.reshape %v331 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v333 = stablehlo.constant dense<0.0> : tensor<f32>
    %v334 = stablehlo.pad %v332, %v333, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v335 = stablehlo.reshape %v334 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v336 = stablehlo.add %v298, %v335 : tensor<256x37824xf32>
    %v337 = stablehlo.reshape %v251 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v338 = stablehlo.slice %v337 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v339 = stablehlo.reshape %v338 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v340 = stablehlo.reshape %v256 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v341 = stablehlo.slice %v340 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v342 = stablehlo.reshape %v341 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v343 = stablehlo.reshape %v261 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v344 = stablehlo.slice %v343 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v345 = stablehlo.reshape %v344 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v346 = stablehlo.reshape %v342 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v347 = stablehlo.transpose %v346, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v348 = stablehlo.reshape %v347 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v349 = stablehlo.reshape %v339 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v350 = stablehlo.reshape %v348 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v351 = stablehlo.dot_general %v349, %v350, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v352 = stablehlo.reshape %v351 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v353 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v354 = stablehlo.multiply %v352, %v353 : tensor<256x38809xf32>
    %v355 = stablehlo.reshape %v354 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v356 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v357 = stablehlo.reduce(%v355 init: %v356) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v358 = stablehlo.broadcast_in_dim %v357, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v359 = stablehlo.subtract %v355, %v358 : tensor<256x197x197xf32>
    %v360 = stablehlo.constant dense<0.0> : tensor<f32>
    %v361 = stablehlo.exponential %v359 : tensor<256x197x197xf32>
    %v362 = stablehlo.reduce(%v361 init: %v360) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v363 = stablehlo.broadcast_in_dim %v362, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v364 = stablehlo.divide %v361, %v363 : tensor<256x197x197xf32>
    %v365 = stablehlo.reshape %v364 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v366 = stablehlo.reshape %v365 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v367 = stablehlo.reshape %v345 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v368 = stablehlo.dot_general %v366, %v367, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v369 = stablehlo.reshape %v368 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v370 = stablehlo.reshape %v369 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v371 = stablehlo.constant dense<0.0> : tensor<f32>
    %v372 = stablehlo.pad %v370, %v371, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v373 = stablehlo.reshape %v372 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v374 = stablehlo.add %v336, %v373 : tensor<256x37824xf32>
    %v375 = stablehlo.reshape %v374 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v376 = stablehlo.dot_general %v375, %b1_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v377 = stablehlo.broadcast_in_dim %b1_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v378 = stablehlo.add %v376, %v377 : tensor<256x197x192xf32>
    %v379 = stablehlo.reshape %v378 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v380 = stablehlo.add %v218, %v379 : tensor<256x37824xf32>
    %v381 = stablehlo.reshape %v380 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v382 = stablehlo.constant dense<0.0> : tensor<f32>
    %v383 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v384 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v385 = stablehlo.reduce(%v381 init: %v382) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v386 = stablehlo.broadcast_in_dim %v385, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v387 = stablehlo.divide %v386, %v383 : tensor<256x197x192xf32>
    %v388 = stablehlo.subtract %v381, %v387 : tensor<256x197x192xf32>
    %v389 = stablehlo.multiply %v388, %v388 : tensor<256x197x192xf32>
    %v390 = stablehlo.reduce(%v389 init: %v382) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v391 = stablehlo.broadcast_in_dim %v390, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v392 = stablehlo.divide %v391, %v383 : tensor<256x197x192xf32>
    %v393 = stablehlo.add %v392, %v384 : tensor<256x197x192xf32>
    %v394 = stablehlo.rsqrt %v393 : tensor<256x197x192xf32>
    %v395 = stablehlo.multiply %v388, %v394 : tensor<256x197x192xf32>
    %v396 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v397 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v398 = stablehlo.multiply %v395, %v396 : tensor<256x197x192xf32>
    %v399 = stablehlo.add %v398, %v397 : tensor<256x197x192xf32>
    %v400 = stablehlo.reshape %v399 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v401 = stablehlo.reshape %v400 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v402 = stablehlo.broadcast_in_dim %b1_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v403 = stablehlo.multiply %v401, %v402 : tensor<256x197x192xf32>
    %v404 = stablehlo.reshape %v403 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v405 = stablehlo.reshape %v404 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v406 = stablehlo.broadcast_in_dim %b1_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v407 = stablehlo.add %v405, %v406 : tensor<256x197x192xf32>
    %v408 = stablehlo.reshape %v407 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v409 = stablehlo.reshape %v408 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v410 = stablehlo.dot_general %v409, %b1_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v411 = stablehlo.broadcast_in_dim %b1_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v412 = stablehlo.add %v410, %v411 : tensor<256x197x768xf32>
    %v413 = stablehlo.reshape %v412 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v414 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v415 = stablehlo.multiply %v414, %v413 : tensor<256x151296xf32>
    %v416 = stablehlo.negate %v413 : tensor<256x151296xf32>
    %v417 = stablehlo.constant dense<0.7071067811865476> : tensor<256x151296xf32>
    %v418 = stablehlo.multiply %v416, %v417 : tensor<256x151296xf32>
    %v419 = chlo.erfc %v418 : tensor<256x151296xf32> -> tensor<256x151296xf32>
    %v420 = stablehlo.multiply %v415, %v419 : tensor<256x151296xf32>
    %v421 = stablehlo.reshape %v420 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v422 = stablehlo.dot_general %v421, %b1_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v423 = stablehlo.broadcast_in_dim %b1_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v424 = stablehlo.add %v422, %v423 : tensor<256x197x192xf32>
    %v425 = stablehlo.reshape %v424 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v426 = stablehlo.add %v380, %v425 : tensor<256x37824xf32>
    %v427 = stablehlo.reshape %v426 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v428 = stablehlo.constant dense<0.0> : tensor<f32>
    %v429 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v430 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v431 = stablehlo.reduce(%v427 init: %v428) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v432 = stablehlo.broadcast_in_dim %v431, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v433 = stablehlo.divide %v432, %v429 : tensor<256x197x192xf32>
    %v434 = stablehlo.subtract %v427, %v433 : tensor<256x197x192xf32>
    %v435 = stablehlo.multiply %v434, %v434 : tensor<256x197x192xf32>
    %v436 = stablehlo.reduce(%v435 init: %v428) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v437 = stablehlo.broadcast_in_dim %v436, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v438 = stablehlo.divide %v437, %v429 : tensor<256x197x192xf32>
    %v439 = stablehlo.add %v438, %v430 : tensor<256x197x192xf32>
    %v440 = stablehlo.rsqrt %v439 : tensor<256x197x192xf32>
    %v441 = stablehlo.multiply %v434, %v440 : tensor<256x197x192xf32>
    %v442 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v443 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v444 = stablehlo.multiply %v441, %v442 : tensor<256x197x192xf32>
    %v445 = stablehlo.add %v444, %v443 : tensor<256x197x192xf32>
    %v446 = stablehlo.reshape %v445 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v447 = stablehlo.reshape %v446 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v448 = stablehlo.broadcast_in_dim %b2_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v449 = stablehlo.multiply %v447, %v448 : tensor<256x197x192xf32>
    %v450 = stablehlo.reshape %v449 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v451 = stablehlo.reshape %v450 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v452 = stablehlo.broadcast_in_dim %b2_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v453 = stablehlo.add %v451, %v452 : tensor<256x197x192xf32>
    %v454 = stablehlo.reshape %v453 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v455 = stablehlo.reshape %v454 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v456 = stablehlo.dot_general %v455, %b2_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v457 = stablehlo.broadcast_in_dim %b2_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v458 = stablehlo.add %v456, %v457 : tensor<256x197x192xf32>
    %v459 = stablehlo.reshape %v458 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v460 = stablehlo.reshape %v454 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v461 = stablehlo.dot_general %v460, %b2_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v462 = stablehlo.broadcast_in_dim %b2_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v463 = stablehlo.add %v461, %v462 : tensor<256x197x192xf32>
    %v464 = stablehlo.reshape %v463 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v465 = stablehlo.reshape %v454 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v466 = stablehlo.dot_general %v465, %b2_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v467 = stablehlo.broadcast_in_dim %b2_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v468 = stablehlo.add %v466, %v467 : tensor<256x197x192xf32>
    %v469 = stablehlo.reshape %v468 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v470 = stablehlo.reshape %v459 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v471 = stablehlo.slice %v470 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v472 = stablehlo.reshape %v471 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v473 = stablehlo.reshape %v464 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v474 = stablehlo.slice %v473 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v475 = stablehlo.reshape %v474 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v476 = stablehlo.reshape %v469 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v477 = stablehlo.slice %v476 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v478 = stablehlo.reshape %v477 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v479 = stablehlo.reshape %v475 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v480 = stablehlo.transpose %v479, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v481 = stablehlo.reshape %v480 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v482 = stablehlo.reshape %v472 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v483 = stablehlo.reshape %v481 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v484 = stablehlo.dot_general %v482, %v483, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v485 = stablehlo.reshape %v484 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v486 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v487 = stablehlo.multiply %v485, %v486 : tensor<256x38809xf32>
    %v488 = stablehlo.reshape %v487 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v489 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v490 = stablehlo.reduce(%v488 init: %v489) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v491 = stablehlo.broadcast_in_dim %v490, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v492 = stablehlo.subtract %v488, %v491 : tensor<256x197x197xf32>
    %v493 = stablehlo.constant dense<0.0> : tensor<f32>
    %v494 = stablehlo.exponential %v492 : tensor<256x197x197xf32>
    %v495 = stablehlo.reduce(%v494 init: %v493) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v496 = stablehlo.broadcast_in_dim %v495, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v497 = stablehlo.divide %v494, %v496 : tensor<256x197x197xf32>
    %v498 = stablehlo.reshape %v497 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v499 = stablehlo.reshape %v498 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v500 = stablehlo.reshape %v478 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v501 = stablehlo.dot_general %v499, %v500, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v502 = stablehlo.reshape %v501 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v503 = stablehlo.reshape %v502 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v504 = stablehlo.constant dense<0.0> : tensor<f32>
    %v505 = stablehlo.pad %v503, %v504, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v506 = stablehlo.reshape %v505 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v507 = stablehlo.reshape %v459 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v508 = stablehlo.slice %v507 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v509 = stablehlo.reshape %v508 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v510 = stablehlo.reshape %v464 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v511 = stablehlo.slice %v510 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v512 = stablehlo.reshape %v511 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v513 = stablehlo.reshape %v469 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v514 = stablehlo.slice %v513 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v515 = stablehlo.reshape %v514 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v516 = stablehlo.reshape %v512 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v517 = stablehlo.transpose %v516, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v518 = stablehlo.reshape %v517 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v519 = stablehlo.reshape %v509 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v520 = stablehlo.reshape %v518 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v521 = stablehlo.dot_general %v519, %v520, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v522 = stablehlo.reshape %v521 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v523 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v524 = stablehlo.multiply %v522, %v523 : tensor<256x38809xf32>
    %v525 = stablehlo.reshape %v524 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v526 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v527 = stablehlo.reduce(%v525 init: %v526) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v528 = stablehlo.broadcast_in_dim %v527, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v529 = stablehlo.subtract %v525, %v528 : tensor<256x197x197xf32>
    %v530 = stablehlo.constant dense<0.0> : tensor<f32>
    %v531 = stablehlo.exponential %v529 : tensor<256x197x197xf32>
    %v532 = stablehlo.reduce(%v531 init: %v530) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v533 = stablehlo.broadcast_in_dim %v532, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v534 = stablehlo.divide %v531, %v533 : tensor<256x197x197xf32>
    %v535 = stablehlo.reshape %v534 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v536 = stablehlo.reshape %v535 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v537 = stablehlo.reshape %v515 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v538 = stablehlo.dot_general %v536, %v537, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v539 = stablehlo.reshape %v538 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v540 = stablehlo.reshape %v539 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v541 = stablehlo.constant dense<0.0> : tensor<f32>
    %v542 = stablehlo.pad %v540, %v541, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v543 = stablehlo.reshape %v542 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v544 = stablehlo.add %v506, %v543 : tensor<256x37824xf32>
    %v545 = stablehlo.reshape %v459 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v546 = stablehlo.slice %v545 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v547 = stablehlo.reshape %v546 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v548 = stablehlo.reshape %v464 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v549 = stablehlo.slice %v548 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v550 = stablehlo.reshape %v549 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v551 = stablehlo.reshape %v469 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v552 = stablehlo.slice %v551 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v553 = stablehlo.reshape %v552 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v554 = stablehlo.reshape %v550 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v555 = stablehlo.transpose %v554, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v556 = stablehlo.reshape %v555 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v557 = stablehlo.reshape %v547 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v558 = stablehlo.reshape %v556 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v559 = stablehlo.dot_general %v557, %v558, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v560 = stablehlo.reshape %v559 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v561 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v562 = stablehlo.multiply %v560, %v561 : tensor<256x38809xf32>
    %v563 = stablehlo.reshape %v562 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v564 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v565 = stablehlo.reduce(%v563 init: %v564) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v566 = stablehlo.broadcast_in_dim %v565, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v567 = stablehlo.subtract %v563, %v566 : tensor<256x197x197xf32>
    %v568 = stablehlo.constant dense<0.0> : tensor<f32>
    %v569 = stablehlo.exponential %v567 : tensor<256x197x197xf32>
    %v570 = stablehlo.reduce(%v569 init: %v568) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v571 = stablehlo.broadcast_in_dim %v570, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v572 = stablehlo.divide %v569, %v571 : tensor<256x197x197xf32>
    %v573 = stablehlo.reshape %v572 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v574 = stablehlo.reshape %v573 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v575 = stablehlo.reshape %v553 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v576 = stablehlo.dot_general %v574, %v575, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v577 = stablehlo.reshape %v576 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v578 = stablehlo.reshape %v577 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v579 = stablehlo.constant dense<0.0> : tensor<f32>
    %v580 = stablehlo.pad %v578, %v579, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v581 = stablehlo.reshape %v580 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v582 = stablehlo.add %v544, %v581 : tensor<256x37824xf32>
    %v583 = stablehlo.reshape %v582 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v584 = stablehlo.dot_general %v583, %b2_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v585 = stablehlo.broadcast_in_dim %b2_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v586 = stablehlo.add %v584, %v585 : tensor<256x197x192xf32>
    %v587 = stablehlo.reshape %v586 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v588 = stablehlo.add %v426, %v587 : tensor<256x37824xf32>
    %v589 = stablehlo.reshape %v588 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v590 = stablehlo.constant dense<0.0> : tensor<f32>
    %v591 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v592 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v593 = stablehlo.reduce(%v589 init: %v590) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v594 = stablehlo.broadcast_in_dim %v593, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v595 = stablehlo.divide %v594, %v591 : tensor<256x197x192xf32>
    %v596 = stablehlo.subtract %v589, %v595 : tensor<256x197x192xf32>
    %v597 = stablehlo.multiply %v596, %v596 : tensor<256x197x192xf32>
    %v598 = stablehlo.reduce(%v597 init: %v590) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v599 = stablehlo.broadcast_in_dim %v598, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v600 = stablehlo.divide %v599, %v591 : tensor<256x197x192xf32>
    %v601 = stablehlo.add %v600, %v592 : tensor<256x197x192xf32>
    %v602 = stablehlo.rsqrt %v601 : tensor<256x197x192xf32>
    %v603 = stablehlo.multiply %v596, %v602 : tensor<256x197x192xf32>
    %v604 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v605 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v606 = stablehlo.multiply %v603, %v604 : tensor<256x197x192xf32>
    %v607 = stablehlo.add %v606, %v605 : tensor<256x197x192xf32>
    %v608 = stablehlo.reshape %v607 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v609 = stablehlo.reshape %v608 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v610 = stablehlo.broadcast_in_dim %b2_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v611 = stablehlo.multiply %v609, %v610 : tensor<256x197x192xf32>
    %v612 = stablehlo.reshape %v611 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v613 = stablehlo.reshape %v612 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v614 = stablehlo.broadcast_in_dim %b2_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v615 = stablehlo.add %v613, %v614 : tensor<256x197x192xf32>
    %v616 = stablehlo.reshape %v615 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v617 = stablehlo.reshape %v616 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v618 = stablehlo.dot_general %v617, %b2_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v619 = stablehlo.broadcast_in_dim %b2_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v620 = stablehlo.add %v618, %v619 : tensor<256x197x768xf32>
    %v621 = stablehlo.reshape %v620 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v622 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v623 = stablehlo.multiply %v622, %v621 : tensor<256x151296xf32>
    %v624 = stablehlo.negate %v621 : tensor<256x151296xf32>
    %v625 = stablehlo.constant dense<0.7071067811865476> : tensor<256x151296xf32>
    %v626 = stablehlo.multiply %v624, %v625 : tensor<256x151296xf32>
    %v627 = chlo.erfc %v626 : tensor<256x151296xf32> -> tensor<256x151296xf32>
    %v628 = stablehlo.multiply %v623, %v627 : tensor<256x151296xf32>
    %v629 = stablehlo.reshape %v628 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v630 = stablehlo.dot_general %v629, %b2_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v631 = stablehlo.broadcast_in_dim %b2_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v632 = stablehlo.add %v630, %v631 : tensor<256x197x192xf32>
    %v633 = stablehlo.reshape %v632 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v634 = stablehlo.add %v588, %v633 : tensor<256x37824xf32>
    %v635 = stablehlo.reshape %v634 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v636 = stablehlo.constant dense<0.0> : tensor<f32>
    %v637 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v638 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v639 = stablehlo.reduce(%v635 init: %v636) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v640 = stablehlo.broadcast_in_dim %v639, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v641 = stablehlo.divide %v640, %v637 : tensor<256x197x192xf32>
    %v642 = stablehlo.subtract %v635, %v641 : tensor<256x197x192xf32>
    %v643 = stablehlo.multiply %v642, %v642 : tensor<256x197x192xf32>
    %v644 = stablehlo.reduce(%v643 init: %v636) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v645 = stablehlo.broadcast_in_dim %v644, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v646 = stablehlo.divide %v645, %v637 : tensor<256x197x192xf32>
    %v647 = stablehlo.add %v646, %v638 : tensor<256x197x192xf32>
    %v648 = stablehlo.rsqrt %v647 : tensor<256x197x192xf32>
    %v649 = stablehlo.multiply %v642, %v648 : tensor<256x197x192xf32>
    %v650 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v651 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v652 = stablehlo.multiply %v649, %v650 : tensor<256x197x192xf32>
    %v653 = stablehlo.add %v652, %v651 : tensor<256x197x192xf32>
    %v654 = stablehlo.reshape %v653 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v655 = stablehlo.reshape %v654 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v656 = stablehlo.broadcast_in_dim %b3_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v657 = stablehlo.multiply %v655, %v656 : tensor<256x197x192xf32>
    %v658 = stablehlo.reshape %v657 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v659 = stablehlo.reshape %v658 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v660 = stablehlo.broadcast_in_dim %b3_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v661 = stablehlo.add %v659, %v660 : tensor<256x197x192xf32>
    %v662 = stablehlo.reshape %v661 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v663 = stablehlo.reshape %v662 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v664 = stablehlo.dot_general %v663, %b3_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v665 = stablehlo.broadcast_in_dim %b3_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v666 = stablehlo.add %v664, %v665 : tensor<256x197x192xf32>
    %v667 = stablehlo.reshape %v666 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v668 = stablehlo.reshape %v662 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v669 = stablehlo.dot_general %v668, %b3_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v670 = stablehlo.broadcast_in_dim %b3_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v671 = stablehlo.add %v669, %v670 : tensor<256x197x192xf32>
    %v672 = stablehlo.reshape %v671 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v673 = stablehlo.reshape %v662 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v674 = stablehlo.dot_general %v673, %b3_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v675 = stablehlo.broadcast_in_dim %b3_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v676 = stablehlo.add %v674, %v675 : tensor<256x197x192xf32>
    %v677 = stablehlo.reshape %v676 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v678 = stablehlo.reshape %v667 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v679 = stablehlo.slice %v678 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v680 = stablehlo.reshape %v679 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v681 = stablehlo.reshape %v672 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v682 = stablehlo.slice %v681 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v683 = stablehlo.reshape %v682 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v684 = stablehlo.reshape %v677 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v685 = stablehlo.slice %v684 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v686 = stablehlo.reshape %v685 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v687 = stablehlo.reshape %v683 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v688 = stablehlo.transpose %v687, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v689 = stablehlo.reshape %v688 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v690 = stablehlo.reshape %v680 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v691 = stablehlo.reshape %v689 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v692 = stablehlo.dot_general %v690, %v691, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v693 = stablehlo.reshape %v692 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v694 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v695 = stablehlo.multiply %v693, %v694 : tensor<256x38809xf32>
    %v696 = stablehlo.reshape %v695 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v697 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v698 = stablehlo.reduce(%v696 init: %v697) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v699 = stablehlo.broadcast_in_dim %v698, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v700 = stablehlo.subtract %v696, %v699 : tensor<256x197x197xf32>
    %v701 = stablehlo.constant dense<0.0> : tensor<f32>
    %v702 = stablehlo.exponential %v700 : tensor<256x197x197xf32>
    %v703 = stablehlo.reduce(%v702 init: %v701) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v704 = stablehlo.broadcast_in_dim %v703, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v705 = stablehlo.divide %v702, %v704 : tensor<256x197x197xf32>
    %v706 = stablehlo.reshape %v705 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v707 = stablehlo.reshape %v706 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v708 = stablehlo.reshape %v686 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v709 = stablehlo.dot_general %v707, %v708, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v710 = stablehlo.reshape %v709 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v711 = stablehlo.reshape %v710 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v712 = stablehlo.constant dense<0.0> : tensor<f32>
    %v713 = stablehlo.pad %v711, %v712, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v714 = stablehlo.reshape %v713 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v715 = stablehlo.reshape %v667 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v716 = stablehlo.slice %v715 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v717 = stablehlo.reshape %v716 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v718 = stablehlo.reshape %v672 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v719 = stablehlo.slice %v718 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v720 = stablehlo.reshape %v719 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v721 = stablehlo.reshape %v677 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v722 = stablehlo.slice %v721 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v723 = stablehlo.reshape %v722 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v724 = stablehlo.reshape %v720 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v725 = stablehlo.transpose %v724, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v726 = stablehlo.reshape %v725 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v727 = stablehlo.reshape %v717 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v728 = stablehlo.reshape %v726 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v729 = stablehlo.dot_general %v727, %v728, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v730 = stablehlo.reshape %v729 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v731 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v732 = stablehlo.multiply %v730, %v731 : tensor<256x38809xf32>
    %v733 = stablehlo.reshape %v732 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v734 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v735 = stablehlo.reduce(%v733 init: %v734) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v736 = stablehlo.broadcast_in_dim %v735, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v737 = stablehlo.subtract %v733, %v736 : tensor<256x197x197xf32>
    %v738 = stablehlo.constant dense<0.0> : tensor<f32>
    %v739 = stablehlo.exponential %v737 : tensor<256x197x197xf32>
    %v740 = stablehlo.reduce(%v739 init: %v738) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v741 = stablehlo.broadcast_in_dim %v740, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v742 = stablehlo.divide %v739, %v741 : tensor<256x197x197xf32>
    %v743 = stablehlo.reshape %v742 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v744 = stablehlo.reshape %v743 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v745 = stablehlo.reshape %v723 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v746 = stablehlo.dot_general %v744, %v745, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v747 = stablehlo.reshape %v746 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v748 = stablehlo.reshape %v747 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v749 = stablehlo.constant dense<0.0> : tensor<f32>
    %v750 = stablehlo.pad %v748, %v749, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v751 = stablehlo.reshape %v750 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v752 = stablehlo.add %v714, %v751 : tensor<256x37824xf32>
    %v753 = stablehlo.reshape %v667 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v754 = stablehlo.slice %v753 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v755 = stablehlo.reshape %v754 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v756 = stablehlo.reshape %v672 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v757 = stablehlo.slice %v756 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v758 = stablehlo.reshape %v757 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v759 = stablehlo.reshape %v677 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v760 = stablehlo.slice %v759 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v761 = stablehlo.reshape %v760 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v762 = stablehlo.reshape %v758 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v763 = stablehlo.transpose %v762, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v764 = stablehlo.reshape %v763 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v765 = stablehlo.reshape %v755 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v766 = stablehlo.reshape %v764 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v767 = stablehlo.dot_general %v765, %v766, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v768 = stablehlo.reshape %v767 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v769 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v770 = stablehlo.multiply %v768, %v769 : tensor<256x38809xf32>
    %v771 = stablehlo.reshape %v770 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v772 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v773 = stablehlo.reduce(%v771 init: %v772) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v774 = stablehlo.broadcast_in_dim %v773, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v775 = stablehlo.subtract %v771, %v774 : tensor<256x197x197xf32>
    %v776 = stablehlo.constant dense<0.0> : tensor<f32>
    %v777 = stablehlo.exponential %v775 : tensor<256x197x197xf32>
    %v778 = stablehlo.reduce(%v777 init: %v776) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v779 = stablehlo.broadcast_in_dim %v778, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v780 = stablehlo.divide %v777, %v779 : tensor<256x197x197xf32>
    %v781 = stablehlo.reshape %v780 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v782 = stablehlo.reshape %v781 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v783 = stablehlo.reshape %v761 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v784 = stablehlo.dot_general %v782, %v783, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v785 = stablehlo.reshape %v784 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v786 = stablehlo.reshape %v785 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v787 = stablehlo.constant dense<0.0> : tensor<f32>
    %v788 = stablehlo.pad %v786, %v787, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v789 = stablehlo.reshape %v788 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v790 = stablehlo.add %v752, %v789 : tensor<256x37824xf32>
    %v791 = stablehlo.reshape %v790 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v792 = stablehlo.dot_general %v791, %b3_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v793 = stablehlo.broadcast_in_dim %b3_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v794 = stablehlo.add %v792, %v793 : tensor<256x197x192xf32>
    %v795 = stablehlo.reshape %v794 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v796 = stablehlo.add %v634, %v795 : tensor<256x37824xf32>
    %v797 = stablehlo.reshape %v796 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v798 = stablehlo.constant dense<0.0> : tensor<f32>
    %v799 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v800 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v801 = stablehlo.reduce(%v797 init: %v798) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v802 = stablehlo.broadcast_in_dim %v801, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v803 = stablehlo.divide %v802, %v799 : tensor<256x197x192xf32>
    %v804 = stablehlo.subtract %v797, %v803 : tensor<256x197x192xf32>
    %v805 = stablehlo.multiply %v804, %v804 : tensor<256x197x192xf32>
    %v806 = stablehlo.reduce(%v805 init: %v798) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v807 = stablehlo.broadcast_in_dim %v806, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v808 = stablehlo.divide %v807, %v799 : tensor<256x197x192xf32>
    %v809 = stablehlo.add %v808, %v800 : tensor<256x197x192xf32>
    %v810 = stablehlo.rsqrt %v809 : tensor<256x197x192xf32>
    %v811 = stablehlo.multiply %v804, %v810 : tensor<256x197x192xf32>
    %v812 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v813 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v814 = stablehlo.multiply %v811, %v812 : tensor<256x197x192xf32>
    %v815 = stablehlo.add %v814, %v813 : tensor<256x197x192xf32>
    %v816 = stablehlo.reshape %v815 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v817 = stablehlo.reshape %v816 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v818 = stablehlo.broadcast_in_dim %b3_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v819 = stablehlo.multiply %v817, %v818 : tensor<256x197x192xf32>
    %v820 = stablehlo.reshape %v819 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v821 = stablehlo.reshape %v820 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v822 = stablehlo.broadcast_in_dim %b3_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v823 = stablehlo.add %v821, %v822 : tensor<256x197x192xf32>
    %v824 = stablehlo.reshape %v823 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v825 = stablehlo.reshape %v824 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v826 = stablehlo.dot_general %v825, %b3_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v827 = stablehlo.broadcast_in_dim %b3_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v828 = stablehlo.add %v826, %v827 : tensor<256x197x768xf32>
    %v829 = stablehlo.reshape %v828 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v830 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v831 = stablehlo.multiply %v830, %v829 : tensor<256x151296xf32>
    %v832 = stablehlo.negate %v829 : tensor<256x151296xf32>
    %v833 = stablehlo.constant dense<0.7071067811865476> : tensor<256x151296xf32>
    %v834 = stablehlo.multiply %v832, %v833 : tensor<256x151296xf32>
    %v835 = chlo.erfc %v834 : tensor<256x151296xf32> -> tensor<256x151296xf32>
    %v836 = stablehlo.multiply %v831, %v835 : tensor<256x151296xf32>
    %v837 = stablehlo.reshape %v836 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v838 = stablehlo.dot_general %v837, %b3_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v839 = stablehlo.broadcast_in_dim %b3_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v840 = stablehlo.add %v838, %v839 : tensor<256x197x192xf32>
    %v841 = stablehlo.reshape %v840 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v842 = stablehlo.add %v796, %v841 : tensor<256x37824xf32>
    %v843 = stablehlo.reshape %v842 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v844 = stablehlo.constant dense<0.0> : tensor<f32>
    %v845 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v846 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v847 = stablehlo.reduce(%v843 init: %v844) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v848 = stablehlo.broadcast_in_dim %v847, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v849 = stablehlo.divide %v848, %v845 : tensor<256x197x192xf32>
    %v850 = stablehlo.subtract %v843, %v849 : tensor<256x197x192xf32>
    %v851 = stablehlo.multiply %v850, %v850 : tensor<256x197x192xf32>
    %v852 = stablehlo.reduce(%v851 init: %v844) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v853 = stablehlo.broadcast_in_dim %v852, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v854 = stablehlo.divide %v853, %v845 : tensor<256x197x192xf32>
    %v855 = stablehlo.add %v854, %v846 : tensor<256x197x192xf32>
    %v856 = stablehlo.rsqrt %v855 : tensor<256x197x192xf32>
    %v857 = stablehlo.multiply %v850, %v856 : tensor<256x197x192xf32>
    %v858 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v859 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v860 = stablehlo.multiply %v857, %v858 : tensor<256x197x192xf32>
    %v861 = stablehlo.add %v860, %v859 : tensor<256x197x192xf32>
    %v862 = stablehlo.reshape %v861 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v863 = stablehlo.reshape %v862 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v864 = stablehlo.broadcast_in_dim %b4_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v865 = stablehlo.multiply %v863, %v864 : tensor<256x197x192xf32>
    %v866 = stablehlo.reshape %v865 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v867 = stablehlo.reshape %v866 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v868 = stablehlo.broadcast_in_dim %b4_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v869 = stablehlo.add %v867, %v868 : tensor<256x197x192xf32>
    %v870 = stablehlo.reshape %v869 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v871 = stablehlo.reshape %v870 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v872 = stablehlo.dot_general %v871, %b4_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v873 = stablehlo.broadcast_in_dim %b4_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v874 = stablehlo.add %v872, %v873 : tensor<256x197x192xf32>
    %v875 = stablehlo.reshape %v874 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v876 = stablehlo.reshape %v870 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v877 = stablehlo.dot_general %v876, %b4_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v878 = stablehlo.broadcast_in_dim %b4_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v879 = stablehlo.add %v877, %v878 : tensor<256x197x192xf32>
    %v880 = stablehlo.reshape %v879 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v881 = stablehlo.reshape %v870 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v882 = stablehlo.dot_general %v881, %b4_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v883 = stablehlo.broadcast_in_dim %b4_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v884 = stablehlo.add %v882, %v883 : tensor<256x197x192xf32>
    %v885 = stablehlo.reshape %v884 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v886 = stablehlo.reshape %v875 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v887 = stablehlo.slice %v886 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v888 = stablehlo.reshape %v887 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v889 = stablehlo.reshape %v880 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v890 = stablehlo.slice %v889 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v891 = stablehlo.reshape %v890 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v892 = stablehlo.reshape %v885 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v893 = stablehlo.slice %v892 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v894 = stablehlo.reshape %v893 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v895 = stablehlo.reshape %v891 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v896 = stablehlo.transpose %v895, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v897 = stablehlo.reshape %v896 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v898 = stablehlo.reshape %v888 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v899 = stablehlo.reshape %v897 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v900 = stablehlo.dot_general %v898, %v899, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v901 = stablehlo.reshape %v900 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v902 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v903 = stablehlo.multiply %v901, %v902 : tensor<256x38809xf32>
    %v904 = stablehlo.reshape %v903 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v905 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v906 = stablehlo.reduce(%v904 init: %v905) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v907 = stablehlo.broadcast_in_dim %v906, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v908 = stablehlo.subtract %v904, %v907 : tensor<256x197x197xf32>
    %v909 = stablehlo.constant dense<0.0> : tensor<f32>
    %v910 = stablehlo.exponential %v908 : tensor<256x197x197xf32>
    %v911 = stablehlo.reduce(%v910 init: %v909) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v912 = stablehlo.broadcast_in_dim %v911, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v913 = stablehlo.divide %v910, %v912 : tensor<256x197x197xf32>
    %v914 = stablehlo.reshape %v913 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v915 = stablehlo.reshape %v914 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v916 = stablehlo.reshape %v894 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v917 = stablehlo.dot_general %v915, %v916, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v918 = stablehlo.reshape %v917 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v919 = stablehlo.reshape %v918 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v920 = stablehlo.constant dense<0.0> : tensor<f32>
    %v921 = stablehlo.pad %v919, %v920, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v922 = stablehlo.reshape %v921 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v923 = stablehlo.reshape %v875 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v924 = stablehlo.slice %v923 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v925 = stablehlo.reshape %v924 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v926 = stablehlo.reshape %v880 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v927 = stablehlo.slice %v926 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v928 = stablehlo.reshape %v927 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v929 = stablehlo.reshape %v885 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v930 = stablehlo.slice %v929 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v931 = stablehlo.reshape %v930 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v932 = stablehlo.reshape %v928 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v933 = stablehlo.transpose %v932, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v934 = stablehlo.reshape %v933 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v935 = stablehlo.reshape %v925 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v936 = stablehlo.reshape %v934 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v937 = stablehlo.dot_general %v935, %v936, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v938 = stablehlo.reshape %v937 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v939 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v940 = stablehlo.multiply %v938, %v939 : tensor<256x38809xf32>
    %v941 = stablehlo.reshape %v940 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v942 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v943 = stablehlo.reduce(%v941 init: %v942) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v944 = stablehlo.broadcast_in_dim %v943, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v945 = stablehlo.subtract %v941, %v944 : tensor<256x197x197xf32>
    %v946 = stablehlo.constant dense<0.0> : tensor<f32>
    %v947 = stablehlo.exponential %v945 : tensor<256x197x197xf32>
    %v948 = stablehlo.reduce(%v947 init: %v946) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v949 = stablehlo.broadcast_in_dim %v948, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v950 = stablehlo.divide %v947, %v949 : tensor<256x197x197xf32>
    %v951 = stablehlo.reshape %v950 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v952 = stablehlo.reshape %v951 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v953 = stablehlo.reshape %v931 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v954 = stablehlo.dot_general %v952, %v953, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v955 = stablehlo.reshape %v954 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v956 = stablehlo.reshape %v955 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v957 = stablehlo.constant dense<0.0> : tensor<f32>
    %v958 = stablehlo.pad %v956, %v957, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v959 = stablehlo.reshape %v958 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v960 = stablehlo.add %v922, %v959 : tensor<256x37824xf32>
    %v961 = stablehlo.reshape %v875 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v962 = stablehlo.slice %v961 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v963 = stablehlo.reshape %v962 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v964 = stablehlo.reshape %v880 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v965 = stablehlo.slice %v964 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v966 = stablehlo.reshape %v965 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v967 = stablehlo.reshape %v885 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v968 = stablehlo.slice %v967 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v969 = stablehlo.reshape %v968 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v970 = stablehlo.reshape %v966 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v971 = stablehlo.transpose %v970, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v972 = stablehlo.reshape %v971 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v973 = stablehlo.reshape %v963 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v974 = stablehlo.reshape %v972 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v975 = stablehlo.dot_general %v973, %v974, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v976 = stablehlo.reshape %v975 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v977 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v978 = stablehlo.multiply %v976, %v977 : tensor<256x38809xf32>
    %v979 = stablehlo.reshape %v978 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v980 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v981 = stablehlo.reduce(%v979 init: %v980) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v982 = stablehlo.broadcast_in_dim %v981, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v983 = stablehlo.subtract %v979, %v982 : tensor<256x197x197xf32>
    %v984 = stablehlo.constant dense<0.0> : tensor<f32>
    %v985 = stablehlo.exponential %v983 : tensor<256x197x197xf32>
    %v986 = stablehlo.reduce(%v985 init: %v984) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v987 = stablehlo.broadcast_in_dim %v986, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v988 = stablehlo.divide %v985, %v987 : tensor<256x197x197xf32>
    %v989 = stablehlo.reshape %v988 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v990 = stablehlo.reshape %v989 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v991 = stablehlo.reshape %v969 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v992 = stablehlo.dot_general %v990, %v991, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v993 = stablehlo.reshape %v992 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v994 = stablehlo.reshape %v993 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v995 = stablehlo.constant dense<0.0> : tensor<f32>
    %v996 = stablehlo.pad %v994, %v995, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v997 = stablehlo.reshape %v996 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v998 = stablehlo.add %v960, %v997 : tensor<256x37824xf32>
    %v999 = stablehlo.reshape %v998 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1000 = stablehlo.dot_general %v999, %b4_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1001 = stablehlo.broadcast_in_dim %b4_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1002 = stablehlo.add %v1000, %v1001 : tensor<256x197x192xf32>
    %v1003 = stablehlo.reshape %v1002 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1004 = stablehlo.add %v842, %v1003 : tensor<256x37824xf32>
    %v1005 = stablehlo.reshape %v1004 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1006 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1007 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1008 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1009 = stablehlo.reduce(%v1005 init: %v1006) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1010 = stablehlo.broadcast_in_dim %v1009, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1011 = stablehlo.divide %v1010, %v1007 : tensor<256x197x192xf32>
    %v1012 = stablehlo.subtract %v1005, %v1011 : tensor<256x197x192xf32>
    %v1013 = stablehlo.multiply %v1012, %v1012 : tensor<256x197x192xf32>
    %v1014 = stablehlo.reduce(%v1013 init: %v1006) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1015 = stablehlo.broadcast_in_dim %v1014, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1016 = stablehlo.divide %v1015, %v1007 : tensor<256x197x192xf32>
    %v1017 = stablehlo.add %v1016, %v1008 : tensor<256x197x192xf32>
    %v1018 = stablehlo.rsqrt %v1017 : tensor<256x197x192xf32>
    %v1019 = stablehlo.multiply %v1012, %v1018 : tensor<256x197x192xf32>
    %v1020 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1021 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1022 = stablehlo.multiply %v1019, %v1020 : tensor<256x197x192xf32>
    %v1023 = stablehlo.add %v1022, %v1021 : tensor<256x197x192xf32>
    %v1024 = stablehlo.reshape %v1023 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1025 = stablehlo.reshape %v1024 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1026 = stablehlo.broadcast_in_dim %b4_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1027 = stablehlo.multiply %v1025, %v1026 : tensor<256x197x192xf32>
    %v1028 = stablehlo.reshape %v1027 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1029 = stablehlo.reshape %v1028 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1030 = stablehlo.broadcast_in_dim %b4_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1031 = stablehlo.add %v1029, %v1030 : tensor<256x197x192xf32>
    %v1032 = stablehlo.reshape %v1031 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1033 = stablehlo.reshape %v1032 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1034 = stablehlo.dot_general %v1033, %b4_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v1035 = stablehlo.broadcast_in_dim %b4_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v1036 = stablehlo.add %v1034, %v1035 : tensor<256x197x768xf32>
    %v1037 = stablehlo.reshape %v1036 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v1038 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v1039 = stablehlo.multiply %v1038, %v1037 : tensor<256x151296xf32>
    %v1040 = stablehlo.negate %v1037 : tensor<256x151296xf32>
    %v1041 = stablehlo.constant dense<0.7071067811865476> : tensor<256x151296xf32>
    %v1042 = stablehlo.multiply %v1040, %v1041 : tensor<256x151296xf32>
    %v1043 = chlo.erfc %v1042 : tensor<256x151296xf32> -> tensor<256x151296xf32>
    %v1044 = stablehlo.multiply %v1039, %v1043 : tensor<256x151296xf32>
    %v1045 = stablehlo.reshape %v1044 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v1046 = stablehlo.dot_general %v1045, %b4_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v1047 = stablehlo.broadcast_in_dim %b4_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1048 = stablehlo.add %v1046, %v1047 : tensor<256x197x192xf32>
    %v1049 = stablehlo.reshape %v1048 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1050 = stablehlo.add %v1004, %v1049 : tensor<256x37824xf32>
    %v1051 = stablehlo.reshape %v1050 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1052 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1053 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1054 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1055 = stablehlo.reduce(%v1051 init: %v1052) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1056 = stablehlo.broadcast_in_dim %v1055, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1057 = stablehlo.divide %v1056, %v1053 : tensor<256x197x192xf32>
    %v1058 = stablehlo.subtract %v1051, %v1057 : tensor<256x197x192xf32>
    %v1059 = stablehlo.multiply %v1058, %v1058 : tensor<256x197x192xf32>
    %v1060 = stablehlo.reduce(%v1059 init: %v1052) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1061 = stablehlo.broadcast_in_dim %v1060, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1062 = stablehlo.divide %v1061, %v1053 : tensor<256x197x192xf32>
    %v1063 = stablehlo.add %v1062, %v1054 : tensor<256x197x192xf32>
    %v1064 = stablehlo.rsqrt %v1063 : tensor<256x197x192xf32>
    %v1065 = stablehlo.multiply %v1058, %v1064 : tensor<256x197x192xf32>
    %v1066 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1067 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1068 = stablehlo.multiply %v1065, %v1066 : tensor<256x197x192xf32>
    %v1069 = stablehlo.add %v1068, %v1067 : tensor<256x197x192xf32>
    %v1070 = stablehlo.reshape %v1069 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1071 = stablehlo.reshape %v1070 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1072 = stablehlo.broadcast_in_dim %b5_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1073 = stablehlo.multiply %v1071, %v1072 : tensor<256x197x192xf32>
    %v1074 = stablehlo.reshape %v1073 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1075 = stablehlo.reshape %v1074 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1076 = stablehlo.broadcast_in_dim %b5_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1077 = stablehlo.add %v1075, %v1076 : tensor<256x197x192xf32>
    %v1078 = stablehlo.reshape %v1077 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1079 = stablehlo.reshape %v1078 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1080 = stablehlo.dot_general %v1079, %b5_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1081 = stablehlo.broadcast_in_dim %b5_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1082 = stablehlo.add %v1080, %v1081 : tensor<256x197x192xf32>
    %v1083 = stablehlo.reshape %v1082 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1084 = stablehlo.reshape %v1078 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1085 = stablehlo.dot_general %v1084, %b5_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1086 = stablehlo.broadcast_in_dim %b5_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1087 = stablehlo.add %v1085, %v1086 : tensor<256x197x192xf32>
    %v1088 = stablehlo.reshape %v1087 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1089 = stablehlo.reshape %v1078 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1090 = stablehlo.dot_general %v1089, %b5_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1091 = stablehlo.broadcast_in_dim %b5_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1092 = stablehlo.add %v1090, %v1091 : tensor<256x197x192xf32>
    %v1093 = stablehlo.reshape %v1092 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1094 = stablehlo.reshape %v1083 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1095 = stablehlo.slice %v1094 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1096 = stablehlo.reshape %v1095 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1097 = stablehlo.reshape %v1088 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1098 = stablehlo.slice %v1097 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1099 = stablehlo.reshape %v1098 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1100 = stablehlo.reshape %v1093 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1101 = stablehlo.slice %v1100 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1102 = stablehlo.reshape %v1101 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1103 = stablehlo.reshape %v1099 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1104 = stablehlo.transpose %v1103, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1105 = stablehlo.reshape %v1104 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1106 = stablehlo.reshape %v1096 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1107 = stablehlo.reshape %v1105 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1108 = stablehlo.dot_general %v1106, %v1107, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1109 = stablehlo.reshape %v1108 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1110 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1111 = stablehlo.multiply %v1109, %v1110 : tensor<256x38809xf32>
    %v1112 = stablehlo.reshape %v1111 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1113 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1114 = stablehlo.reduce(%v1112 init: %v1113) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1115 = stablehlo.broadcast_in_dim %v1114, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1116 = stablehlo.subtract %v1112, %v1115 : tensor<256x197x197xf32>
    %v1117 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1118 = stablehlo.exponential %v1116 : tensor<256x197x197xf32>
    %v1119 = stablehlo.reduce(%v1118 init: %v1117) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1120 = stablehlo.broadcast_in_dim %v1119, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1121 = stablehlo.divide %v1118, %v1120 : tensor<256x197x197xf32>
    %v1122 = stablehlo.reshape %v1121 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1123 = stablehlo.reshape %v1122 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1124 = stablehlo.reshape %v1102 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1125 = stablehlo.dot_general %v1123, %v1124, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1126 = stablehlo.reshape %v1125 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1127 = stablehlo.reshape %v1126 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1128 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1129 = stablehlo.pad %v1127, %v1128, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1130 = stablehlo.reshape %v1129 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1131 = stablehlo.reshape %v1083 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1132 = stablehlo.slice %v1131 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1133 = stablehlo.reshape %v1132 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1134 = stablehlo.reshape %v1088 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1135 = stablehlo.slice %v1134 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1136 = stablehlo.reshape %v1135 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1137 = stablehlo.reshape %v1093 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1138 = stablehlo.slice %v1137 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1139 = stablehlo.reshape %v1138 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1140 = stablehlo.reshape %v1136 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1141 = stablehlo.transpose %v1140, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1142 = stablehlo.reshape %v1141 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1143 = stablehlo.reshape %v1133 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1144 = stablehlo.reshape %v1142 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1145 = stablehlo.dot_general %v1143, %v1144, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1146 = stablehlo.reshape %v1145 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1147 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1148 = stablehlo.multiply %v1146, %v1147 : tensor<256x38809xf32>
    %v1149 = stablehlo.reshape %v1148 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1150 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1151 = stablehlo.reduce(%v1149 init: %v1150) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1152 = stablehlo.broadcast_in_dim %v1151, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1153 = stablehlo.subtract %v1149, %v1152 : tensor<256x197x197xf32>
    %v1154 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1155 = stablehlo.exponential %v1153 : tensor<256x197x197xf32>
    %v1156 = stablehlo.reduce(%v1155 init: %v1154) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1157 = stablehlo.broadcast_in_dim %v1156, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1158 = stablehlo.divide %v1155, %v1157 : tensor<256x197x197xf32>
    %v1159 = stablehlo.reshape %v1158 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1160 = stablehlo.reshape %v1159 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1161 = stablehlo.reshape %v1139 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1162 = stablehlo.dot_general %v1160, %v1161, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1163 = stablehlo.reshape %v1162 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1164 = stablehlo.reshape %v1163 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1165 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1166 = stablehlo.pad %v1164, %v1165, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1167 = stablehlo.reshape %v1166 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1168 = stablehlo.add %v1130, %v1167 : tensor<256x37824xf32>
    %v1169 = stablehlo.reshape %v1083 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1170 = stablehlo.slice %v1169 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1171 = stablehlo.reshape %v1170 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1172 = stablehlo.reshape %v1088 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1173 = stablehlo.slice %v1172 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1174 = stablehlo.reshape %v1173 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1175 = stablehlo.reshape %v1093 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1176 = stablehlo.slice %v1175 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1177 = stablehlo.reshape %v1176 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1178 = stablehlo.reshape %v1174 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1179 = stablehlo.transpose %v1178, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1180 = stablehlo.reshape %v1179 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1181 = stablehlo.reshape %v1171 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1182 = stablehlo.reshape %v1180 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1183 = stablehlo.dot_general %v1181, %v1182, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1184 = stablehlo.reshape %v1183 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1185 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1186 = stablehlo.multiply %v1184, %v1185 : tensor<256x38809xf32>
    %v1187 = stablehlo.reshape %v1186 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1188 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1189 = stablehlo.reduce(%v1187 init: %v1188) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1190 = stablehlo.broadcast_in_dim %v1189, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1191 = stablehlo.subtract %v1187, %v1190 : tensor<256x197x197xf32>
    %v1192 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1193 = stablehlo.exponential %v1191 : tensor<256x197x197xf32>
    %v1194 = stablehlo.reduce(%v1193 init: %v1192) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1195 = stablehlo.broadcast_in_dim %v1194, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1196 = stablehlo.divide %v1193, %v1195 : tensor<256x197x197xf32>
    %v1197 = stablehlo.reshape %v1196 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1198 = stablehlo.reshape %v1197 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1199 = stablehlo.reshape %v1177 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1200 = stablehlo.dot_general %v1198, %v1199, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1201 = stablehlo.reshape %v1200 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1202 = stablehlo.reshape %v1201 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1203 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1204 = stablehlo.pad %v1202, %v1203, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1205 = stablehlo.reshape %v1204 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1206 = stablehlo.add %v1168, %v1205 : tensor<256x37824xf32>
    %v1207 = stablehlo.reshape %v1206 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1208 = stablehlo.dot_general %v1207, %b5_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1209 = stablehlo.broadcast_in_dim %b5_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1210 = stablehlo.add %v1208, %v1209 : tensor<256x197x192xf32>
    %v1211 = stablehlo.reshape %v1210 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1212 = stablehlo.add %v1050, %v1211 : tensor<256x37824xf32>
    %v1213 = stablehlo.reshape %v1212 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1214 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1215 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1216 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1217 = stablehlo.reduce(%v1213 init: %v1214) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1218 = stablehlo.broadcast_in_dim %v1217, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1219 = stablehlo.divide %v1218, %v1215 : tensor<256x197x192xf32>
    %v1220 = stablehlo.subtract %v1213, %v1219 : tensor<256x197x192xf32>
    %v1221 = stablehlo.multiply %v1220, %v1220 : tensor<256x197x192xf32>
    %v1222 = stablehlo.reduce(%v1221 init: %v1214) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1223 = stablehlo.broadcast_in_dim %v1222, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1224 = stablehlo.divide %v1223, %v1215 : tensor<256x197x192xf32>
    %v1225 = stablehlo.add %v1224, %v1216 : tensor<256x197x192xf32>
    %v1226 = stablehlo.rsqrt %v1225 : tensor<256x197x192xf32>
    %v1227 = stablehlo.multiply %v1220, %v1226 : tensor<256x197x192xf32>
    %v1228 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1229 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1230 = stablehlo.multiply %v1227, %v1228 : tensor<256x197x192xf32>
    %v1231 = stablehlo.add %v1230, %v1229 : tensor<256x197x192xf32>
    %v1232 = stablehlo.reshape %v1231 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1233 = stablehlo.reshape %v1232 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1234 = stablehlo.broadcast_in_dim %b5_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1235 = stablehlo.multiply %v1233, %v1234 : tensor<256x197x192xf32>
    %v1236 = stablehlo.reshape %v1235 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1237 = stablehlo.reshape %v1236 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1238 = stablehlo.broadcast_in_dim %b5_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1239 = stablehlo.add %v1237, %v1238 : tensor<256x197x192xf32>
    %v1240 = stablehlo.reshape %v1239 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1241 = stablehlo.reshape %v1240 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1242 = stablehlo.dot_general %v1241, %b5_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v1243 = stablehlo.broadcast_in_dim %b5_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v1244 = stablehlo.add %v1242, %v1243 : tensor<256x197x768xf32>
    %v1245 = stablehlo.reshape %v1244 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v1246 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v1247 = stablehlo.multiply %v1246, %v1245 : tensor<256x151296xf32>
    %v1248 = stablehlo.negate %v1245 : tensor<256x151296xf32>
    %v1249 = stablehlo.constant dense<0.7071067811865476> : tensor<256x151296xf32>
    %v1250 = stablehlo.multiply %v1248, %v1249 : tensor<256x151296xf32>
    %v1251 = chlo.erfc %v1250 : tensor<256x151296xf32> -> tensor<256x151296xf32>
    %v1252 = stablehlo.multiply %v1247, %v1251 : tensor<256x151296xf32>
    %v1253 = stablehlo.reshape %v1252 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v1254 = stablehlo.dot_general %v1253, %b5_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v1255 = stablehlo.broadcast_in_dim %b5_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1256 = stablehlo.add %v1254, %v1255 : tensor<256x197x192xf32>
    %v1257 = stablehlo.reshape %v1256 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1258 = stablehlo.add %v1212, %v1257 : tensor<256x37824xf32>
    %v1259 = stablehlo.reshape %v1258 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1260 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1261 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1262 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1263 = stablehlo.reduce(%v1259 init: %v1260) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1264 = stablehlo.broadcast_in_dim %v1263, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1265 = stablehlo.divide %v1264, %v1261 : tensor<256x197x192xf32>
    %v1266 = stablehlo.subtract %v1259, %v1265 : tensor<256x197x192xf32>
    %v1267 = stablehlo.multiply %v1266, %v1266 : tensor<256x197x192xf32>
    %v1268 = stablehlo.reduce(%v1267 init: %v1260) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1269 = stablehlo.broadcast_in_dim %v1268, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1270 = stablehlo.divide %v1269, %v1261 : tensor<256x197x192xf32>
    %v1271 = stablehlo.add %v1270, %v1262 : tensor<256x197x192xf32>
    %v1272 = stablehlo.rsqrt %v1271 : tensor<256x197x192xf32>
    %v1273 = stablehlo.multiply %v1266, %v1272 : tensor<256x197x192xf32>
    %v1274 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1275 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1276 = stablehlo.multiply %v1273, %v1274 : tensor<256x197x192xf32>
    %v1277 = stablehlo.add %v1276, %v1275 : tensor<256x197x192xf32>
    %v1278 = stablehlo.reshape %v1277 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1279 = stablehlo.reshape %v1278 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1280 = stablehlo.broadcast_in_dim %b6_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1281 = stablehlo.multiply %v1279, %v1280 : tensor<256x197x192xf32>
    %v1282 = stablehlo.reshape %v1281 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1283 = stablehlo.reshape %v1282 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1284 = stablehlo.broadcast_in_dim %b6_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1285 = stablehlo.add %v1283, %v1284 : tensor<256x197x192xf32>
    %v1286 = stablehlo.reshape %v1285 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1287 = stablehlo.reshape %v1286 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1288 = stablehlo.dot_general %v1287, %b6_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1289 = stablehlo.broadcast_in_dim %b6_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1290 = stablehlo.add %v1288, %v1289 : tensor<256x197x192xf32>
    %v1291 = stablehlo.reshape %v1290 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1292 = stablehlo.reshape %v1286 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1293 = stablehlo.dot_general %v1292, %b6_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1294 = stablehlo.broadcast_in_dim %b6_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1295 = stablehlo.add %v1293, %v1294 : tensor<256x197x192xf32>
    %v1296 = stablehlo.reshape %v1295 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1297 = stablehlo.reshape %v1286 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1298 = stablehlo.dot_general %v1297, %b6_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1299 = stablehlo.broadcast_in_dim %b6_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1300 = stablehlo.add %v1298, %v1299 : tensor<256x197x192xf32>
    %v1301 = stablehlo.reshape %v1300 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1302 = stablehlo.reshape %v1291 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1303 = stablehlo.slice %v1302 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1304 = stablehlo.reshape %v1303 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1305 = stablehlo.reshape %v1296 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1306 = stablehlo.slice %v1305 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1307 = stablehlo.reshape %v1306 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1308 = stablehlo.reshape %v1301 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1309 = stablehlo.slice %v1308 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1310 = stablehlo.reshape %v1309 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1311 = stablehlo.reshape %v1307 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1312 = stablehlo.transpose %v1311, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1313 = stablehlo.reshape %v1312 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1314 = stablehlo.reshape %v1304 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1315 = stablehlo.reshape %v1313 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1316 = stablehlo.dot_general %v1314, %v1315, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1317 = stablehlo.reshape %v1316 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1318 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1319 = stablehlo.multiply %v1317, %v1318 : tensor<256x38809xf32>
    %v1320 = stablehlo.reshape %v1319 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1321 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1322 = stablehlo.reduce(%v1320 init: %v1321) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1323 = stablehlo.broadcast_in_dim %v1322, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1324 = stablehlo.subtract %v1320, %v1323 : tensor<256x197x197xf32>
    %v1325 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1326 = stablehlo.exponential %v1324 : tensor<256x197x197xf32>
    %v1327 = stablehlo.reduce(%v1326 init: %v1325) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1328 = stablehlo.broadcast_in_dim %v1327, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1329 = stablehlo.divide %v1326, %v1328 : tensor<256x197x197xf32>
    %v1330 = stablehlo.reshape %v1329 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1331 = stablehlo.reshape %v1330 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1332 = stablehlo.reshape %v1310 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1333 = stablehlo.dot_general %v1331, %v1332, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1334 = stablehlo.reshape %v1333 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1335 = stablehlo.reshape %v1334 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1336 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1337 = stablehlo.pad %v1335, %v1336, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1338 = stablehlo.reshape %v1337 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1339 = stablehlo.reshape %v1291 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1340 = stablehlo.slice %v1339 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1341 = stablehlo.reshape %v1340 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1342 = stablehlo.reshape %v1296 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1343 = stablehlo.slice %v1342 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1344 = stablehlo.reshape %v1343 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1345 = stablehlo.reshape %v1301 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1346 = stablehlo.slice %v1345 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1347 = stablehlo.reshape %v1346 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1348 = stablehlo.reshape %v1344 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1349 = stablehlo.transpose %v1348, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1350 = stablehlo.reshape %v1349 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1351 = stablehlo.reshape %v1341 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1352 = stablehlo.reshape %v1350 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1353 = stablehlo.dot_general %v1351, %v1352, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1354 = stablehlo.reshape %v1353 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1355 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1356 = stablehlo.multiply %v1354, %v1355 : tensor<256x38809xf32>
    %v1357 = stablehlo.reshape %v1356 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1358 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1359 = stablehlo.reduce(%v1357 init: %v1358) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1360 = stablehlo.broadcast_in_dim %v1359, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1361 = stablehlo.subtract %v1357, %v1360 : tensor<256x197x197xf32>
    %v1362 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1363 = stablehlo.exponential %v1361 : tensor<256x197x197xf32>
    %v1364 = stablehlo.reduce(%v1363 init: %v1362) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1365 = stablehlo.broadcast_in_dim %v1364, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1366 = stablehlo.divide %v1363, %v1365 : tensor<256x197x197xf32>
    %v1367 = stablehlo.reshape %v1366 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1368 = stablehlo.reshape %v1367 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1369 = stablehlo.reshape %v1347 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1370 = stablehlo.dot_general %v1368, %v1369, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1371 = stablehlo.reshape %v1370 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1372 = stablehlo.reshape %v1371 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1373 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1374 = stablehlo.pad %v1372, %v1373, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1375 = stablehlo.reshape %v1374 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1376 = stablehlo.add %v1338, %v1375 : tensor<256x37824xf32>
    %v1377 = stablehlo.reshape %v1291 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1378 = stablehlo.slice %v1377 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1379 = stablehlo.reshape %v1378 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1380 = stablehlo.reshape %v1296 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1381 = stablehlo.slice %v1380 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1382 = stablehlo.reshape %v1381 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1383 = stablehlo.reshape %v1301 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1384 = stablehlo.slice %v1383 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1385 = stablehlo.reshape %v1384 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1386 = stablehlo.reshape %v1382 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1387 = stablehlo.transpose %v1386, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1388 = stablehlo.reshape %v1387 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1389 = stablehlo.reshape %v1379 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1390 = stablehlo.reshape %v1388 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1391 = stablehlo.dot_general %v1389, %v1390, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1392 = stablehlo.reshape %v1391 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1393 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1394 = stablehlo.multiply %v1392, %v1393 : tensor<256x38809xf32>
    %v1395 = stablehlo.reshape %v1394 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1396 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1397 = stablehlo.reduce(%v1395 init: %v1396) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1398 = stablehlo.broadcast_in_dim %v1397, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1399 = stablehlo.subtract %v1395, %v1398 : tensor<256x197x197xf32>
    %v1400 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1401 = stablehlo.exponential %v1399 : tensor<256x197x197xf32>
    %v1402 = stablehlo.reduce(%v1401 init: %v1400) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1403 = stablehlo.broadcast_in_dim %v1402, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1404 = stablehlo.divide %v1401, %v1403 : tensor<256x197x197xf32>
    %v1405 = stablehlo.reshape %v1404 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1406 = stablehlo.reshape %v1405 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1407 = stablehlo.reshape %v1385 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1408 = stablehlo.dot_general %v1406, %v1407, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1409 = stablehlo.reshape %v1408 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1410 = stablehlo.reshape %v1409 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1411 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1412 = stablehlo.pad %v1410, %v1411, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1413 = stablehlo.reshape %v1412 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1414 = stablehlo.add %v1376, %v1413 : tensor<256x37824xf32>
    %v1415 = stablehlo.reshape %v1414 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1416 = stablehlo.dot_general %v1415, %b6_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1417 = stablehlo.broadcast_in_dim %b6_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1418 = stablehlo.add %v1416, %v1417 : tensor<256x197x192xf32>
    %v1419 = stablehlo.reshape %v1418 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1420 = stablehlo.add %v1258, %v1419 : tensor<256x37824xf32>
    %v1421 = stablehlo.reshape %v1420 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1422 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1423 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1424 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1425 = stablehlo.reduce(%v1421 init: %v1422) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1426 = stablehlo.broadcast_in_dim %v1425, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1427 = stablehlo.divide %v1426, %v1423 : tensor<256x197x192xf32>
    %v1428 = stablehlo.subtract %v1421, %v1427 : tensor<256x197x192xf32>
    %v1429 = stablehlo.multiply %v1428, %v1428 : tensor<256x197x192xf32>
    %v1430 = stablehlo.reduce(%v1429 init: %v1422) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1431 = stablehlo.broadcast_in_dim %v1430, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1432 = stablehlo.divide %v1431, %v1423 : tensor<256x197x192xf32>
    %v1433 = stablehlo.add %v1432, %v1424 : tensor<256x197x192xf32>
    %v1434 = stablehlo.rsqrt %v1433 : tensor<256x197x192xf32>
    %v1435 = stablehlo.multiply %v1428, %v1434 : tensor<256x197x192xf32>
    %v1436 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1437 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1438 = stablehlo.multiply %v1435, %v1436 : tensor<256x197x192xf32>
    %v1439 = stablehlo.add %v1438, %v1437 : tensor<256x197x192xf32>
    %v1440 = stablehlo.reshape %v1439 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1441 = stablehlo.reshape %v1440 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1442 = stablehlo.broadcast_in_dim %b6_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1443 = stablehlo.multiply %v1441, %v1442 : tensor<256x197x192xf32>
    %v1444 = stablehlo.reshape %v1443 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1445 = stablehlo.reshape %v1444 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1446 = stablehlo.broadcast_in_dim %b6_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1447 = stablehlo.add %v1445, %v1446 : tensor<256x197x192xf32>
    %v1448 = stablehlo.reshape %v1447 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1449 = stablehlo.reshape %v1448 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1450 = stablehlo.dot_general %v1449, %b6_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v1451 = stablehlo.broadcast_in_dim %b6_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v1452 = stablehlo.add %v1450, %v1451 : tensor<256x197x768xf32>
    %v1453 = stablehlo.reshape %v1452 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v1454 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v1455 = stablehlo.multiply %v1454, %v1453 : tensor<256x151296xf32>
    %v1456 = stablehlo.negate %v1453 : tensor<256x151296xf32>
    %v1457 = stablehlo.constant dense<0.7071067811865476> : tensor<256x151296xf32>
    %v1458 = stablehlo.multiply %v1456, %v1457 : tensor<256x151296xf32>
    %v1459 = chlo.erfc %v1458 : tensor<256x151296xf32> -> tensor<256x151296xf32>
    %v1460 = stablehlo.multiply %v1455, %v1459 : tensor<256x151296xf32>
    %v1461 = stablehlo.reshape %v1460 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v1462 = stablehlo.dot_general %v1461, %b6_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v1463 = stablehlo.broadcast_in_dim %b6_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1464 = stablehlo.add %v1462, %v1463 : tensor<256x197x192xf32>
    %v1465 = stablehlo.reshape %v1464 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1466 = stablehlo.add %v1420, %v1465 : tensor<256x37824xf32>
    %v1467 = stablehlo.reshape %v1466 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1468 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1469 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1470 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1471 = stablehlo.reduce(%v1467 init: %v1468) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1472 = stablehlo.broadcast_in_dim %v1471, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1473 = stablehlo.divide %v1472, %v1469 : tensor<256x197x192xf32>
    %v1474 = stablehlo.subtract %v1467, %v1473 : tensor<256x197x192xf32>
    %v1475 = stablehlo.multiply %v1474, %v1474 : tensor<256x197x192xf32>
    %v1476 = stablehlo.reduce(%v1475 init: %v1468) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1477 = stablehlo.broadcast_in_dim %v1476, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1478 = stablehlo.divide %v1477, %v1469 : tensor<256x197x192xf32>
    %v1479 = stablehlo.add %v1478, %v1470 : tensor<256x197x192xf32>
    %v1480 = stablehlo.rsqrt %v1479 : tensor<256x197x192xf32>
    %v1481 = stablehlo.multiply %v1474, %v1480 : tensor<256x197x192xf32>
    %v1482 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1483 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1484 = stablehlo.multiply %v1481, %v1482 : tensor<256x197x192xf32>
    %v1485 = stablehlo.add %v1484, %v1483 : tensor<256x197x192xf32>
    %v1486 = stablehlo.reshape %v1485 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1487 = stablehlo.reshape %v1486 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1488 = stablehlo.broadcast_in_dim %b7_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1489 = stablehlo.multiply %v1487, %v1488 : tensor<256x197x192xf32>
    %v1490 = stablehlo.reshape %v1489 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1491 = stablehlo.reshape %v1490 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1492 = stablehlo.broadcast_in_dim %b7_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1493 = stablehlo.add %v1491, %v1492 : tensor<256x197x192xf32>
    %v1494 = stablehlo.reshape %v1493 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1495 = stablehlo.reshape %v1494 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1496 = stablehlo.dot_general %v1495, %b7_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1497 = stablehlo.broadcast_in_dim %b7_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1498 = stablehlo.add %v1496, %v1497 : tensor<256x197x192xf32>
    %v1499 = stablehlo.reshape %v1498 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1500 = stablehlo.reshape %v1494 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1501 = stablehlo.dot_general %v1500, %b7_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1502 = stablehlo.broadcast_in_dim %b7_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1503 = stablehlo.add %v1501, %v1502 : tensor<256x197x192xf32>
    %v1504 = stablehlo.reshape %v1503 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1505 = stablehlo.reshape %v1494 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1506 = stablehlo.dot_general %v1505, %b7_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1507 = stablehlo.broadcast_in_dim %b7_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1508 = stablehlo.add %v1506, %v1507 : tensor<256x197x192xf32>
    %v1509 = stablehlo.reshape %v1508 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1510 = stablehlo.reshape %v1499 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1511 = stablehlo.slice %v1510 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1512 = stablehlo.reshape %v1511 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1513 = stablehlo.reshape %v1504 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1514 = stablehlo.slice %v1513 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1515 = stablehlo.reshape %v1514 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1516 = stablehlo.reshape %v1509 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1517 = stablehlo.slice %v1516 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1518 = stablehlo.reshape %v1517 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1519 = stablehlo.reshape %v1515 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1520 = stablehlo.transpose %v1519, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1521 = stablehlo.reshape %v1520 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1522 = stablehlo.reshape %v1512 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1523 = stablehlo.reshape %v1521 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1524 = stablehlo.dot_general %v1522, %v1523, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1525 = stablehlo.reshape %v1524 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1526 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1527 = stablehlo.multiply %v1525, %v1526 : tensor<256x38809xf32>
    %v1528 = stablehlo.reshape %v1527 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1529 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1530 = stablehlo.reduce(%v1528 init: %v1529) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1531 = stablehlo.broadcast_in_dim %v1530, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1532 = stablehlo.subtract %v1528, %v1531 : tensor<256x197x197xf32>
    %v1533 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1534 = stablehlo.exponential %v1532 : tensor<256x197x197xf32>
    %v1535 = stablehlo.reduce(%v1534 init: %v1533) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1536 = stablehlo.broadcast_in_dim %v1535, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1537 = stablehlo.divide %v1534, %v1536 : tensor<256x197x197xf32>
    %v1538 = stablehlo.reshape %v1537 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1539 = stablehlo.reshape %v1538 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1540 = stablehlo.reshape %v1518 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1541 = stablehlo.dot_general %v1539, %v1540, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1542 = stablehlo.reshape %v1541 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1543 = stablehlo.reshape %v1542 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1544 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1545 = stablehlo.pad %v1543, %v1544, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1546 = stablehlo.reshape %v1545 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1547 = stablehlo.reshape %v1499 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1548 = stablehlo.slice %v1547 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1549 = stablehlo.reshape %v1548 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1550 = stablehlo.reshape %v1504 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1551 = stablehlo.slice %v1550 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1552 = stablehlo.reshape %v1551 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1553 = stablehlo.reshape %v1509 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1554 = stablehlo.slice %v1553 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1555 = stablehlo.reshape %v1554 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1556 = stablehlo.reshape %v1552 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1557 = stablehlo.transpose %v1556, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1558 = stablehlo.reshape %v1557 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1559 = stablehlo.reshape %v1549 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1560 = stablehlo.reshape %v1558 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1561 = stablehlo.dot_general %v1559, %v1560, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1562 = stablehlo.reshape %v1561 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1563 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1564 = stablehlo.multiply %v1562, %v1563 : tensor<256x38809xf32>
    %v1565 = stablehlo.reshape %v1564 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1566 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1567 = stablehlo.reduce(%v1565 init: %v1566) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1568 = stablehlo.broadcast_in_dim %v1567, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1569 = stablehlo.subtract %v1565, %v1568 : tensor<256x197x197xf32>
    %v1570 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1571 = stablehlo.exponential %v1569 : tensor<256x197x197xf32>
    %v1572 = stablehlo.reduce(%v1571 init: %v1570) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1573 = stablehlo.broadcast_in_dim %v1572, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1574 = stablehlo.divide %v1571, %v1573 : tensor<256x197x197xf32>
    %v1575 = stablehlo.reshape %v1574 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1576 = stablehlo.reshape %v1575 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1577 = stablehlo.reshape %v1555 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1578 = stablehlo.dot_general %v1576, %v1577, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1579 = stablehlo.reshape %v1578 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1580 = stablehlo.reshape %v1579 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1581 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1582 = stablehlo.pad %v1580, %v1581, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1583 = stablehlo.reshape %v1582 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1584 = stablehlo.add %v1546, %v1583 : tensor<256x37824xf32>
    %v1585 = stablehlo.reshape %v1499 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1586 = stablehlo.slice %v1585 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1587 = stablehlo.reshape %v1586 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1588 = stablehlo.reshape %v1504 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1589 = stablehlo.slice %v1588 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1590 = stablehlo.reshape %v1589 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1591 = stablehlo.reshape %v1509 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1592 = stablehlo.slice %v1591 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1593 = stablehlo.reshape %v1592 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1594 = stablehlo.reshape %v1590 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1595 = stablehlo.transpose %v1594, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1596 = stablehlo.reshape %v1595 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1597 = stablehlo.reshape %v1587 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1598 = stablehlo.reshape %v1596 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1599 = stablehlo.dot_general %v1597, %v1598, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1600 = stablehlo.reshape %v1599 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1601 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1602 = stablehlo.multiply %v1600, %v1601 : tensor<256x38809xf32>
    %v1603 = stablehlo.reshape %v1602 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1604 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1605 = stablehlo.reduce(%v1603 init: %v1604) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1606 = stablehlo.broadcast_in_dim %v1605, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1607 = stablehlo.subtract %v1603, %v1606 : tensor<256x197x197xf32>
    %v1608 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1609 = stablehlo.exponential %v1607 : tensor<256x197x197xf32>
    %v1610 = stablehlo.reduce(%v1609 init: %v1608) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1611 = stablehlo.broadcast_in_dim %v1610, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1612 = stablehlo.divide %v1609, %v1611 : tensor<256x197x197xf32>
    %v1613 = stablehlo.reshape %v1612 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1614 = stablehlo.reshape %v1613 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1615 = stablehlo.reshape %v1593 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1616 = stablehlo.dot_general %v1614, %v1615, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1617 = stablehlo.reshape %v1616 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1618 = stablehlo.reshape %v1617 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1619 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1620 = stablehlo.pad %v1618, %v1619, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1621 = stablehlo.reshape %v1620 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1622 = stablehlo.add %v1584, %v1621 : tensor<256x37824xf32>
    %v1623 = stablehlo.reshape %v1622 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1624 = stablehlo.dot_general %v1623, %b7_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1625 = stablehlo.broadcast_in_dim %b7_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1626 = stablehlo.add %v1624, %v1625 : tensor<256x197x192xf32>
    %v1627 = stablehlo.reshape %v1626 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1628 = stablehlo.add %v1466, %v1627 : tensor<256x37824xf32>
    %v1629 = stablehlo.reshape %v1628 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1630 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1631 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1632 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1633 = stablehlo.reduce(%v1629 init: %v1630) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1634 = stablehlo.broadcast_in_dim %v1633, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1635 = stablehlo.divide %v1634, %v1631 : tensor<256x197x192xf32>
    %v1636 = stablehlo.subtract %v1629, %v1635 : tensor<256x197x192xf32>
    %v1637 = stablehlo.multiply %v1636, %v1636 : tensor<256x197x192xf32>
    %v1638 = stablehlo.reduce(%v1637 init: %v1630) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1639 = stablehlo.broadcast_in_dim %v1638, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1640 = stablehlo.divide %v1639, %v1631 : tensor<256x197x192xf32>
    %v1641 = stablehlo.add %v1640, %v1632 : tensor<256x197x192xf32>
    %v1642 = stablehlo.rsqrt %v1641 : tensor<256x197x192xf32>
    %v1643 = stablehlo.multiply %v1636, %v1642 : tensor<256x197x192xf32>
    %v1644 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1645 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1646 = stablehlo.multiply %v1643, %v1644 : tensor<256x197x192xf32>
    %v1647 = stablehlo.add %v1646, %v1645 : tensor<256x197x192xf32>
    %v1648 = stablehlo.reshape %v1647 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1649 = stablehlo.reshape %v1648 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1650 = stablehlo.broadcast_in_dim %b7_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1651 = stablehlo.multiply %v1649, %v1650 : tensor<256x197x192xf32>
    %v1652 = stablehlo.reshape %v1651 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1653 = stablehlo.reshape %v1652 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1654 = stablehlo.broadcast_in_dim %b7_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1655 = stablehlo.add %v1653, %v1654 : tensor<256x197x192xf32>
    %v1656 = stablehlo.reshape %v1655 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1657 = stablehlo.reshape %v1656 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1658 = stablehlo.dot_general %v1657, %b7_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v1659 = stablehlo.broadcast_in_dim %b7_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v1660 = stablehlo.add %v1658, %v1659 : tensor<256x197x768xf32>
    %v1661 = stablehlo.reshape %v1660 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v1662 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v1663 = stablehlo.multiply %v1662, %v1661 : tensor<256x151296xf32>
    %v1664 = stablehlo.negate %v1661 : tensor<256x151296xf32>
    %v1665 = stablehlo.constant dense<0.7071067811865476> : tensor<256x151296xf32>
    %v1666 = stablehlo.multiply %v1664, %v1665 : tensor<256x151296xf32>
    %v1667 = chlo.erfc %v1666 : tensor<256x151296xf32> -> tensor<256x151296xf32>
    %v1668 = stablehlo.multiply %v1663, %v1667 : tensor<256x151296xf32>
    %v1669 = stablehlo.reshape %v1668 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v1670 = stablehlo.dot_general %v1669, %b7_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v1671 = stablehlo.broadcast_in_dim %b7_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1672 = stablehlo.add %v1670, %v1671 : tensor<256x197x192xf32>
    %v1673 = stablehlo.reshape %v1672 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1674 = stablehlo.add %v1628, %v1673 : tensor<256x37824xf32>
    %v1675 = stablehlo.reshape %v1674 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1676 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1677 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1678 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1679 = stablehlo.reduce(%v1675 init: %v1676) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1680 = stablehlo.broadcast_in_dim %v1679, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1681 = stablehlo.divide %v1680, %v1677 : tensor<256x197x192xf32>
    %v1682 = stablehlo.subtract %v1675, %v1681 : tensor<256x197x192xf32>
    %v1683 = stablehlo.multiply %v1682, %v1682 : tensor<256x197x192xf32>
    %v1684 = stablehlo.reduce(%v1683 init: %v1676) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1685 = stablehlo.broadcast_in_dim %v1684, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1686 = stablehlo.divide %v1685, %v1677 : tensor<256x197x192xf32>
    %v1687 = stablehlo.add %v1686, %v1678 : tensor<256x197x192xf32>
    %v1688 = stablehlo.rsqrt %v1687 : tensor<256x197x192xf32>
    %v1689 = stablehlo.multiply %v1682, %v1688 : tensor<256x197x192xf32>
    %v1690 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1691 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1692 = stablehlo.multiply %v1689, %v1690 : tensor<256x197x192xf32>
    %v1693 = stablehlo.add %v1692, %v1691 : tensor<256x197x192xf32>
    %v1694 = stablehlo.reshape %v1693 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1695 = stablehlo.reshape %v1694 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1696 = stablehlo.broadcast_in_dim %b8_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1697 = stablehlo.multiply %v1695, %v1696 : tensor<256x197x192xf32>
    %v1698 = stablehlo.reshape %v1697 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1699 = stablehlo.reshape %v1698 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1700 = stablehlo.broadcast_in_dim %b8_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1701 = stablehlo.add %v1699, %v1700 : tensor<256x197x192xf32>
    %v1702 = stablehlo.reshape %v1701 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1703 = stablehlo.reshape %v1702 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1704 = stablehlo.dot_general %v1703, %b8_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1705 = stablehlo.broadcast_in_dim %b8_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1706 = stablehlo.add %v1704, %v1705 : tensor<256x197x192xf32>
    %v1707 = stablehlo.reshape %v1706 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1708 = stablehlo.reshape %v1702 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1709 = stablehlo.dot_general %v1708, %b8_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1710 = stablehlo.broadcast_in_dim %b8_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1711 = stablehlo.add %v1709, %v1710 : tensor<256x197x192xf32>
    %v1712 = stablehlo.reshape %v1711 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1713 = stablehlo.reshape %v1702 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1714 = stablehlo.dot_general %v1713, %b8_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1715 = stablehlo.broadcast_in_dim %b8_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1716 = stablehlo.add %v1714, %v1715 : tensor<256x197x192xf32>
    %v1717 = stablehlo.reshape %v1716 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1718 = stablehlo.reshape %v1707 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1719 = stablehlo.slice %v1718 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1720 = stablehlo.reshape %v1719 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1721 = stablehlo.reshape %v1712 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1722 = stablehlo.slice %v1721 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1723 = stablehlo.reshape %v1722 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1724 = stablehlo.reshape %v1717 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1725 = stablehlo.slice %v1724 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1726 = stablehlo.reshape %v1725 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1727 = stablehlo.reshape %v1723 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1728 = stablehlo.transpose %v1727, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1729 = stablehlo.reshape %v1728 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1730 = stablehlo.reshape %v1720 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1731 = stablehlo.reshape %v1729 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1732 = stablehlo.dot_general %v1730, %v1731, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1733 = stablehlo.reshape %v1732 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1734 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1735 = stablehlo.multiply %v1733, %v1734 : tensor<256x38809xf32>
    %v1736 = stablehlo.reshape %v1735 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1737 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1738 = stablehlo.reduce(%v1736 init: %v1737) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1739 = stablehlo.broadcast_in_dim %v1738, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1740 = stablehlo.subtract %v1736, %v1739 : tensor<256x197x197xf32>
    %v1741 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1742 = stablehlo.exponential %v1740 : tensor<256x197x197xf32>
    %v1743 = stablehlo.reduce(%v1742 init: %v1741) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1744 = stablehlo.broadcast_in_dim %v1743, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1745 = stablehlo.divide %v1742, %v1744 : tensor<256x197x197xf32>
    %v1746 = stablehlo.reshape %v1745 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1747 = stablehlo.reshape %v1746 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1748 = stablehlo.reshape %v1726 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1749 = stablehlo.dot_general %v1747, %v1748, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1750 = stablehlo.reshape %v1749 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1751 = stablehlo.reshape %v1750 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1752 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1753 = stablehlo.pad %v1751, %v1752, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1754 = stablehlo.reshape %v1753 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1755 = stablehlo.reshape %v1707 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1756 = stablehlo.slice %v1755 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1757 = stablehlo.reshape %v1756 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1758 = stablehlo.reshape %v1712 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1759 = stablehlo.slice %v1758 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1760 = stablehlo.reshape %v1759 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1761 = stablehlo.reshape %v1717 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1762 = stablehlo.slice %v1761 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1763 = stablehlo.reshape %v1762 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1764 = stablehlo.reshape %v1760 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1765 = stablehlo.transpose %v1764, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1766 = stablehlo.reshape %v1765 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1767 = stablehlo.reshape %v1757 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1768 = stablehlo.reshape %v1766 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1769 = stablehlo.dot_general %v1767, %v1768, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1770 = stablehlo.reshape %v1769 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1771 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1772 = stablehlo.multiply %v1770, %v1771 : tensor<256x38809xf32>
    %v1773 = stablehlo.reshape %v1772 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1774 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1775 = stablehlo.reduce(%v1773 init: %v1774) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1776 = stablehlo.broadcast_in_dim %v1775, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1777 = stablehlo.subtract %v1773, %v1776 : tensor<256x197x197xf32>
    %v1778 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1779 = stablehlo.exponential %v1777 : tensor<256x197x197xf32>
    %v1780 = stablehlo.reduce(%v1779 init: %v1778) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1781 = stablehlo.broadcast_in_dim %v1780, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1782 = stablehlo.divide %v1779, %v1781 : tensor<256x197x197xf32>
    %v1783 = stablehlo.reshape %v1782 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1784 = stablehlo.reshape %v1783 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1785 = stablehlo.reshape %v1763 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1786 = stablehlo.dot_general %v1784, %v1785, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1787 = stablehlo.reshape %v1786 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1788 = stablehlo.reshape %v1787 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1789 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1790 = stablehlo.pad %v1788, %v1789, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1791 = stablehlo.reshape %v1790 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1792 = stablehlo.add %v1754, %v1791 : tensor<256x37824xf32>
    %v1793 = stablehlo.reshape %v1707 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1794 = stablehlo.slice %v1793 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1795 = stablehlo.reshape %v1794 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1796 = stablehlo.reshape %v1712 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1797 = stablehlo.slice %v1796 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1798 = stablehlo.reshape %v1797 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1799 = stablehlo.reshape %v1717 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1800 = stablehlo.slice %v1799 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1801 = stablehlo.reshape %v1800 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1802 = stablehlo.reshape %v1798 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1803 = stablehlo.transpose %v1802, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1804 = stablehlo.reshape %v1803 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1805 = stablehlo.reshape %v1795 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1806 = stablehlo.reshape %v1804 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1807 = stablehlo.dot_general %v1805, %v1806, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1808 = stablehlo.reshape %v1807 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1809 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1810 = stablehlo.multiply %v1808, %v1809 : tensor<256x38809xf32>
    %v1811 = stablehlo.reshape %v1810 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1812 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1813 = stablehlo.reduce(%v1811 init: %v1812) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1814 = stablehlo.broadcast_in_dim %v1813, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1815 = stablehlo.subtract %v1811, %v1814 : tensor<256x197x197xf32>
    %v1816 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1817 = stablehlo.exponential %v1815 : tensor<256x197x197xf32>
    %v1818 = stablehlo.reduce(%v1817 init: %v1816) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1819 = stablehlo.broadcast_in_dim %v1818, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1820 = stablehlo.divide %v1817, %v1819 : tensor<256x197x197xf32>
    %v1821 = stablehlo.reshape %v1820 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1822 = stablehlo.reshape %v1821 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1823 = stablehlo.reshape %v1801 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1824 = stablehlo.dot_general %v1822, %v1823, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1825 = stablehlo.reshape %v1824 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1826 = stablehlo.reshape %v1825 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1827 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1828 = stablehlo.pad %v1826, %v1827, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1829 = stablehlo.reshape %v1828 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1830 = stablehlo.add %v1792, %v1829 : tensor<256x37824xf32>
    %v1831 = stablehlo.reshape %v1830 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1832 = stablehlo.dot_general %v1831, %b8_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1833 = stablehlo.broadcast_in_dim %b8_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1834 = stablehlo.add %v1832, %v1833 : tensor<256x197x192xf32>
    %v1835 = stablehlo.reshape %v1834 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1836 = stablehlo.add %v1674, %v1835 : tensor<256x37824xf32>
    %v1837 = stablehlo.reshape %v1836 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1838 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1839 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1840 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1841 = stablehlo.reduce(%v1837 init: %v1838) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1842 = stablehlo.broadcast_in_dim %v1841, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1843 = stablehlo.divide %v1842, %v1839 : tensor<256x197x192xf32>
    %v1844 = stablehlo.subtract %v1837, %v1843 : tensor<256x197x192xf32>
    %v1845 = stablehlo.multiply %v1844, %v1844 : tensor<256x197x192xf32>
    %v1846 = stablehlo.reduce(%v1845 init: %v1838) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1847 = stablehlo.broadcast_in_dim %v1846, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1848 = stablehlo.divide %v1847, %v1839 : tensor<256x197x192xf32>
    %v1849 = stablehlo.add %v1848, %v1840 : tensor<256x197x192xf32>
    %v1850 = stablehlo.rsqrt %v1849 : tensor<256x197x192xf32>
    %v1851 = stablehlo.multiply %v1844, %v1850 : tensor<256x197x192xf32>
    %v1852 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1853 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1854 = stablehlo.multiply %v1851, %v1852 : tensor<256x197x192xf32>
    %v1855 = stablehlo.add %v1854, %v1853 : tensor<256x197x192xf32>
    %v1856 = stablehlo.reshape %v1855 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1857 = stablehlo.reshape %v1856 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1858 = stablehlo.broadcast_in_dim %b8_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1859 = stablehlo.multiply %v1857, %v1858 : tensor<256x197x192xf32>
    %v1860 = stablehlo.reshape %v1859 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1861 = stablehlo.reshape %v1860 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1862 = stablehlo.broadcast_in_dim %b8_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1863 = stablehlo.add %v1861, %v1862 : tensor<256x197x192xf32>
    %v1864 = stablehlo.reshape %v1863 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1865 = stablehlo.reshape %v1864 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1866 = stablehlo.dot_general %v1865, %b8_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v1867 = stablehlo.broadcast_in_dim %b8_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v1868 = stablehlo.add %v1866, %v1867 : tensor<256x197x768xf32>
    %v1869 = stablehlo.reshape %v1868 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v1870 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v1871 = stablehlo.multiply %v1870, %v1869 : tensor<256x151296xf32>
    %v1872 = stablehlo.negate %v1869 : tensor<256x151296xf32>
    %v1873 = stablehlo.constant dense<0.7071067811865476> : tensor<256x151296xf32>
    %v1874 = stablehlo.multiply %v1872, %v1873 : tensor<256x151296xf32>
    %v1875 = chlo.erfc %v1874 : tensor<256x151296xf32> -> tensor<256x151296xf32>
    %v1876 = stablehlo.multiply %v1871, %v1875 : tensor<256x151296xf32>
    %v1877 = stablehlo.reshape %v1876 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v1878 = stablehlo.dot_general %v1877, %b8_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v1879 = stablehlo.broadcast_in_dim %b8_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1880 = stablehlo.add %v1878, %v1879 : tensor<256x197x192xf32>
    %v1881 = stablehlo.reshape %v1880 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1882 = stablehlo.add %v1836, %v1881 : tensor<256x37824xf32>
    %v1883 = stablehlo.reshape %v1882 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1884 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1885 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v1886 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v1887 = stablehlo.reduce(%v1883 init: %v1884) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1888 = stablehlo.broadcast_in_dim %v1887, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1889 = stablehlo.divide %v1888, %v1885 : tensor<256x197x192xf32>
    %v1890 = stablehlo.subtract %v1883, %v1889 : tensor<256x197x192xf32>
    %v1891 = stablehlo.multiply %v1890, %v1890 : tensor<256x197x192xf32>
    %v1892 = stablehlo.reduce(%v1891 init: %v1884) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1893 = stablehlo.broadcast_in_dim %v1892, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v1894 = stablehlo.divide %v1893, %v1885 : tensor<256x197x192xf32>
    %v1895 = stablehlo.add %v1894, %v1886 : tensor<256x197x192xf32>
    %v1896 = stablehlo.rsqrt %v1895 : tensor<256x197x192xf32>
    %v1897 = stablehlo.multiply %v1890, %v1896 : tensor<256x197x192xf32>
    %v1898 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1899 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v1900 = stablehlo.multiply %v1897, %v1898 : tensor<256x197x192xf32>
    %v1901 = stablehlo.add %v1900, %v1899 : tensor<256x197x192xf32>
    %v1902 = stablehlo.reshape %v1901 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1903 = stablehlo.reshape %v1902 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1904 = stablehlo.broadcast_in_dim %b9_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1905 = stablehlo.multiply %v1903, %v1904 : tensor<256x197x192xf32>
    %v1906 = stablehlo.reshape %v1905 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1907 = stablehlo.reshape %v1906 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1908 = stablehlo.broadcast_in_dim %b9_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1909 = stablehlo.add %v1907, %v1908 : tensor<256x197x192xf32>
    %v1910 = stablehlo.reshape %v1909 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1911 = stablehlo.reshape %v1910 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1912 = stablehlo.dot_general %v1911, %b9_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1913 = stablehlo.broadcast_in_dim %b9_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1914 = stablehlo.add %v1912, %v1913 : tensor<256x197x192xf32>
    %v1915 = stablehlo.reshape %v1914 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1916 = stablehlo.reshape %v1910 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1917 = stablehlo.dot_general %v1916, %b9_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1918 = stablehlo.broadcast_in_dim %b9_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1919 = stablehlo.add %v1917, %v1918 : tensor<256x197x192xf32>
    %v1920 = stablehlo.reshape %v1919 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1921 = stablehlo.reshape %v1910 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1922 = stablehlo.dot_general %v1921, %b9_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v1923 = stablehlo.broadcast_in_dim %b9_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v1924 = stablehlo.add %v1922, %v1923 : tensor<256x197x192xf32>
    %v1925 = stablehlo.reshape %v1924 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1926 = stablehlo.reshape %v1915 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1927 = stablehlo.slice %v1926 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1928 = stablehlo.reshape %v1927 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1929 = stablehlo.reshape %v1920 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1930 = stablehlo.slice %v1929 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1931 = stablehlo.reshape %v1930 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1932 = stablehlo.reshape %v1925 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1933 = stablehlo.slice %v1932 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1934 = stablehlo.reshape %v1933 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1935 = stablehlo.reshape %v1931 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1936 = stablehlo.transpose %v1935, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1937 = stablehlo.reshape %v1936 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1938 = stablehlo.reshape %v1928 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1939 = stablehlo.reshape %v1937 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1940 = stablehlo.dot_general %v1938, %v1939, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1941 = stablehlo.reshape %v1940 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1942 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1943 = stablehlo.multiply %v1941, %v1942 : tensor<256x38809xf32>
    %v1944 = stablehlo.reshape %v1943 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1945 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1946 = stablehlo.reduce(%v1944 init: %v1945) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1947 = stablehlo.broadcast_in_dim %v1946, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1948 = stablehlo.subtract %v1944, %v1947 : tensor<256x197x197xf32>
    %v1949 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1950 = stablehlo.exponential %v1948 : tensor<256x197x197xf32>
    %v1951 = stablehlo.reduce(%v1950 init: %v1949) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1952 = stablehlo.broadcast_in_dim %v1951, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1953 = stablehlo.divide %v1950, %v1952 : tensor<256x197x197xf32>
    %v1954 = stablehlo.reshape %v1953 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1955 = stablehlo.reshape %v1954 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1956 = stablehlo.reshape %v1934 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1957 = stablehlo.dot_general %v1955, %v1956, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1958 = stablehlo.reshape %v1957 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1959 = stablehlo.reshape %v1958 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1960 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1961 = stablehlo.pad %v1959, %v1960, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1962 = stablehlo.reshape %v1961 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v1963 = stablehlo.reshape %v1915 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1964 = stablehlo.slice %v1963 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1965 = stablehlo.reshape %v1964 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1966 = stablehlo.reshape %v1920 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1967 = stablehlo.slice %v1966 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1968 = stablehlo.reshape %v1967 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1969 = stablehlo.reshape %v1925 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v1970 = stablehlo.slice %v1969 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v1971 = stablehlo.reshape %v1970 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1972 = stablehlo.reshape %v1968 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1973 = stablehlo.transpose %v1972, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v1974 = stablehlo.reshape %v1973 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v1975 = stablehlo.reshape %v1965 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1976 = stablehlo.reshape %v1974 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v1977 = stablehlo.dot_general %v1975, %v1976, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v1978 = stablehlo.reshape %v1977 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1979 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v1980 = stablehlo.multiply %v1978, %v1979 : tensor<256x38809xf32>
    %v1981 = stablehlo.reshape %v1980 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1982 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v1983 = stablehlo.reduce(%v1981 init: %v1982) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1984 = stablehlo.broadcast_in_dim %v1983, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1985 = stablehlo.subtract %v1981, %v1984 : tensor<256x197x197xf32>
    %v1986 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1987 = stablehlo.exponential %v1985 : tensor<256x197x197xf32>
    %v1988 = stablehlo.reduce(%v1987 init: %v1986) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v1989 = stablehlo.broadcast_in_dim %v1988, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v1990 = stablehlo.divide %v1987, %v1989 : tensor<256x197x197xf32>
    %v1991 = stablehlo.reshape %v1990 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v1992 = stablehlo.reshape %v1991 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v1993 = stablehlo.reshape %v1971 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1994 = stablehlo.dot_general %v1992, %v1993, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v1995 = stablehlo.reshape %v1994 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v1996 = stablehlo.reshape %v1995 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v1997 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1998 = stablehlo.pad %v1996, %v1997, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v1999 = stablehlo.reshape %v1998 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2000 = stablehlo.add %v1962, %v1999 : tensor<256x37824xf32>
    %v2001 = stablehlo.reshape %v1915 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2002 = stablehlo.slice %v2001 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2003 = stablehlo.reshape %v2002 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2004 = stablehlo.reshape %v1920 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2005 = stablehlo.slice %v2004 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2006 = stablehlo.reshape %v2005 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2007 = stablehlo.reshape %v1925 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2008 = stablehlo.slice %v2007 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2009 = stablehlo.reshape %v2008 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2010 = stablehlo.reshape %v2006 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2011 = stablehlo.transpose %v2010, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2012 = stablehlo.reshape %v2011 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2013 = stablehlo.reshape %v2003 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2014 = stablehlo.reshape %v2012 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2015 = stablehlo.dot_general %v2013, %v2014, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2016 = stablehlo.reshape %v2015 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2017 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2018 = stablehlo.multiply %v2016, %v2017 : tensor<256x38809xf32>
    %v2019 = stablehlo.reshape %v2018 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2020 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2021 = stablehlo.reduce(%v2019 init: %v2020) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2022 = stablehlo.broadcast_in_dim %v2021, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2023 = stablehlo.subtract %v2019, %v2022 : tensor<256x197x197xf32>
    %v2024 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2025 = stablehlo.exponential %v2023 : tensor<256x197x197xf32>
    %v2026 = stablehlo.reduce(%v2025 init: %v2024) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2027 = stablehlo.broadcast_in_dim %v2026, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2028 = stablehlo.divide %v2025, %v2027 : tensor<256x197x197xf32>
    %v2029 = stablehlo.reshape %v2028 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2030 = stablehlo.reshape %v2029 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2031 = stablehlo.reshape %v2009 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2032 = stablehlo.dot_general %v2030, %v2031, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2033 = stablehlo.reshape %v2032 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2034 = stablehlo.reshape %v2033 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2035 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2036 = stablehlo.pad %v2034, %v2035, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2037 = stablehlo.reshape %v2036 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2038 = stablehlo.add %v2000, %v2037 : tensor<256x37824xf32>
    %v2039 = stablehlo.reshape %v2038 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2040 = stablehlo.dot_general %v2039, %b9_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2041 = stablehlo.broadcast_in_dim %b9_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2042 = stablehlo.add %v2040, %v2041 : tensor<256x197x192xf32>
    %v2043 = stablehlo.reshape %v2042 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2044 = stablehlo.add %v1882, %v2043 : tensor<256x37824xf32>
    %v2045 = stablehlo.reshape %v2044 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2046 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2047 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v2048 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v2049 = stablehlo.reduce(%v2045 init: %v2046) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2050 = stablehlo.broadcast_in_dim %v2049, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2051 = stablehlo.divide %v2050, %v2047 : tensor<256x197x192xf32>
    %v2052 = stablehlo.subtract %v2045, %v2051 : tensor<256x197x192xf32>
    %v2053 = stablehlo.multiply %v2052, %v2052 : tensor<256x197x192xf32>
    %v2054 = stablehlo.reduce(%v2053 init: %v2046) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2055 = stablehlo.broadcast_in_dim %v2054, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2056 = stablehlo.divide %v2055, %v2047 : tensor<256x197x192xf32>
    %v2057 = stablehlo.add %v2056, %v2048 : tensor<256x197x192xf32>
    %v2058 = stablehlo.rsqrt %v2057 : tensor<256x197x192xf32>
    %v2059 = stablehlo.multiply %v2052, %v2058 : tensor<256x197x192xf32>
    %v2060 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2061 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2062 = stablehlo.multiply %v2059, %v2060 : tensor<256x197x192xf32>
    %v2063 = stablehlo.add %v2062, %v2061 : tensor<256x197x192xf32>
    %v2064 = stablehlo.reshape %v2063 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2065 = stablehlo.reshape %v2064 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2066 = stablehlo.broadcast_in_dim %b9_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2067 = stablehlo.multiply %v2065, %v2066 : tensor<256x197x192xf32>
    %v2068 = stablehlo.reshape %v2067 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2069 = stablehlo.reshape %v2068 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2070 = stablehlo.broadcast_in_dim %b9_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2071 = stablehlo.add %v2069, %v2070 : tensor<256x197x192xf32>
    %v2072 = stablehlo.reshape %v2071 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2073 = stablehlo.reshape %v2072 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2074 = stablehlo.dot_general %v2073, %b9_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v2075 = stablehlo.broadcast_in_dim %b9_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v2076 = stablehlo.add %v2074, %v2075 : tensor<256x197x768xf32>
    %v2077 = stablehlo.reshape %v2076 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v2078 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v2079 = stablehlo.multiply %v2078, %v2077 : tensor<256x151296xf32>
    %v2080 = stablehlo.negate %v2077 : tensor<256x151296xf32>
    %v2081 = stablehlo.constant dense<0.7071067811865476> : tensor<256x151296xf32>
    %v2082 = stablehlo.multiply %v2080, %v2081 : tensor<256x151296xf32>
    %v2083 = chlo.erfc %v2082 : tensor<256x151296xf32> -> tensor<256x151296xf32>
    %v2084 = stablehlo.multiply %v2079, %v2083 : tensor<256x151296xf32>
    %v2085 = stablehlo.reshape %v2084 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v2086 = stablehlo.dot_general %v2085, %b9_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v2087 = stablehlo.broadcast_in_dim %b9_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2088 = stablehlo.add %v2086, %v2087 : tensor<256x197x192xf32>
    %v2089 = stablehlo.reshape %v2088 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2090 = stablehlo.add %v2044, %v2089 : tensor<256x37824xf32>
    %v2091 = stablehlo.reshape %v2090 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2092 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2093 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v2094 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v2095 = stablehlo.reduce(%v2091 init: %v2092) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2096 = stablehlo.broadcast_in_dim %v2095, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2097 = stablehlo.divide %v2096, %v2093 : tensor<256x197x192xf32>
    %v2098 = stablehlo.subtract %v2091, %v2097 : tensor<256x197x192xf32>
    %v2099 = stablehlo.multiply %v2098, %v2098 : tensor<256x197x192xf32>
    %v2100 = stablehlo.reduce(%v2099 init: %v2092) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2101 = stablehlo.broadcast_in_dim %v2100, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2102 = stablehlo.divide %v2101, %v2093 : tensor<256x197x192xf32>
    %v2103 = stablehlo.add %v2102, %v2094 : tensor<256x197x192xf32>
    %v2104 = stablehlo.rsqrt %v2103 : tensor<256x197x192xf32>
    %v2105 = stablehlo.multiply %v2098, %v2104 : tensor<256x197x192xf32>
    %v2106 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2107 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2108 = stablehlo.multiply %v2105, %v2106 : tensor<256x197x192xf32>
    %v2109 = stablehlo.add %v2108, %v2107 : tensor<256x197x192xf32>
    %v2110 = stablehlo.reshape %v2109 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2111 = stablehlo.reshape %v2110 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2112 = stablehlo.broadcast_in_dim %b10_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2113 = stablehlo.multiply %v2111, %v2112 : tensor<256x197x192xf32>
    %v2114 = stablehlo.reshape %v2113 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2115 = stablehlo.reshape %v2114 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2116 = stablehlo.broadcast_in_dim %b10_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2117 = stablehlo.add %v2115, %v2116 : tensor<256x197x192xf32>
    %v2118 = stablehlo.reshape %v2117 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2119 = stablehlo.reshape %v2118 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2120 = stablehlo.dot_general %v2119, %b10_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2121 = stablehlo.broadcast_in_dim %b10_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2122 = stablehlo.add %v2120, %v2121 : tensor<256x197x192xf32>
    %v2123 = stablehlo.reshape %v2122 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2124 = stablehlo.reshape %v2118 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2125 = stablehlo.dot_general %v2124, %b10_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2126 = stablehlo.broadcast_in_dim %b10_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2127 = stablehlo.add %v2125, %v2126 : tensor<256x197x192xf32>
    %v2128 = stablehlo.reshape %v2127 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2129 = stablehlo.reshape %v2118 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2130 = stablehlo.dot_general %v2129, %b10_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2131 = stablehlo.broadcast_in_dim %b10_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2132 = stablehlo.add %v2130, %v2131 : tensor<256x197x192xf32>
    %v2133 = stablehlo.reshape %v2132 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2134 = stablehlo.reshape %v2123 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2135 = stablehlo.slice %v2134 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2136 = stablehlo.reshape %v2135 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2137 = stablehlo.reshape %v2128 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2138 = stablehlo.slice %v2137 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2139 = stablehlo.reshape %v2138 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2140 = stablehlo.reshape %v2133 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2141 = stablehlo.slice %v2140 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2142 = stablehlo.reshape %v2141 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2143 = stablehlo.reshape %v2139 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2144 = stablehlo.transpose %v2143, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2145 = stablehlo.reshape %v2144 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2146 = stablehlo.reshape %v2136 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2147 = stablehlo.reshape %v2145 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2148 = stablehlo.dot_general %v2146, %v2147, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2149 = stablehlo.reshape %v2148 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2150 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2151 = stablehlo.multiply %v2149, %v2150 : tensor<256x38809xf32>
    %v2152 = stablehlo.reshape %v2151 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2153 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2154 = stablehlo.reduce(%v2152 init: %v2153) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2155 = stablehlo.broadcast_in_dim %v2154, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2156 = stablehlo.subtract %v2152, %v2155 : tensor<256x197x197xf32>
    %v2157 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2158 = stablehlo.exponential %v2156 : tensor<256x197x197xf32>
    %v2159 = stablehlo.reduce(%v2158 init: %v2157) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2160 = stablehlo.broadcast_in_dim %v2159, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2161 = stablehlo.divide %v2158, %v2160 : tensor<256x197x197xf32>
    %v2162 = stablehlo.reshape %v2161 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2163 = stablehlo.reshape %v2162 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2164 = stablehlo.reshape %v2142 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2165 = stablehlo.dot_general %v2163, %v2164, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2166 = stablehlo.reshape %v2165 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2167 = stablehlo.reshape %v2166 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2168 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2169 = stablehlo.pad %v2167, %v2168, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2170 = stablehlo.reshape %v2169 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2171 = stablehlo.reshape %v2123 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2172 = stablehlo.slice %v2171 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2173 = stablehlo.reshape %v2172 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2174 = stablehlo.reshape %v2128 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2175 = stablehlo.slice %v2174 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2176 = stablehlo.reshape %v2175 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2177 = stablehlo.reshape %v2133 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2178 = stablehlo.slice %v2177 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2179 = stablehlo.reshape %v2178 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2180 = stablehlo.reshape %v2176 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2181 = stablehlo.transpose %v2180, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2182 = stablehlo.reshape %v2181 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2183 = stablehlo.reshape %v2173 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2184 = stablehlo.reshape %v2182 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2185 = stablehlo.dot_general %v2183, %v2184, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2186 = stablehlo.reshape %v2185 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2187 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2188 = stablehlo.multiply %v2186, %v2187 : tensor<256x38809xf32>
    %v2189 = stablehlo.reshape %v2188 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2190 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2191 = stablehlo.reduce(%v2189 init: %v2190) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2192 = stablehlo.broadcast_in_dim %v2191, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2193 = stablehlo.subtract %v2189, %v2192 : tensor<256x197x197xf32>
    %v2194 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2195 = stablehlo.exponential %v2193 : tensor<256x197x197xf32>
    %v2196 = stablehlo.reduce(%v2195 init: %v2194) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2197 = stablehlo.broadcast_in_dim %v2196, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2198 = stablehlo.divide %v2195, %v2197 : tensor<256x197x197xf32>
    %v2199 = stablehlo.reshape %v2198 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2200 = stablehlo.reshape %v2199 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2201 = stablehlo.reshape %v2179 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2202 = stablehlo.dot_general %v2200, %v2201, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2203 = stablehlo.reshape %v2202 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2204 = stablehlo.reshape %v2203 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2205 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2206 = stablehlo.pad %v2204, %v2205, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2207 = stablehlo.reshape %v2206 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2208 = stablehlo.add %v2170, %v2207 : tensor<256x37824xf32>
    %v2209 = stablehlo.reshape %v2123 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2210 = stablehlo.slice %v2209 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2211 = stablehlo.reshape %v2210 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2212 = stablehlo.reshape %v2128 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2213 = stablehlo.slice %v2212 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2214 = stablehlo.reshape %v2213 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2215 = stablehlo.reshape %v2133 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2216 = stablehlo.slice %v2215 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2217 = stablehlo.reshape %v2216 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2218 = stablehlo.reshape %v2214 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2219 = stablehlo.transpose %v2218, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2220 = stablehlo.reshape %v2219 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2221 = stablehlo.reshape %v2211 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2222 = stablehlo.reshape %v2220 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2223 = stablehlo.dot_general %v2221, %v2222, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2224 = stablehlo.reshape %v2223 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2225 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2226 = stablehlo.multiply %v2224, %v2225 : tensor<256x38809xf32>
    %v2227 = stablehlo.reshape %v2226 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2228 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2229 = stablehlo.reduce(%v2227 init: %v2228) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2230 = stablehlo.broadcast_in_dim %v2229, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2231 = stablehlo.subtract %v2227, %v2230 : tensor<256x197x197xf32>
    %v2232 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2233 = stablehlo.exponential %v2231 : tensor<256x197x197xf32>
    %v2234 = stablehlo.reduce(%v2233 init: %v2232) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2235 = stablehlo.broadcast_in_dim %v2234, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2236 = stablehlo.divide %v2233, %v2235 : tensor<256x197x197xf32>
    %v2237 = stablehlo.reshape %v2236 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2238 = stablehlo.reshape %v2237 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2239 = stablehlo.reshape %v2217 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2240 = stablehlo.dot_general %v2238, %v2239, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2241 = stablehlo.reshape %v2240 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2242 = stablehlo.reshape %v2241 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2243 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2244 = stablehlo.pad %v2242, %v2243, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2245 = stablehlo.reshape %v2244 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2246 = stablehlo.add %v2208, %v2245 : tensor<256x37824xf32>
    %v2247 = stablehlo.reshape %v2246 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2248 = stablehlo.dot_general %v2247, %b10_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2249 = stablehlo.broadcast_in_dim %b10_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2250 = stablehlo.add %v2248, %v2249 : tensor<256x197x192xf32>
    %v2251 = stablehlo.reshape %v2250 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2252 = stablehlo.add %v2090, %v2251 : tensor<256x37824xf32>
    %v2253 = stablehlo.reshape %v2252 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2254 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2255 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v2256 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v2257 = stablehlo.reduce(%v2253 init: %v2254) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2258 = stablehlo.broadcast_in_dim %v2257, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2259 = stablehlo.divide %v2258, %v2255 : tensor<256x197x192xf32>
    %v2260 = stablehlo.subtract %v2253, %v2259 : tensor<256x197x192xf32>
    %v2261 = stablehlo.multiply %v2260, %v2260 : tensor<256x197x192xf32>
    %v2262 = stablehlo.reduce(%v2261 init: %v2254) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2263 = stablehlo.broadcast_in_dim %v2262, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2264 = stablehlo.divide %v2263, %v2255 : tensor<256x197x192xf32>
    %v2265 = stablehlo.add %v2264, %v2256 : tensor<256x197x192xf32>
    %v2266 = stablehlo.rsqrt %v2265 : tensor<256x197x192xf32>
    %v2267 = stablehlo.multiply %v2260, %v2266 : tensor<256x197x192xf32>
    %v2268 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2269 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2270 = stablehlo.multiply %v2267, %v2268 : tensor<256x197x192xf32>
    %v2271 = stablehlo.add %v2270, %v2269 : tensor<256x197x192xf32>
    %v2272 = stablehlo.reshape %v2271 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2273 = stablehlo.reshape %v2272 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2274 = stablehlo.broadcast_in_dim %b10_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2275 = stablehlo.multiply %v2273, %v2274 : tensor<256x197x192xf32>
    %v2276 = stablehlo.reshape %v2275 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2277 = stablehlo.reshape %v2276 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2278 = stablehlo.broadcast_in_dim %b10_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2279 = stablehlo.add %v2277, %v2278 : tensor<256x197x192xf32>
    %v2280 = stablehlo.reshape %v2279 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2281 = stablehlo.reshape %v2280 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2282 = stablehlo.dot_general %v2281, %b10_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v2283 = stablehlo.broadcast_in_dim %b10_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v2284 = stablehlo.add %v2282, %v2283 : tensor<256x197x768xf32>
    %v2285 = stablehlo.reshape %v2284 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v2286 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v2287 = stablehlo.multiply %v2286, %v2285 : tensor<256x151296xf32>
    %v2288 = stablehlo.negate %v2285 : tensor<256x151296xf32>
    %v2289 = stablehlo.constant dense<0.7071067811865476> : tensor<256x151296xf32>
    %v2290 = stablehlo.multiply %v2288, %v2289 : tensor<256x151296xf32>
    %v2291 = chlo.erfc %v2290 : tensor<256x151296xf32> -> tensor<256x151296xf32>
    %v2292 = stablehlo.multiply %v2287, %v2291 : tensor<256x151296xf32>
    %v2293 = stablehlo.reshape %v2292 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v2294 = stablehlo.dot_general %v2293, %b10_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v2295 = stablehlo.broadcast_in_dim %b10_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2296 = stablehlo.add %v2294, %v2295 : tensor<256x197x192xf32>
    %v2297 = stablehlo.reshape %v2296 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2298 = stablehlo.add %v2252, %v2297 : tensor<256x37824xf32>
    %v2299 = stablehlo.reshape %v2298 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2300 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2301 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v2302 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v2303 = stablehlo.reduce(%v2299 init: %v2300) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2304 = stablehlo.broadcast_in_dim %v2303, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2305 = stablehlo.divide %v2304, %v2301 : tensor<256x197x192xf32>
    %v2306 = stablehlo.subtract %v2299, %v2305 : tensor<256x197x192xf32>
    %v2307 = stablehlo.multiply %v2306, %v2306 : tensor<256x197x192xf32>
    %v2308 = stablehlo.reduce(%v2307 init: %v2300) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2309 = stablehlo.broadcast_in_dim %v2308, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2310 = stablehlo.divide %v2309, %v2301 : tensor<256x197x192xf32>
    %v2311 = stablehlo.add %v2310, %v2302 : tensor<256x197x192xf32>
    %v2312 = stablehlo.rsqrt %v2311 : tensor<256x197x192xf32>
    %v2313 = stablehlo.multiply %v2306, %v2312 : tensor<256x197x192xf32>
    %v2314 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2315 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2316 = stablehlo.multiply %v2313, %v2314 : tensor<256x197x192xf32>
    %v2317 = stablehlo.add %v2316, %v2315 : tensor<256x197x192xf32>
    %v2318 = stablehlo.reshape %v2317 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2319 = stablehlo.reshape %v2318 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2320 = stablehlo.broadcast_in_dim %b11_g1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2321 = stablehlo.multiply %v2319, %v2320 : tensor<256x197x192xf32>
    %v2322 = stablehlo.reshape %v2321 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2323 = stablehlo.reshape %v2322 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2324 = stablehlo.broadcast_in_dim %b11_bt1, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2325 = stablehlo.add %v2323, %v2324 : tensor<256x197x192xf32>
    %v2326 = stablehlo.reshape %v2325 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2327 = stablehlo.reshape %v2326 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2328 = stablehlo.dot_general %v2327, %b11_Wq, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2329 = stablehlo.broadcast_in_dim %b11_bq, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2330 = stablehlo.add %v2328, %v2329 : tensor<256x197x192xf32>
    %v2331 = stablehlo.reshape %v2330 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2332 = stablehlo.reshape %v2326 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2333 = stablehlo.dot_general %v2332, %b11_Wk, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2334 = stablehlo.broadcast_in_dim %b11_bk, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2335 = stablehlo.add %v2333, %v2334 : tensor<256x197x192xf32>
    %v2336 = stablehlo.reshape %v2335 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2337 = stablehlo.reshape %v2326 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2338 = stablehlo.dot_general %v2337, %b11_Wv, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2339 = stablehlo.broadcast_in_dim %b11_bv, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2340 = stablehlo.add %v2338, %v2339 : tensor<256x197x192xf32>
    %v2341 = stablehlo.reshape %v2340 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2342 = stablehlo.reshape %v2331 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2343 = stablehlo.slice %v2342 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2344 = stablehlo.reshape %v2343 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2345 = stablehlo.reshape %v2336 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2346 = stablehlo.slice %v2345 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2347 = stablehlo.reshape %v2346 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2348 = stablehlo.reshape %v2341 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2349 = stablehlo.slice %v2348 [0:256, 0:197, 0:64] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2350 = stablehlo.reshape %v2349 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2351 = stablehlo.reshape %v2347 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2352 = stablehlo.transpose %v2351, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2353 = stablehlo.reshape %v2352 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2354 = stablehlo.reshape %v2344 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2355 = stablehlo.reshape %v2353 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2356 = stablehlo.dot_general %v2354, %v2355, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2357 = stablehlo.reshape %v2356 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2358 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2359 = stablehlo.multiply %v2357, %v2358 : tensor<256x38809xf32>
    %v2360 = stablehlo.reshape %v2359 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2361 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2362 = stablehlo.reduce(%v2360 init: %v2361) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2363 = stablehlo.broadcast_in_dim %v2362, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2364 = stablehlo.subtract %v2360, %v2363 : tensor<256x197x197xf32>
    %v2365 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2366 = stablehlo.exponential %v2364 : tensor<256x197x197xf32>
    %v2367 = stablehlo.reduce(%v2366 init: %v2365) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2368 = stablehlo.broadcast_in_dim %v2367, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2369 = stablehlo.divide %v2366, %v2368 : tensor<256x197x197xf32>
    %v2370 = stablehlo.reshape %v2369 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2371 = stablehlo.reshape %v2370 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2372 = stablehlo.reshape %v2350 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2373 = stablehlo.dot_general %v2371, %v2372, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2374 = stablehlo.reshape %v2373 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2375 = stablehlo.reshape %v2374 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2376 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2377 = stablehlo.pad %v2375, %v2376, low = [0, 0, 0], high = [0, 0, 128], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2378 = stablehlo.reshape %v2377 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2379 = stablehlo.reshape %v2331 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2380 = stablehlo.slice %v2379 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2381 = stablehlo.reshape %v2380 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2382 = stablehlo.reshape %v2336 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2383 = stablehlo.slice %v2382 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2384 = stablehlo.reshape %v2383 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2385 = stablehlo.reshape %v2341 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2386 = stablehlo.slice %v2385 [0:256, 0:197, 64:128] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2387 = stablehlo.reshape %v2386 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2388 = stablehlo.reshape %v2384 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2389 = stablehlo.transpose %v2388, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2390 = stablehlo.reshape %v2389 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2391 = stablehlo.reshape %v2381 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2392 = stablehlo.reshape %v2390 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2393 = stablehlo.dot_general %v2391, %v2392, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2394 = stablehlo.reshape %v2393 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2395 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2396 = stablehlo.multiply %v2394, %v2395 : tensor<256x38809xf32>
    %v2397 = stablehlo.reshape %v2396 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2398 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2399 = stablehlo.reduce(%v2397 init: %v2398) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2400 = stablehlo.broadcast_in_dim %v2399, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2401 = stablehlo.subtract %v2397, %v2400 : tensor<256x197x197xf32>
    %v2402 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2403 = stablehlo.exponential %v2401 : tensor<256x197x197xf32>
    %v2404 = stablehlo.reduce(%v2403 init: %v2402) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2405 = stablehlo.broadcast_in_dim %v2404, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2406 = stablehlo.divide %v2403, %v2405 : tensor<256x197x197xf32>
    %v2407 = stablehlo.reshape %v2406 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2408 = stablehlo.reshape %v2407 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2409 = stablehlo.reshape %v2387 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2410 = stablehlo.dot_general %v2408, %v2409, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2411 = stablehlo.reshape %v2410 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2412 = stablehlo.reshape %v2411 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2413 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2414 = stablehlo.pad %v2412, %v2413, low = [0, 0, 64], high = [0, 0, 64], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2415 = stablehlo.reshape %v2414 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2416 = stablehlo.add %v2378, %v2415 : tensor<256x37824xf32>
    %v2417 = stablehlo.reshape %v2331 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2418 = stablehlo.slice %v2417 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2419 = stablehlo.reshape %v2418 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2420 = stablehlo.reshape %v2336 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2421 = stablehlo.slice %v2420 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2422 = stablehlo.reshape %v2421 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2423 = stablehlo.reshape %v2341 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2424 = stablehlo.slice %v2423 [0:256, 0:197, 128:192] : (tensor<256x197x192xf32>) -> tensor<256x197x64xf32>
    %v2425 = stablehlo.reshape %v2424 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2426 = stablehlo.reshape %v2422 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2427 = stablehlo.transpose %v2426, dims = [0, 2, 1] : (tensor<256x197x64xf32>) -> tensor<256x64x197xf32>
    %v2428 = stablehlo.reshape %v2427 : (tensor<256x64x197xf32>) -> tensor<256x12608xf32>
    %v2429 = stablehlo.reshape %v2419 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2430 = stablehlo.reshape %v2428 : (tensor<256x12608xf32>) -> tensor<256x64x197xf32>
    %v2431 = stablehlo.dot_general %v2429, %v2430, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x64xf32>, tensor<256x64x197xf32>) -> tensor<256x197x197xf32>
    %v2432 = stablehlo.reshape %v2431 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2433 = stablehlo.constant dense<0.125> : tensor<256x38809xf32>
    %v2434 = stablehlo.multiply %v2432, %v2433 : tensor<256x38809xf32>
    %v2435 = stablehlo.reshape %v2434 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2436 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v2437 = stablehlo.reduce(%v2435 init: %v2436) applies stablehlo.maximum across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2438 = stablehlo.broadcast_in_dim %v2437, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2439 = stablehlo.subtract %v2435, %v2438 : tensor<256x197x197xf32>
    %v2440 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2441 = stablehlo.exponential %v2439 : tensor<256x197x197xf32>
    %v2442 = stablehlo.reduce(%v2441 init: %v2440) applies stablehlo.add across dimensions = [2] : (tensor<256x197x197xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2443 = stablehlo.broadcast_in_dim %v2442, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x197xf32>
    %v2444 = stablehlo.divide %v2441, %v2443 : tensor<256x197x197xf32>
    %v2445 = stablehlo.reshape %v2444 : (tensor<256x197x197xf32>) -> tensor<256x38809xf32>
    %v2446 = stablehlo.reshape %v2445 : (tensor<256x38809xf32>) -> tensor<256x197x197xf32>
    %v2447 = stablehlo.reshape %v2425 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2448 = stablehlo.dot_general %v2446, %v2447, batching_dims = [0] x [0], contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<256x197x197xf32>, tensor<256x197x64xf32>) -> tensor<256x197x64xf32>
    %v2449 = stablehlo.reshape %v2448 : (tensor<256x197x64xf32>) -> tensor<256x12608xf32>
    %v2450 = stablehlo.reshape %v2449 : (tensor<256x12608xf32>) -> tensor<256x197x64xf32>
    %v2451 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2452 = stablehlo.pad %v2450, %v2451, low = [0, 0, 128], high = [0, 0, 0], interior = [0, 0, 0] : (tensor<256x197x64xf32>, tensor<f32>) -> tensor<256x197x192xf32>
    %v2453 = stablehlo.reshape %v2452 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2454 = stablehlo.add %v2416, %v2453 : tensor<256x37824xf32>
    %v2455 = stablehlo.reshape %v2454 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2456 = stablehlo.dot_general %v2455, %b11_Wo, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x192xf32>) -> tensor<256x197x192xf32>
    %v2457 = stablehlo.broadcast_in_dim %b11_bo, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2458 = stablehlo.add %v2456, %v2457 : tensor<256x197x192xf32>
    %v2459 = stablehlo.reshape %v2458 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2460 = stablehlo.add %v2298, %v2459 : tensor<256x37824xf32>
    %v2461 = stablehlo.reshape %v2460 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2462 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2463 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v2464 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v2465 = stablehlo.reduce(%v2461 init: %v2462) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2466 = stablehlo.broadcast_in_dim %v2465, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2467 = stablehlo.divide %v2466, %v2463 : tensor<256x197x192xf32>
    %v2468 = stablehlo.subtract %v2461, %v2467 : tensor<256x197x192xf32>
    %v2469 = stablehlo.multiply %v2468, %v2468 : tensor<256x197x192xf32>
    %v2470 = stablehlo.reduce(%v2469 init: %v2462) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2471 = stablehlo.broadcast_in_dim %v2470, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2472 = stablehlo.divide %v2471, %v2463 : tensor<256x197x192xf32>
    %v2473 = stablehlo.add %v2472, %v2464 : tensor<256x197x192xf32>
    %v2474 = stablehlo.rsqrt %v2473 : tensor<256x197x192xf32>
    %v2475 = stablehlo.multiply %v2468, %v2474 : tensor<256x197x192xf32>
    %v2476 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2477 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2478 = stablehlo.multiply %v2475, %v2476 : tensor<256x197x192xf32>
    %v2479 = stablehlo.add %v2478, %v2477 : tensor<256x197x192xf32>
    %v2480 = stablehlo.reshape %v2479 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2481 = stablehlo.reshape %v2480 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2482 = stablehlo.broadcast_in_dim %b11_g2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2483 = stablehlo.multiply %v2481, %v2482 : tensor<256x197x192xf32>
    %v2484 = stablehlo.reshape %v2483 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2485 = stablehlo.reshape %v2484 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2486 = stablehlo.broadcast_in_dim %b11_bt2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2487 = stablehlo.add %v2485, %v2486 : tensor<256x197x192xf32>
    %v2488 = stablehlo.reshape %v2487 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2489 = stablehlo.reshape %v2488 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2490 = stablehlo.dot_general %v2489, %b11_Wfc1, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x192xf32>, tensor<192x768xf32>) -> tensor<256x197x768xf32>
    %v2491 = stablehlo.broadcast_in_dim %b11_bfc1, dims = [2] : (tensor<768xf32>) -> tensor<256x197x768xf32>
    %v2492 = stablehlo.add %v2490, %v2491 : tensor<256x197x768xf32>
    %v2493 = stablehlo.reshape %v2492 : (tensor<256x197x768xf32>) -> tensor<256x151296xf32>
    %v2494 = stablehlo.constant dense<0.5> : tensor<256x151296xf32>
    %v2495 = stablehlo.multiply %v2494, %v2493 : tensor<256x151296xf32>
    %v2496 = stablehlo.negate %v2493 : tensor<256x151296xf32>
    %v2497 = stablehlo.constant dense<0.7071067811865476> : tensor<256x151296xf32>
    %v2498 = stablehlo.multiply %v2496, %v2497 : tensor<256x151296xf32>
    %v2499 = chlo.erfc %v2498 : tensor<256x151296xf32> -> tensor<256x151296xf32>
    %v2500 = stablehlo.multiply %v2495, %v2499 : tensor<256x151296xf32>
    %v2501 = stablehlo.reshape %v2500 : (tensor<256x151296xf32>) -> tensor<256x197x768xf32>
    %v2502 = stablehlo.dot_general %v2501, %b11_Wfc2, contracting_dims = [2] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x197x768xf32>, tensor<768x192xf32>) -> tensor<256x197x192xf32>
    %v2503 = stablehlo.broadcast_in_dim %b11_bfc2, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2504 = stablehlo.add %v2502, %v2503 : tensor<256x197x192xf32>
    %v2505 = stablehlo.reshape %v2504 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2506 = stablehlo.add %v2460, %v2505 : tensor<256x37824xf32>
    %v2507 = stablehlo.reshape %v2506 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2508 = stablehlo.constant dense<0.0> : tensor<f32>
    %v2509 = stablehlo.constant dense<192.0> : tensor<256x197x192xf32>
    %v2510 = stablehlo.constant dense<1.0e-6> : tensor<256x197x192xf32>
    %v2511 = stablehlo.reduce(%v2507 init: %v2508) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2512 = stablehlo.broadcast_in_dim %v2511, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2513 = stablehlo.divide %v2512, %v2509 : tensor<256x197x192xf32>
    %v2514 = stablehlo.subtract %v2507, %v2513 : tensor<256x197x192xf32>
    %v2515 = stablehlo.multiply %v2514, %v2514 : tensor<256x197x192xf32>
    %v2516 = stablehlo.reduce(%v2515 init: %v2508) applies stablehlo.add across dimensions = [2] : (tensor<256x197x192xf32>, tensor<f32>) -> tensor<256x197xf32>
    %v2517 = stablehlo.broadcast_in_dim %v2516, dims = [0, 1] : (tensor<256x197xf32>) -> tensor<256x197x192xf32>
    %v2518 = stablehlo.divide %v2517, %v2509 : tensor<256x197x192xf32>
    %v2519 = stablehlo.add %v2518, %v2510 : tensor<256x197x192xf32>
    %v2520 = stablehlo.rsqrt %v2519 : tensor<256x197x192xf32>
    %v2521 = stablehlo.multiply %v2514, %v2520 : tensor<256x197x192xf32>
    %v2522 = stablehlo.broadcast_in_dim %one, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2523 = stablehlo.broadcast_in_dim %zero, dims = [] : (tensor<f32>) -> tensor<256x197x192xf32>
    %v2524 = stablehlo.multiply %v2521, %v2522 : tensor<256x197x192xf32>
    %v2525 = stablehlo.add %v2524, %v2523 : tensor<256x197x192xf32>
    %v2526 = stablehlo.reshape %v2525 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2527 = stablehlo.reshape %v2526 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2528 = stablehlo.broadcast_in_dim %gF, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2529 = stablehlo.multiply %v2527, %v2528 : tensor<256x197x192xf32>
    %v2530 = stablehlo.reshape %v2529 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2531 = stablehlo.reshape %v2530 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2532 = stablehlo.broadcast_in_dim %btF, dims = [2] : (tensor<192xf32>) -> tensor<256x197x192xf32>
    %v2533 = stablehlo.add %v2531, %v2532 : tensor<256x197x192xf32>
    %v2534 = stablehlo.reshape %v2533 : (tensor<256x197x192xf32>) -> tensor<256x37824xf32>
    %v2535 = stablehlo.reshape %v2534 : (tensor<256x37824xf32>) -> tensor<256x197x192xf32>
    %v2536 = stablehlo.slice %v2535 [0:256, 0:1, 0:192] : (tensor<256x197x192xf32>) -> tensor<256x1x192xf32>
    %v2537 = stablehlo.reshape %v2536 : (tensor<256x1x192xf32>) -> tensor<256x192xf32>
    %v2538 = stablehlo.dot_general %v2537, %Wc, contracting_dims = [1] x [0], precision = [DEFAULT, DEFAULT] : (tensor<256x192xf32>, tensor<192x1000xf32>) -> tensor<256x1000xf32>
    %v2539 = stablehlo.broadcast_in_dim %bc, dims = [1] : (tensor<1000xf32>) -> tensor<256x1000xf32>
    %v2540 = stablehlo.add %v2538, %v2539 : tensor<256x1000xf32>
    return %v2540 : tensor<256x1000xf32>
  }
}
