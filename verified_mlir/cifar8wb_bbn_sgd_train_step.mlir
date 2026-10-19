module @m {
  func.func @cifar8wb_bbn_sgd_train_step(%x: tensor<128x3072xf32>, %W1: tensor<16x3x3x3xf32>, %cb1: tensor<16xf32>, %g1: tensor<16xf32>, %bt1: tensor<16xf32>, %W2: tensor<16x16x3x3xf32>, %cb2: tensor<16xf32>, %g2: tensor<16xf32>, %bt2: tensor<16xf32>, %W3: tensor<16x16x3x3xf32>, %cb3: tensor<16xf32>, %g3: tensor<16xf32>, %bt3: tensor<16xf32>, %W4: tensor<16x16x3x3xf32>, %cb4: tensor<16xf32>, %g4: tensor<16xf32>, %bt4: tensor<16xf32>, %W5: tensor<32x16x3x3xf32>, %cb5: tensor<32xf32>, %g5: tensor<32xf32>, %bt5: tensor<32xf32>, %W6: tensor<32x32x3x3xf32>, %cb6: tensor<32xf32>, %g6: tensor<32xf32>, %bt6: tensor<32xf32>, %W7: tensor<32x32x3x3xf32>, %cb7: tensor<32xf32>, %g7: tensor<32xf32>, %bt7: tensor<32xf32>, %W8: tensor<32x32x3x3xf32>, %cb8: tensor<32xf32>, %g8: tensor<32xf32>, %bt8: tensor<32xf32>, %W9: tensor<128x512xf32>, %b9: tensor<512xf32>, %Wa: tensor<512x512xf32>, %ba: tensor<512xf32>, %Wb: tensor<512x10xf32>, %bb: tensor<10xf32>, %W1m: tensor<16x3x3x3xf32>, %cb1m: tensor<16xf32>, %g1m: tensor<16xf32>, %bt1m: tensor<16xf32>, %W2m: tensor<16x16x3x3xf32>, %cb2m: tensor<16xf32>, %g2m: tensor<16xf32>, %bt2m: tensor<16xf32>, %W3m: tensor<16x16x3x3xf32>, %cb3m: tensor<16xf32>, %g3m: tensor<16xf32>, %bt3m: tensor<16xf32>, %W4m: tensor<16x16x3x3xf32>, %cb4m: tensor<16xf32>, %g4m: tensor<16xf32>, %bt4m: tensor<16xf32>, %W5m: tensor<32x16x3x3xf32>, %cb5m: tensor<32xf32>, %g5m: tensor<32xf32>, %bt5m: tensor<32xf32>, %W6m: tensor<32x32x3x3xf32>, %cb6m: tensor<32xf32>, %g6m: tensor<32xf32>, %bt6m: tensor<32xf32>, %W7m: tensor<32x32x3x3xf32>, %cb7m: tensor<32xf32>, %g7m: tensor<32xf32>, %bt7m: tensor<32xf32>, %W8m: tensor<32x32x3x3xf32>, %cb8m: tensor<32xf32>, %g8m: tensor<32xf32>, %bt8m: tensor<32xf32>, %W9m: tensor<128x512xf32>, %b9m: tensor<512xf32>, %Wam: tensor<512x512xf32>, %bam: tensor<512xf32>, %Wbm: tensor<512x10xf32>, %bbm: tensor<10xf32>, %W1v: tensor<16x3x3x3xf32>, %cb1v: tensor<16xf32>, %g1v: tensor<16xf32>, %bt1v: tensor<16xf32>, %W2v: tensor<16x16x3x3xf32>, %cb2v: tensor<16xf32>, %g2v: tensor<16xf32>, %bt2v: tensor<16xf32>, %W3v: tensor<16x16x3x3xf32>, %cb3v: tensor<16xf32>, %g3v: tensor<16xf32>, %bt3v: tensor<16xf32>, %W4v: tensor<16x16x3x3xf32>, %cb4v: tensor<16xf32>, %g4v: tensor<16xf32>, %bt4v: tensor<16xf32>, %W5v: tensor<32x16x3x3xf32>, %cb5v: tensor<32xf32>, %g5v: tensor<32xf32>, %bt5v: tensor<32xf32>, %W6v: tensor<32x32x3x3xf32>, %cb6v: tensor<32xf32>, %g6v: tensor<32xf32>, %bt6v: tensor<32xf32>, %W7v: tensor<32x32x3x3xf32>, %cb7v: tensor<32xf32>, %g7v: tensor<32xf32>, %bt7v: tensor<32xf32>, %W8v: tensor<32x32x3x3xf32>, %cb8v: tensor<32xf32>, %g8v: tensor<32xf32>, %bt8v: tensor<32xf32>, %W9v: tensor<128x512xf32>, %b9v: tensor<512xf32>, %Wav: tensor<512x512xf32>, %bav: tensor<512xf32>, %Wbv: tensor<512x10xf32>, %bbv: tensor<10xf32>, %lr: tensor<f32>, %bc1: tensor<f32>, %bc2: tensor<f32>, %n1mui: tensor<16xf32>, %n1vari: tensor<16xf32>, %n2mui: tensor<16xf32>, %n2vari: tensor<16xf32>, %n3mui: tensor<16xf32>, %n3vari: tensor<16xf32>, %n4mui: tensor<16xf32>, %n4vari: tensor<16xf32>, %n5mui: tensor<32xf32>, %n5vari: tensor<32xf32>, %n6mui: tensor<32xf32>, %n6vari: tensor<32xf32>, %n7mui: tensor<32xf32>, %n7vari: tensor<32xf32>, %n8mui: tensor<32xf32>, %n8vari: tensor<32xf32>, %onehot: tensor<128x10xf32>) -> (tensor<16x3x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<32x16x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<128x512xf32>, tensor<512xf32>, tensor<512x512xf32>, tensor<512xf32>, tensor<512x10xf32>, tensor<10xf32>, tensor<16x3x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<32x16x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<128x512xf32>, tensor<512xf32>, tensor<512x512xf32>, tensor<512xf32>, tensor<512x10xf32>, tensor<10xf32>, tensor<16x3x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<32x16x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<128x512xf32>, tensor<512xf32>, tensor<512x512xf32>, tensor<512xf32>, tensor<512x10xf32>, tensor<10xf32>, tensor<f32>, tensor<f32>, tensor<f32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>) {
    // ── cifar8-BN SGD train step at BATCH statistics (BN over [0,2,3]), BATCHED op
    //    family: every op is pretty(verified AST node) except the constants below, the marked
    //    report-only loss and the %bc passthroughs; the 16 trailing outputs are each BN's
    //    batch mean and variance, for the host's running-statistics EMA ──
    %lzero = stablehlo.constant dense<0.0> : tensor<f32>
    %b1 = stablehlo.constant dense<0.9> : tensor<f32>
    %ob1 = stablehlo.constant dense<0.1> : tensor<f32>
    %b2 = stablehlo.constant dense<0.999> : tensor<f32>
    %ob2 = stablehlo.constant dense<0.001> : tensor<f32>
    %eps = stablehlo.constant dense<1.0e-8> : tensor<f32>
    %wd = stablehlo.constant dense<0.0001> : tensor<f32>
    %v0 = stablehlo.reshape %x : (tensor<128x3072xf32>) -> tensor<128x3x32x32xf32>
    %v1 = stablehlo.convolution(%v0, %W1)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x3x32x32xf32>, tensor<16x3x3x3xf32>) -> tensor<128x16x32x32xf32>
    %v2 = stablehlo.broadcast_in_dim %cb1, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v3 = stablehlo.add %v1, %v2 : tensor<128x16x32x32xf32>
    %v4 = stablehlo.reshape %v3 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v5 = stablehlo.reshape %v4 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v6 = stablehlo.constant dense<0.0> : tensor<f32>
    %v7 = stablehlo.constant dense<131072.0> : tensor<128x16x32x32xf32>
    %v8 = stablehlo.constant dense<1.0e-05> : tensor<128x16x32x32xf32>
    %v9 = stablehlo.reduce(%v5 init: %v6) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v10 = stablehlo.broadcast_in_dim %v9, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v11 = stablehlo.divide %v10, %v7 : tensor<128x16x32x32xf32>
    %v12 = stablehlo.subtract %v5, %v11 : tensor<128x16x32x32xf32>
    %v13 = stablehlo.multiply %v12, %v12 : tensor<128x16x32x32xf32>
    %v14 = stablehlo.reduce(%v13 init: %v6) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v15 = stablehlo.broadcast_in_dim %v14, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v16 = stablehlo.divide %v15, %v7 : tensor<128x16x32x32xf32>
    %v17 = stablehlo.add %v16, %v8 : tensor<128x16x32x32xf32>
    %v18 = stablehlo.rsqrt %v17 : tensor<128x16x32x32xf32>
    %v19 = stablehlo.multiply %v12, %v18 : tensor<128x16x32x32xf32>
    %v20 = stablehlo.broadcast_in_dim %g1, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v21 = stablehlo.broadcast_in_dim %bt1, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v22 = stablehlo.multiply %v19, %v20 : tensor<128x16x32x32xf32>
    %v23 = stablehlo.add %v22, %v21 : tensor<128x16x32x32xf32>
    %v24 = stablehlo.reshape %v23 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v25 = stablehlo.reshape %v24 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v26 = stablehlo.constant dense<0.0> : tensor<128x16x32x32xf32>
    %v27 = stablehlo.maximum %v25, %v26 : tensor<128x16x32x32xf32>
    %v28 = stablehlo.reshape %v27 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v29 = stablehlo.reshape %v28 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v30 = stablehlo.convolution(%v29, %W2)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x16x32x32xf32>, tensor<16x16x3x3xf32>) -> tensor<128x16x32x32xf32>
    %v31 = stablehlo.broadcast_in_dim %cb2, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v32 = stablehlo.add %v30, %v31 : tensor<128x16x32x32xf32>
    %v33 = stablehlo.reshape %v32 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v34 = stablehlo.reshape %v33 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v35 = stablehlo.constant dense<0.0> : tensor<f32>
    %v36 = stablehlo.constant dense<131072.0> : tensor<128x16x32x32xf32>
    %v37 = stablehlo.constant dense<1.0e-05> : tensor<128x16x32x32xf32>
    %v38 = stablehlo.reduce(%v34 init: %v35) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v39 = stablehlo.broadcast_in_dim %v38, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v40 = stablehlo.divide %v39, %v36 : tensor<128x16x32x32xf32>
    %v41 = stablehlo.subtract %v34, %v40 : tensor<128x16x32x32xf32>
    %v42 = stablehlo.multiply %v41, %v41 : tensor<128x16x32x32xf32>
    %v43 = stablehlo.reduce(%v42 init: %v35) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v44 = stablehlo.broadcast_in_dim %v43, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v45 = stablehlo.divide %v44, %v36 : tensor<128x16x32x32xf32>
    %v46 = stablehlo.add %v45, %v37 : tensor<128x16x32x32xf32>
    %v47 = stablehlo.rsqrt %v46 : tensor<128x16x32x32xf32>
    %v48 = stablehlo.multiply %v41, %v47 : tensor<128x16x32x32xf32>
    %v49 = stablehlo.broadcast_in_dim %g2, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v50 = stablehlo.broadcast_in_dim %bt2, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v51 = stablehlo.multiply %v48, %v49 : tensor<128x16x32x32xf32>
    %v52 = stablehlo.add %v51, %v50 : tensor<128x16x32x32xf32>
    %v53 = stablehlo.reshape %v52 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v54 = stablehlo.reshape %v53 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v55 = stablehlo.constant dense<0.0> : tensor<128x16x32x32xf32>
    %v56 = stablehlo.maximum %v54, %v55 : tensor<128x16x32x32xf32>
    %v57 = stablehlo.reshape %v56 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v58 = stablehlo.reshape %v57 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v59 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v60 = "stablehlo.reduce_window"(%v58, %v59) ({
      ^bb0(%pa: tensor<f32>, %pb: tensor<f32>):
        %pm = stablehlo.maximum %pa, %pb : tensor<f32>
        stablehlo.return %pm : tensor<f32>
    }) {window_dimensions = array<i64: 1, 1, 2, 2>, window_strides = array<i64: 1, 1, 2, 2>} : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<128x16x16x16xf32>
    %v61 = stablehlo.reshape %v60 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v62 = stablehlo.reshape %v61 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v63 = stablehlo.convolution(%v62, %W3)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x16x16x16xf32>, tensor<16x16x3x3xf32>) -> tensor<128x16x16x16xf32>
    %v64 = stablehlo.broadcast_in_dim %cb3, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v65 = stablehlo.add %v63, %v64 : tensor<128x16x16x16xf32>
    %v66 = stablehlo.reshape %v65 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v67 = stablehlo.reshape %v66 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v68 = stablehlo.constant dense<0.0> : tensor<f32>
    %v69 = stablehlo.constant dense<32768.0> : tensor<128x16x16x16xf32>
    %v70 = stablehlo.constant dense<1.0e-05> : tensor<128x16x16x16xf32>
    %v71 = stablehlo.reduce(%v67 init: %v68) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v72 = stablehlo.broadcast_in_dim %v71, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v73 = stablehlo.divide %v72, %v69 : tensor<128x16x16x16xf32>
    %v74 = stablehlo.subtract %v67, %v73 : tensor<128x16x16x16xf32>
    %v75 = stablehlo.multiply %v74, %v74 : tensor<128x16x16x16xf32>
    %v76 = stablehlo.reduce(%v75 init: %v68) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v77 = stablehlo.broadcast_in_dim %v76, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v78 = stablehlo.divide %v77, %v69 : tensor<128x16x16x16xf32>
    %v79 = stablehlo.add %v78, %v70 : tensor<128x16x16x16xf32>
    %v80 = stablehlo.rsqrt %v79 : tensor<128x16x16x16xf32>
    %v81 = stablehlo.multiply %v74, %v80 : tensor<128x16x16x16xf32>
    %v82 = stablehlo.broadcast_in_dim %g3, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v83 = stablehlo.broadcast_in_dim %bt3, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v84 = stablehlo.multiply %v81, %v82 : tensor<128x16x16x16xf32>
    %v85 = stablehlo.add %v84, %v83 : tensor<128x16x16x16xf32>
    %v86 = stablehlo.reshape %v85 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v87 = stablehlo.reshape %v86 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v88 = stablehlo.constant dense<0.0> : tensor<128x16x16x16xf32>
    %v89 = stablehlo.maximum %v87, %v88 : tensor<128x16x16x16xf32>
    %v90 = stablehlo.reshape %v89 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v91 = stablehlo.reshape %v90 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v92 = stablehlo.convolution(%v91, %W4)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x16x16x16xf32>, tensor<16x16x3x3xf32>) -> tensor<128x16x16x16xf32>
    %v93 = stablehlo.broadcast_in_dim %cb4, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v94 = stablehlo.add %v92, %v93 : tensor<128x16x16x16xf32>
    %v95 = stablehlo.reshape %v94 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v96 = stablehlo.reshape %v95 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v97 = stablehlo.constant dense<0.0> : tensor<f32>
    %v98 = stablehlo.constant dense<32768.0> : tensor<128x16x16x16xf32>
    %v99 = stablehlo.constant dense<1.0e-05> : tensor<128x16x16x16xf32>
    %v100 = stablehlo.reduce(%v96 init: %v97) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v101 = stablehlo.broadcast_in_dim %v100, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v102 = stablehlo.divide %v101, %v98 : tensor<128x16x16x16xf32>
    %v103 = stablehlo.subtract %v96, %v102 : tensor<128x16x16x16xf32>
    %v104 = stablehlo.multiply %v103, %v103 : tensor<128x16x16x16xf32>
    %v105 = stablehlo.reduce(%v104 init: %v97) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v106 = stablehlo.broadcast_in_dim %v105, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v107 = stablehlo.divide %v106, %v98 : tensor<128x16x16x16xf32>
    %v108 = stablehlo.add %v107, %v99 : tensor<128x16x16x16xf32>
    %v109 = stablehlo.rsqrt %v108 : tensor<128x16x16x16xf32>
    %v110 = stablehlo.multiply %v103, %v109 : tensor<128x16x16x16xf32>
    %v111 = stablehlo.broadcast_in_dim %g4, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v112 = stablehlo.broadcast_in_dim %bt4, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v113 = stablehlo.multiply %v110, %v111 : tensor<128x16x16x16xf32>
    %v114 = stablehlo.add %v113, %v112 : tensor<128x16x16x16xf32>
    %v115 = stablehlo.reshape %v114 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v116 = stablehlo.reshape %v115 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v117 = stablehlo.constant dense<0.0> : tensor<128x16x16x16xf32>
    %v118 = stablehlo.maximum %v116, %v117 : tensor<128x16x16x16xf32>
    %v119 = stablehlo.reshape %v118 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v120 = stablehlo.reshape %v119 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v121 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v122 = "stablehlo.reduce_window"(%v120, %v121) ({
      ^bb0(%pa: tensor<f32>, %pb: tensor<f32>):
        %pm = stablehlo.maximum %pa, %pb : tensor<f32>
        stablehlo.return %pm : tensor<f32>
    }) {window_dimensions = array<i64: 1, 1, 2, 2>, window_strides = array<i64: 1, 1, 2, 2>} : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<128x16x8x8xf32>
    %v123 = stablehlo.reshape %v122 : (tensor<128x16x8x8xf32>) -> tensor<128x1024xf32>
    %v124 = stablehlo.reshape %v123 : (tensor<128x1024xf32>) -> tensor<128x16x8x8xf32>
    %v125 = stablehlo.convolution(%v124, %W5)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x16x8x8xf32>, tensor<32x16x3x3xf32>) -> tensor<128x32x8x8xf32>
    %v126 = stablehlo.broadcast_in_dim %cb5, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v127 = stablehlo.add %v125, %v126 : tensor<128x32x8x8xf32>
    %v128 = stablehlo.reshape %v127 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v129 = stablehlo.reshape %v128 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v130 = stablehlo.constant dense<0.0> : tensor<f32>
    %v131 = stablehlo.constant dense<8192.0> : tensor<128x32x8x8xf32>
    %v132 = stablehlo.constant dense<1.0e-05> : tensor<128x32x8x8xf32>
    %v133 = stablehlo.reduce(%v129 init: %v130) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v134 = stablehlo.broadcast_in_dim %v133, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v135 = stablehlo.divide %v134, %v131 : tensor<128x32x8x8xf32>
    %v136 = stablehlo.subtract %v129, %v135 : tensor<128x32x8x8xf32>
    %v137 = stablehlo.multiply %v136, %v136 : tensor<128x32x8x8xf32>
    %v138 = stablehlo.reduce(%v137 init: %v130) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v139 = stablehlo.broadcast_in_dim %v138, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v140 = stablehlo.divide %v139, %v131 : tensor<128x32x8x8xf32>
    %v141 = stablehlo.add %v140, %v132 : tensor<128x32x8x8xf32>
    %v142 = stablehlo.rsqrt %v141 : tensor<128x32x8x8xf32>
    %v143 = stablehlo.multiply %v136, %v142 : tensor<128x32x8x8xf32>
    %v144 = stablehlo.broadcast_in_dim %g5, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v145 = stablehlo.broadcast_in_dim %bt5, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v146 = stablehlo.multiply %v143, %v144 : tensor<128x32x8x8xf32>
    %v147 = stablehlo.add %v146, %v145 : tensor<128x32x8x8xf32>
    %v148 = stablehlo.reshape %v147 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v149 = stablehlo.reshape %v148 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v150 = stablehlo.constant dense<0.0> : tensor<128x32x8x8xf32>
    %v151 = stablehlo.maximum %v149, %v150 : tensor<128x32x8x8xf32>
    %v152 = stablehlo.reshape %v151 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v153 = stablehlo.reshape %v152 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v154 = stablehlo.convolution(%v153, %W6)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x32x8x8xf32>, tensor<32x32x3x3xf32>) -> tensor<128x32x8x8xf32>
    %v155 = stablehlo.broadcast_in_dim %cb6, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v156 = stablehlo.add %v154, %v155 : tensor<128x32x8x8xf32>
    %v157 = stablehlo.reshape %v156 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v158 = stablehlo.reshape %v157 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v159 = stablehlo.constant dense<0.0> : tensor<f32>
    %v160 = stablehlo.constant dense<8192.0> : tensor<128x32x8x8xf32>
    %v161 = stablehlo.constant dense<1.0e-05> : tensor<128x32x8x8xf32>
    %v162 = stablehlo.reduce(%v158 init: %v159) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v163 = stablehlo.broadcast_in_dim %v162, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v164 = stablehlo.divide %v163, %v160 : tensor<128x32x8x8xf32>
    %v165 = stablehlo.subtract %v158, %v164 : tensor<128x32x8x8xf32>
    %v166 = stablehlo.multiply %v165, %v165 : tensor<128x32x8x8xf32>
    %v167 = stablehlo.reduce(%v166 init: %v159) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v168 = stablehlo.broadcast_in_dim %v167, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v169 = stablehlo.divide %v168, %v160 : tensor<128x32x8x8xf32>
    %v170 = stablehlo.add %v169, %v161 : tensor<128x32x8x8xf32>
    %v171 = stablehlo.rsqrt %v170 : tensor<128x32x8x8xf32>
    %v172 = stablehlo.multiply %v165, %v171 : tensor<128x32x8x8xf32>
    %v173 = stablehlo.broadcast_in_dim %g6, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v174 = stablehlo.broadcast_in_dim %bt6, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v175 = stablehlo.multiply %v172, %v173 : tensor<128x32x8x8xf32>
    %v176 = stablehlo.add %v175, %v174 : tensor<128x32x8x8xf32>
    %v177 = stablehlo.reshape %v176 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v178 = stablehlo.reshape %v177 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v179 = stablehlo.constant dense<0.0> : tensor<128x32x8x8xf32>
    %v180 = stablehlo.maximum %v178, %v179 : tensor<128x32x8x8xf32>
    %v181 = stablehlo.reshape %v180 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v182 = stablehlo.reshape %v181 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v183 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v184 = "stablehlo.reduce_window"(%v182, %v183) ({
      ^bb0(%pa: tensor<f32>, %pb: tensor<f32>):
        %pm = stablehlo.maximum %pa, %pb : tensor<f32>
        stablehlo.return %pm : tensor<f32>
    }) {window_dimensions = array<i64: 1, 1, 2, 2>, window_strides = array<i64: 1, 1, 2, 2>} : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<128x32x4x4xf32>
    %v185 = stablehlo.reshape %v184 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v186 = stablehlo.reshape %v185 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v187 = stablehlo.convolution(%v186, %W7)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x32x4x4xf32>, tensor<32x32x3x3xf32>) -> tensor<128x32x4x4xf32>
    %v188 = stablehlo.broadcast_in_dim %cb7, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v189 = stablehlo.add %v187, %v188 : tensor<128x32x4x4xf32>
    %v190 = stablehlo.reshape %v189 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v191 = stablehlo.reshape %v190 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v192 = stablehlo.constant dense<0.0> : tensor<f32>
    %v193 = stablehlo.constant dense<2048.0> : tensor<128x32x4x4xf32>
    %v194 = stablehlo.constant dense<1.0e-05> : tensor<128x32x4x4xf32>
    %v195 = stablehlo.reduce(%v191 init: %v192) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v196 = stablehlo.broadcast_in_dim %v195, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v197 = stablehlo.divide %v196, %v193 : tensor<128x32x4x4xf32>
    %v198 = stablehlo.subtract %v191, %v197 : tensor<128x32x4x4xf32>
    %v199 = stablehlo.multiply %v198, %v198 : tensor<128x32x4x4xf32>
    %v200 = stablehlo.reduce(%v199 init: %v192) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v201 = stablehlo.broadcast_in_dim %v200, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v202 = stablehlo.divide %v201, %v193 : tensor<128x32x4x4xf32>
    %v203 = stablehlo.add %v202, %v194 : tensor<128x32x4x4xf32>
    %v204 = stablehlo.rsqrt %v203 : tensor<128x32x4x4xf32>
    %v205 = stablehlo.multiply %v198, %v204 : tensor<128x32x4x4xf32>
    %v206 = stablehlo.broadcast_in_dim %g7, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v207 = stablehlo.broadcast_in_dim %bt7, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v208 = stablehlo.multiply %v205, %v206 : tensor<128x32x4x4xf32>
    %v209 = stablehlo.add %v208, %v207 : tensor<128x32x4x4xf32>
    %v210 = stablehlo.reshape %v209 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v211 = stablehlo.reshape %v210 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v212 = stablehlo.constant dense<0.0> : tensor<128x32x4x4xf32>
    %v213 = stablehlo.maximum %v211, %v212 : tensor<128x32x4x4xf32>
    %v214 = stablehlo.reshape %v213 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v215 = stablehlo.reshape %v214 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v216 = stablehlo.convolution(%v215, %W8)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x32x4x4xf32>, tensor<32x32x3x3xf32>) -> tensor<128x32x4x4xf32>
    %v217 = stablehlo.broadcast_in_dim %cb8, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v218 = stablehlo.add %v216, %v217 : tensor<128x32x4x4xf32>
    %v219 = stablehlo.reshape %v218 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v220 = stablehlo.reshape %v219 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v221 = stablehlo.constant dense<0.0> : tensor<f32>
    %v222 = stablehlo.constant dense<2048.0> : tensor<128x32x4x4xf32>
    %v223 = stablehlo.constant dense<1.0e-05> : tensor<128x32x4x4xf32>
    %v224 = stablehlo.reduce(%v220 init: %v221) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v225 = stablehlo.broadcast_in_dim %v224, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v226 = stablehlo.divide %v225, %v222 : tensor<128x32x4x4xf32>
    %v227 = stablehlo.subtract %v220, %v226 : tensor<128x32x4x4xf32>
    %v228 = stablehlo.multiply %v227, %v227 : tensor<128x32x4x4xf32>
    %v229 = stablehlo.reduce(%v228 init: %v221) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v230 = stablehlo.broadcast_in_dim %v229, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v231 = stablehlo.divide %v230, %v222 : tensor<128x32x4x4xf32>
    %v232 = stablehlo.add %v231, %v223 : tensor<128x32x4x4xf32>
    %v233 = stablehlo.rsqrt %v232 : tensor<128x32x4x4xf32>
    %v234 = stablehlo.multiply %v227, %v233 : tensor<128x32x4x4xf32>
    %v235 = stablehlo.broadcast_in_dim %g8, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v236 = stablehlo.broadcast_in_dim %bt8, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v237 = stablehlo.multiply %v234, %v235 : tensor<128x32x4x4xf32>
    %v238 = stablehlo.add %v237, %v236 : tensor<128x32x4x4xf32>
    %v239 = stablehlo.reshape %v238 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v240 = stablehlo.reshape %v239 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v241 = stablehlo.constant dense<0.0> : tensor<128x32x4x4xf32>
    %v242 = stablehlo.maximum %v240, %v241 : tensor<128x32x4x4xf32>
    %v243 = stablehlo.reshape %v242 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v244 = stablehlo.reshape %v243 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v245 = stablehlo.constant dense<0xFF800000> : tensor<f32>
    %v246 = "stablehlo.reduce_window"(%v244, %v245) ({
      ^bb0(%pa: tensor<f32>, %pb: tensor<f32>):
        %pm = stablehlo.maximum %pa, %pb : tensor<f32>
        stablehlo.return %pm : tensor<f32>
    }) {window_dimensions = array<i64: 1, 1, 2, 2>, window_strides = array<i64: 1, 1, 2, 2>} : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<128x32x2x2xf32>
    %v247 = stablehlo.reshape %v246 : (tensor<128x32x2x2xf32>) -> tensor<128x128xf32>
    %v248 = stablehlo.dot_general %v247, %W9, contracting_dims = [1] x [0], precision = [DEFAULT, DEFAULT] : (tensor<128x128xf32>, tensor<128x512xf32>) -> tensor<128x512xf32>
    %v249 = stablehlo.broadcast_in_dim %b9, dims = [1] : (tensor<512xf32>) -> tensor<128x512xf32>
    %v250 = stablehlo.add %v248, %v249 : tensor<128x512xf32>
    %v251 = stablehlo.constant dense<0.0> : tensor<128x512xf32>
    %v252 = stablehlo.maximum %v250, %v251 : tensor<128x512xf32>
    %v253 = stablehlo.dot_general %v252, %Wa, contracting_dims = [1] x [0], precision = [DEFAULT, DEFAULT] : (tensor<128x512xf32>, tensor<512x512xf32>) -> tensor<128x512xf32>
    %v254 = stablehlo.broadcast_in_dim %ba, dims = [1] : (tensor<512xf32>) -> tensor<128x512xf32>
    %v255 = stablehlo.add %v253, %v254 : tensor<128x512xf32>
    %v256 = stablehlo.constant dense<0.0> : tensor<128x512xf32>
    %v257 = stablehlo.maximum %v255, %v256 : tensor<128x512xf32>
    %v258 = stablehlo.dot_general %v257, %Wb, contracting_dims = [1] x [0], precision = [DEFAULT, DEFAULT] : (tensor<128x512xf32>, tensor<512x10xf32>) -> tensor<128x10xf32>
    %v259 = stablehlo.broadcast_in_dim %bb, dims = [1] : (tensor<10xf32>) -> tensor<128x10xf32>
    %v260 = stablehlo.add %v258, %v259 : tensor<128x10xf32>
    %v261 = stablehlo.reshape %v260 : (tensor<128x10xf32>) -> tensor<128x1x10xf32>
    %v262 = stablehlo.constant dense<0.0> : tensor<f32>
    %v263 = stablehlo.exponential %v261 : tensor<128x1x10xf32>
    %v264 = stablehlo.reduce(%v263 init: %v262) applies stablehlo.add across dimensions = [2] : (tensor<128x1x10xf32>, tensor<f32>) -> tensor<128x1xf32>
    %v265 = stablehlo.broadcast_in_dim %v264, dims = [0, 1] : (tensor<128x1xf32>) -> tensor<128x1x10xf32>
    %v266 = stablehlo.divide %v263, %v265 : tensor<128x1x10xf32>
    %v267 = stablehlo.reshape %v266 : (tensor<128x1x10xf32>) -> tensor<128x10xf32>
    %v268 = stablehlo.subtract %v267, %onehot : tensor<128x10xf32>
    %v269 = stablehlo.constant dense<0.0078125> : tensor<128x10xf32>
    %v270 = stablehlo.multiply %v268, %v269 : tensor<128x10xf32>
    // ── report-only scalar loss (NOT pretty(AST): the kit has no rank-0 loss op; it
    //    feeds no parameter, only the driver's progress line) ──
    %llog = stablehlo.log %v267 : tensor<128x10xf32>
    %ohll = stablehlo.multiply %onehot, %llog : tensor<128x10xf32>
    %csum = stablehlo.reduce(%ohll init: %lzero) applies stablehlo.add across dimensions = [0, 1] : (tensor<128x10xf32>, tensor<f32>) -> tensor<f32>
    %cneg = stablehlo.negate %csum : tensor<f32>
    %lbf = stablehlo.constant dense<128.0> : tensor<f32>
    %loss = stablehlo.divide %cneg, %lbf : tensor<f32>
    %v271 = stablehlo.reshape %v270 : (tensor<128x10xf32>) -> tensor<128x1x10xf32>
    %v272 = stablehlo.dot_general %v271, %Wb, contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<128x1x10xf32>, tensor<512x10xf32>) -> tensor<128x1x512xf32>
    %v273 = stablehlo.reshape %v272 : (tensor<128x1x512xf32>) -> tensor<128x512xf32>
    %v274 = stablehlo.constant dense<0.0> : tensor<128x512xf32>
    %v275 = stablehlo.compare GT, %v255, %v274 : (tensor<128x512xf32>, tensor<128x512xf32>) -> tensor<128x512xi1>
    %v276 = stablehlo.select %v275, %v273, %v274 : tensor<128x512xi1>, tensor<128x512xf32>
    %v277 = stablehlo.reshape %v276 : (tensor<128x512xf32>) -> tensor<128x1x512xf32>
    %v278 = stablehlo.dot_general %v277, %Wa, contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<128x1x512xf32>, tensor<512x512xf32>) -> tensor<128x1x512xf32>
    %v279 = stablehlo.reshape %v278 : (tensor<128x1x512xf32>) -> tensor<128x512xf32>
    %v280 = stablehlo.constant dense<0.0> : tensor<128x512xf32>
    %v281 = stablehlo.compare GT, %v250, %v280 : (tensor<128x512xf32>, tensor<128x512xf32>) -> tensor<128x512xi1>
    %v282 = stablehlo.select %v281, %v279, %v280 : tensor<128x512xi1>, tensor<128x512xf32>
    %v283 = stablehlo.reshape %v282 : (tensor<128x512xf32>) -> tensor<128x1x512xf32>
    %v284 = stablehlo.dot_general %v283, %W9, contracting_dims = [2] x [1], precision = [DEFAULT, DEFAULT] : (tensor<128x1x512xf32>, tensor<128x512xf32>) -> tensor<128x1x128xf32>
    %v285 = stablehlo.reshape %v284 : (tensor<128x1x128xf32>) -> tensor<128x128xf32>
    %v286 = stablehlo.reshape %v243 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v287 = stablehlo.reshape %v285 : (tensor<128x128xf32>) -> tensor<128x32x2x2xf32>
    %v288 = stablehlo.constant dense<0.0> : tensor<f32>
    %v289 = "stablehlo.select_and_scatter"(%v286, %v287, %v288) ({
      ^bb0(%sa: tensor<f32>, %sb: tensor<f32>):
        %sge = stablehlo.compare GE, %sa, %sb : (tensor<f32>, tensor<f32>) -> tensor<i1>
        stablehlo.return %sge : tensor<i1>
    }, {
      ^bb0(%sc: tensor<f32>, %sd: tensor<f32>):
        %ss = stablehlo.add %sc, %sd : tensor<f32>
        stablehlo.return %ss : tensor<f32>
    }) {window_dimensions = array<i64: 1, 1, 2, 2>, window_strides = array<i64: 1, 1, 2, 2>} : (tensor<128x32x4x4xf32>, tensor<128x32x2x2xf32>, tensor<f32>) -> tensor<128x32x4x4xf32>
    %v290 = stablehlo.reshape %v289 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v291 = stablehlo.reshape %v290 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v292 = stablehlo.reshape %v239 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v293 = stablehlo.constant dense<0.0> : tensor<128x32x4x4xf32>
    %v294 = stablehlo.compare GT, %v292, %v293 : (tensor<128x32x4x4xf32>, tensor<128x32x4x4xf32>) -> tensor<128x32x4x4xi1>
    %v295 = stablehlo.select %v294, %v291, %v293 : tensor<128x32x4x4xi1>, tensor<128x32x4x4xf32>
    %v296 = stablehlo.reshape %v295 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v297 = stablehlo.reshape %v219 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v298 = stablehlo.constant dense<0.0> : tensor<f32>
    %v299 = stablehlo.constant dense<2048.0> : tensor<128x32x4x4xf32>
    %v300 = stablehlo.constant dense<1.0e-05> : tensor<128x32x4x4xf32>
    %v301 = stablehlo.reduce(%v297 init: %v298) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v302 = stablehlo.broadcast_in_dim %v301, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v303 = stablehlo.divide %v302, %v299 : tensor<128x32x4x4xf32>
    %v304 = stablehlo.subtract %v297, %v303 : tensor<128x32x4x4xf32>
    %v305 = stablehlo.multiply %v304, %v304 : tensor<128x32x4x4xf32>
    %v306 = stablehlo.reduce(%v305 init: %v298) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v307 = stablehlo.broadcast_in_dim %v306, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v308 = stablehlo.divide %v307, %v299 : tensor<128x32x4x4xf32>
    %v309 = stablehlo.add %v308, %v300 : tensor<128x32x4x4xf32>
    %v310 = stablehlo.rsqrt %v309 : tensor<128x32x4x4xf32>
    %v311 = stablehlo.multiply %v304, %v310 : tensor<128x32x4x4xf32>
    %v312 = stablehlo.broadcast_in_dim %g8, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v313 = stablehlo.reshape %v296 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v314 = stablehlo.multiply %v312, %v313 : tensor<128x32x4x4xf32>
    %v315 = stablehlo.reduce(%v314 init: %v298) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v316 = stablehlo.broadcast_in_dim %v315, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v317 = stablehlo.multiply %v311, %v314 : tensor<128x32x4x4xf32>
    %v318 = stablehlo.reduce(%v317 init: %v298) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v319 = stablehlo.broadcast_in_dim %v318, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v320 = stablehlo.multiply %v314, %v299 : tensor<128x32x4x4xf32>
    %v321 = stablehlo.subtract %v320, %v316 : tensor<128x32x4x4xf32>
    %v322 = stablehlo.multiply %v311, %v319 : tensor<128x32x4x4xf32>
    %v323 = stablehlo.subtract %v321, %v322 : tensor<128x32x4x4xf32>
    %v324 = stablehlo.divide %v310, %v299 : tensor<128x32x4x4xf32>
    %v325 = stablehlo.multiply %v324, %v323 : tensor<128x32x4x4xf32>
    %v326 = stablehlo.reshape %v325 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v327 = stablehlo.reshape %v326 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v328 = stablehlo.reverse %W8, dims = [2, 3] : tensor<32x32x3x3xf32>
    %v329 = stablehlo.transpose %v328, dims = [1, 0, 2, 3] : (tensor<32x32x3x3xf32>) -> tensor<32x32x3x3xf32>
    %v330 = stablehlo.convolution(%v327, %v329)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x32x4x4xf32>, tensor<32x32x3x3xf32>) -> tensor<128x32x4x4xf32>
    %v331 = stablehlo.reshape %v330 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v332 = stablehlo.reshape %v331 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v333 = stablehlo.reshape %v210 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v334 = stablehlo.constant dense<0.0> : tensor<128x32x4x4xf32>
    %v335 = stablehlo.compare GT, %v333, %v334 : (tensor<128x32x4x4xf32>, tensor<128x32x4x4xf32>) -> tensor<128x32x4x4xi1>
    %v336 = stablehlo.select %v335, %v332, %v334 : tensor<128x32x4x4xi1>, tensor<128x32x4x4xf32>
    %v337 = stablehlo.reshape %v336 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v338 = stablehlo.reshape %v190 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v339 = stablehlo.constant dense<0.0> : tensor<f32>
    %v340 = stablehlo.constant dense<2048.0> : tensor<128x32x4x4xf32>
    %v341 = stablehlo.constant dense<1.0e-05> : tensor<128x32x4x4xf32>
    %v342 = stablehlo.reduce(%v338 init: %v339) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v343 = stablehlo.broadcast_in_dim %v342, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v344 = stablehlo.divide %v343, %v340 : tensor<128x32x4x4xf32>
    %v345 = stablehlo.subtract %v338, %v344 : tensor<128x32x4x4xf32>
    %v346 = stablehlo.multiply %v345, %v345 : tensor<128x32x4x4xf32>
    %v347 = stablehlo.reduce(%v346 init: %v339) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v348 = stablehlo.broadcast_in_dim %v347, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v349 = stablehlo.divide %v348, %v340 : tensor<128x32x4x4xf32>
    %v350 = stablehlo.add %v349, %v341 : tensor<128x32x4x4xf32>
    %v351 = stablehlo.rsqrt %v350 : tensor<128x32x4x4xf32>
    %v352 = stablehlo.multiply %v345, %v351 : tensor<128x32x4x4xf32>
    %v353 = stablehlo.broadcast_in_dim %g7, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v354 = stablehlo.reshape %v337 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v355 = stablehlo.multiply %v353, %v354 : tensor<128x32x4x4xf32>
    %v356 = stablehlo.reduce(%v355 init: %v339) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v357 = stablehlo.broadcast_in_dim %v356, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v358 = stablehlo.multiply %v352, %v355 : tensor<128x32x4x4xf32>
    %v359 = stablehlo.reduce(%v358 init: %v339) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v360 = stablehlo.broadcast_in_dim %v359, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v361 = stablehlo.multiply %v355, %v340 : tensor<128x32x4x4xf32>
    %v362 = stablehlo.subtract %v361, %v357 : tensor<128x32x4x4xf32>
    %v363 = stablehlo.multiply %v352, %v360 : tensor<128x32x4x4xf32>
    %v364 = stablehlo.subtract %v362, %v363 : tensor<128x32x4x4xf32>
    %v365 = stablehlo.divide %v351, %v340 : tensor<128x32x4x4xf32>
    %v366 = stablehlo.multiply %v365, %v364 : tensor<128x32x4x4xf32>
    %v367 = stablehlo.reshape %v366 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v368 = stablehlo.reshape %v367 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v369 = stablehlo.reverse %W7, dims = [2, 3] : tensor<32x32x3x3xf32>
    %v370 = stablehlo.transpose %v369, dims = [1, 0, 2, 3] : (tensor<32x32x3x3xf32>) -> tensor<32x32x3x3xf32>
    %v371 = stablehlo.convolution(%v368, %v370)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x32x4x4xf32>, tensor<32x32x3x3xf32>) -> tensor<128x32x4x4xf32>
    %v372 = stablehlo.reshape %v371 : (tensor<128x32x4x4xf32>) -> tensor<128x512xf32>
    %v373 = stablehlo.reshape %v181 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v374 = stablehlo.reshape %v372 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v375 = stablehlo.constant dense<0.0> : tensor<f32>
    %v376 = "stablehlo.select_and_scatter"(%v373, %v374, %v375) ({
      ^bb0(%sa: tensor<f32>, %sb: tensor<f32>):
        %sge = stablehlo.compare GE, %sa, %sb : (tensor<f32>, tensor<f32>) -> tensor<i1>
        stablehlo.return %sge : tensor<i1>
    }, {
      ^bb0(%sc: tensor<f32>, %sd: tensor<f32>):
        %ss = stablehlo.add %sc, %sd : tensor<f32>
        stablehlo.return %ss : tensor<f32>
    }) {window_dimensions = array<i64: 1, 1, 2, 2>, window_strides = array<i64: 1, 1, 2, 2>} : (tensor<128x32x8x8xf32>, tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<128x32x8x8xf32>
    %v377 = stablehlo.reshape %v376 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v378 = stablehlo.reshape %v377 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v379 = stablehlo.reshape %v177 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v380 = stablehlo.constant dense<0.0> : tensor<128x32x8x8xf32>
    %v381 = stablehlo.compare GT, %v379, %v380 : (tensor<128x32x8x8xf32>, tensor<128x32x8x8xf32>) -> tensor<128x32x8x8xi1>
    %v382 = stablehlo.select %v381, %v378, %v380 : tensor<128x32x8x8xi1>, tensor<128x32x8x8xf32>
    %v383 = stablehlo.reshape %v382 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v384 = stablehlo.reshape %v157 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v385 = stablehlo.constant dense<0.0> : tensor<f32>
    %v386 = stablehlo.constant dense<8192.0> : tensor<128x32x8x8xf32>
    %v387 = stablehlo.constant dense<1.0e-05> : tensor<128x32x8x8xf32>
    %v388 = stablehlo.reduce(%v384 init: %v385) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v389 = stablehlo.broadcast_in_dim %v388, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v390 = stablehlo.divide %v389, %v386 : tensor<128x32x8x8xf32>
    %v391 = stablehlo.subtract %v384, %v390 : tensor<128x32x8x8xf32>
    %v392 = stablehlo.multiply %v391, %v391 : tensor<128x32x8x8xf32>
    %v393 = stablehlo.reduce(%v392 init: %v385) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v394 = stablehlo.broadcast_in_dim %v393, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v395 = stablehlo.divide %v394, %v386 : tensor<128x32x8x8xf32>
    %v396 = stablehlo.add %v395, %v387 : tensor<128x32x8x8xf32>
    %v397 = stablehlo.rsqrt %v396 : tensor<128x32x8x8xf32>
    %v398 = stablehlo.multiply %v391, %v397 : tensor<128x32x8x8xf32>
    %v399 = stablehlo.broadcast_in_dim %g6, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v400 = stablehlo.reshape %v383 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v401 = stablehlo.multiply %v399, %v400 : tensor<128x32x8x8xf32>
    %v402 = stablehlo.reduce(%v401 init: %v385) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v403 = stablehlo.broadcast_in_dim %v402, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v404 = stablehlo.multiply %v398, %v401 : tensor<128x32x8x8xf32>
    %v405 = stablehlo.reduce(%v404 init: %v385) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v406 = stablehlo.broadcast_in_dim %v405, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v407 = stablehlo.multiply %v401, %v386 : tensor<128x32x8x8xf32>
    %v408 = stablehlo.subtract %v407, %v403 : tensor<128x32x8x8xf32>
    %v409 = stablehlo.multiply %v398, %v406 : tensor<128x32x8x8xf32>
    %v410 = stablehlo.subtract %v408, %v409 : tensor<128x32x8x8xf32>
    %v411 = stablehlo.divide %v397, %v386 : tensor<128x32x8x8xf32>
    %v412 = stablehlo.multiply %v411, %v410 : tensor<128x32x8x8xf32>
    %v413 = stablehlo.reshape %v412 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v414 = stablehlo.reshape %v413 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v415 = stablehlo.reverse %W6, dims = [2, 3] : tensor<32x32x3x3xf32>
    %v416 = stablehlo.transpose %v415, dims = [1, 0, 2, 3] : (tensor<32x32x3x3xf32>) -> tensor<32x32x3x3xf32>
    %v417 = stablehlo.convolution(%v414, %v416)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x32x8x8xf32>, tensor<32x32x3x3xf32>) -> tensor<128x32x8x8xf32>
    %v418 = stablehlo.reshape %v417 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v419 = stablehlo.reshape %v418 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v420 = stablehlo.reshape %v148 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v421 = stablehlo.constant dense<0.0> : tensor<128x32x8x8xf32>
    %v422 = stablehlo.compare GT, %v420, %v421 : (tensor<128x32x8x8xf32>, tensor<128x32x8x8xf32>) -> tensor<128x32x8x8xi1>
    %v423 = stablehlo.select %v422, %v419, %v421 : tensor<128x32x8x8xi1>, tensor<128x32x8x8xf32>
    %v424 = stablehlo.reshape %v423 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v425 = stablehlo.reshape %v128 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v426 = stablehlo.constant dense<0.0> : tensor<f32>
    %v427 = stablehlo.constant dense<8192.0> : tensor<128x32x8x8xf32>
    %v428 = stablehlo.constant dense<1.0e-05> : tensor<128x32x8x8xf32>
    %v429 = stablehlo.reduce(%v425 init: %v426) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v430 = stablehlo.broadcast_in_dim %v429, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v431 = stablehlo.divide %v430, %v427 : tensor<128x32x8x8xf32>
    %v432 = stablehlo.subtract %v425, %v431 : tensor<128x32x8x8xf32>
    %v433 = stablehlo.multiply %v432, %v432 : tensor<128x32x8x8xf32>
    %v434 = stablehlo.reduce(%v433 init: %v426) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v435 = stablehlo.broadcast_in_dim %v434, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v436 = stablehlo.divide %v435, %v427 : tensor<128x32x8x8xf32>
    %v437 = stablehlo.add %v436, %v428 : tensor<128x32x8x8xf32>
    %v438 = stablehlo.rsqrt %v437 : tensor<128x32x8x8xf32>
    %v439 = stablehlo.multiply %v432, %v438 : tensor<128x32x8x8xf32>
    %v440 = stablehlo.broadcast_in_dim %g5, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v441 = stablehlo.reshape %v424 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v442 = stablehlo.multiply %v440, %v441 : tensor<128x32x8x8xf32>
    %v443 = stablehlo.reduce(%v442 init: %v426) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v444 = stablehlo.broadcast_in_dim %v443, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v445 = stablehlo.multiply %v439, %v442 : tensor<128x32x8x8xf32>
    %v446 = stablehlo.reduce(%v445 init: %v426) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v447 = stablehlo.broadcast_in_dim %v446, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v448 = stablehlo.multiply %v442, %v427 : tensor<128x32x8x8xf32>
    %v449 = stablehlo.subtract %v448, %v444 : tensor<128x32x8x8xf32>
    %v450 = stablehlo.multiply %v439, %v447 : tensor<128x32x8x8xf32>
    %v451 = stablehlo.subtract %v449, %v450 : tensor<128x32x8x8xf32>
    %v452 = stablehlo.divide %v438, %v427 : tensor<128x32x8x8xf32>
    %v453 = stablehlo.multiply %v452, %v451 : tensor<128x32x8x8xf32>
    %v454 = stablehlo.reshape %v453 : (tensor<128x32x8x8xf32>) -> tensor<128x2048xf32>
    %v455 = stablehlo.reshape %v454 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v456 = stablehlo.reverse %W5, dims = [2, 3] : tensor<32x16x3x3xf32>
    %v457 = stablehlo.transpose %v456, dims = [1, 0, 2, 3] : (tensor<32x16x3x3xf32>) -> tensor<16x32x3x3xf32>
    %v458 = stablehlo.convolution(%v455, %v457)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x32x8x8xf32>, tensor<16x32x3x3xf32>) -> tensor<128x16x8x8xf32>
    %v459 = stablehlo.reshape %v458 : (tensor<128x16x8x8xf32>) -> tensor<128x1024xf32>
    %v460 = stablehlo.reshape %v119 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v461 = stablehlo.reshape %v459 : (tensor<128x1024xf32>) -> tensor<128x16x8x8xf32>
    %v462 = stablehlo.constant dense<0.0> : tensor<f32>
    %v463 = "stablehlo.select_and_scatter"(%v460, %v461, %v462) ({
      ^bb0(%sa: tensor<f32>, %sb: tensor<f32>):
        %sge = stablehlo.compare GE, %sa, %sb : (tensor<f32>, tensor<f32>) -> tensor<i1>
        stablehlo.return %sge : tensor<i1>
    }, {
      ^bb0(%sc: tensor<f32>, %sd: tensor<f32>):
        %ss = stablehlo.add %sc, %sd : tensor<f32>
        stablehlo.return %ss : tensor<f32>
    }) {window_dimensions = array<i64: 1, 1, 2, 2>, window_strides = array<i64: 1, 1, 2, 2>} : (tensor<128x16x16x16xf32>, tensor<128x16x8x8xf32>, tensor<f32>) -> tensor<128x16x16x16xf32>
    %v464 = stablehlo.reshape %v463 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v465 = stablehlo.reshape %v464 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v466 = stablehlo.reshape %v115 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v467 = stablehlo.constant dense<0.0> : tensor<128x16x16x16xf32>
    %v468 = stablehlo.compare GT, %v466, %v467 : (tensor<128x16x16x16xf32>, tensor<128x16x16x16xf32>) -> tensor<128x16x16x16xi1>
    %v469 = stablehlo.select %v468, %v465, %v467 : tensor<128x16x16x16xi1>, tensor<128x16x16x16xf32>
    %v470 = stablehlo.reshape %v469 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v471 = stablehlo.reshape %v95 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v472 = stablehlo.constant dense<0.0> : tensor<f32>
    %v473 = stablehlo.constant dense<32768.0> : tensor<128x16x16x16xf32>
    %v474 = stablehlo.constant dense<1.0e-05> : tensor<128x16x16x16xf32>
    %v475 = stablehlo.reduce(%v471 init: %v472) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v476 = stablehlo.broadcast_in_dim %v475, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v477 = stablehlo.divide %v476, %v473 : tensor<128x16x16x16xf32>
    %v478 = stablehlo.subtract %v471, %v477 : tensor<128x16x16x16xf32>
    %v479 = stablehlo.multiply %v478, %v478 : tensor<128x16x16x16xf32>
    %v480 = stablehlo.reduce(%v479 init: %v472) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v481 = stablehlo.broadcast_in_dim %v480, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v482 = stablehlo.divide %v481, %v473 : tensor<128x16x16x16xf32>
    %v483 = stablehlo.add %v482, %v474 : tensor<128x16x16x16xf32>
    %v484 = stablehlo.rsqrt %v483 : tensor<128x16x16x16xf32>
    %v485 = stablehlo.multiply %v478, %v484 : tensor<128x16x16x16xf32>
    %v486 = stablehlo.broadcast_in_dim %g4, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v487 = stablehlo.reshape %v470 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v488 = stablehlo.multiply %v486, %v487 : tensor<128x16x16x16xf32>
    %v489 = stablehlo.reduce(%v488 init: %v472) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v490 = stablehlo.broadcast_in_dim %v489, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v491 = stablehlo.multiply %v485, %v488 : tensor<128x16x16x16xf32>
    %v492 = stablehlo.reduce(%v491 init: %v472) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v493 = stablehlo.broadcast_in_dim %v492, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v494 = stablehlo.multiply %v488, %v473 : tensor<128x16x16x16xf32>
    %v495 = stablehlo.subtract %v494, %v490 : tensor<128x16x16x16xf32>
    %v496 = stablehlo.multiply %v485, %v493 : tensor<128x16x16x16xf32>
    %v497 = stablehlo.subtract %v495, %v496 : tensor<128x16x16x16xf32>
    %v498 = stablehlo.divide %v484, %v473 : tensor<128x16x16x16xf32>
    %v499 = stablehlo.multiply %v498, %v497 : tensor<128x16x16x16xf32>
    %v500 = stablehlo.reshape %v499 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v501 = stablehlo.reshape %v500 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v502 = stablehlo.reverse %W4, dims = [2, 3] : tensor<16x16x3x3xf32>
    %v503 = stablehlo.transpose %v502, dims = [1, 0, 2, 3] : (tensor<16x16x3x3xf32>) -> tensor<16x16x3x3xf32>
    %v504 = stablehlo.convolution(%v501, %v503)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x16x16x16xf32>, tensor<16x16x3x3xf32>) -> tensor<128x16x16x16xf32>
    %v505 = stablehlo.reshape %v504 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v506 = stablehlo.reshape %v505 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v507 = stablehlo.reshape %v86 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v508 = stablehlo.constant dense<0.0> : tensor<128x16x16x16xf32>
    %v509 = stablehlo.compare GT, %v507, %v508 : (tensor<128x16x16x16xf32>, tensor<128x16x16x16xf32>) -> tensor<128x16x16x16xi1>
    %v510 = stablehlo.select %v509, %v506, %v508 : tensor<128x16x16x16xi1>, tensor<128x16x16x16xf32>
    %v511 = stablehlo.reshape %v510 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v512 = stablehlo.reshape %v66 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v513 = stablehlo.constant dense<0.0> : tensor<f32>
    %v514 = stablehlo.constant dense<32768.0> : tensor<128x16x16x16xf32>
    %v515 = stablehlo.constant dense<1.0e-05> : tensor<128x16x16x16xf32>
    %v516 = stablehlo.reduce(%v512 init: %v513) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v517 = stablehlo.broadcast_in_dim %v516, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v518 = stablehlo.divide %v517, %v514 : tensor<128x16x16x16xf32>
    %v519 = stablehlo.subtract %v512, %v518 : tensor<128x16x16x16xf32>
    %v520 = stablehlo.multiply %v519, %v519 : tensor<128x16x16x16xf32>
    %v521 = stablehlo.reduce(%v520 init: %v513) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v522 = stablehlo.broadcast_in_dim %v521, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v523 = stablehlo.divide %v522, %v514 : tensor<128x16x16x16xf32>
    %v524 = stablehlo.add %v523, %v515 : tensor<128x16x16x16xf32>
    %v525 = stablehlo.rsqrt %v524 : tensor<128x16x16x16xf32>
    %v526 = stablehlo.multiply %v519, %v525 : tensor<128x16x16x16xf32>
    %v527 = stablehlo.broadcast_in_dim %g3, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v528 = stablehlo.reshape %v511 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v529 = stablehlo.multiply %v527, %v528 : tensor<128x16x16x16xf32>
    %v530 = stablehlo.reduce(%v529 init: %v513) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v531 = stablehlo.broadcast_in_dim %v530, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v532 = stablehlo.multiply %v526, %v529 : tensor<128x16x16x16xf32>
    %v533 = stablehlo.reduce(%v532 init: %v513) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v534 = stablehlo.broadcast_in_dim %v533, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v535 = stablehlo.multiply %v529, %v514 : tensor<128x16x16x16xf32>
    %v536 = stablehlo.subtract %v535, %v531 : tensor<128x16x16x16xf32>
    %v537 = stablehlo.multiply %v526, %v534 : tensor<128x16x16x16xf32>
    %v538 = stablehlo.subtract %v536, %v537 : tensor<128x16x16x16xf32>
    %v539 = stablehlo.divide %v525, %v514 : tensor<128x16x16x16xf32>
    %v540 = stablehlo.multiply %v539, %v538 : tensor<128x16x16x16xf32>
    %v541 = stablehlo.reshape %v540 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v542 = stablehlo.reshape %v541 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v543 = stablehlo.reverse %W3, dims = [2, 3] : tensor<16x16x3x3xf32>
    %v544 = stablehlo.transpose %v543, dims = [1, 0, 2, 3] : (tensor<16x16x3x3xf32>) -> tensor<16x16x3x3xf32>
    %v545 = stablehlo.convolution(%v542, %v544)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x16x16x16xf32>, tensor<16x16x3x3xf32>) -> tensor<128x16x16x16xf32>
    %v546 = stablehlo.reshape %v545 : (tensor<128x16x16x16xf32>) -> tensor<128x4096xf32>
    %v547 = stablehlo.reshape %v57 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v548 = stablehlo.reshape %v546 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v549 = stablehlo.constant dense<0.0> : tensor<f32>
    %v550 = "stablehlo.select_and_scatter"(%v547, %v548, %v549) ({
      ^bb0(%sa: tensor<f32>, %sb: tensor<f32>):
        %sge = stablehlo.compare GE, %sa, %sb : (tensor<f32>, tensor<f32>) -> tensor<i1>
        stablehlo.return %sge : tensor<i1>
    }, {
      ^bb0(%sc: tensor<f32>, %sd: tensor<f32>):
        %ss = stablehlo.add %sc, %sd : tensor<f32>
        stablehlo.return %ss : tensor<f32>
    }) {window_dimensions = array<i64: 1, 1, 2, 2>, window_strides = array<i64: 1, 1, 2, 2>} : (tensor<128x16x32x32xf32>, tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<128x16x32x32xf32>
    %v551 = stablehlo.reshape %v550 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v552 = stablehlo.reshape %v551 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v553 = stablehlo.reshape %v53 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v554 = stablehlo.constant dense<0.0> : tensor<128x16x32x32xf32>
    %v555 = stablehlo.compare GT, %v553, %v554 : (tensor<128x16x32x32xf32>, tensor<128x16x32x32xf32>) -> tensor<128x16x32x32xi1>
    %v556 = stablehlo.select %v555, %v552, %v554 : tensor<128x16x32x32xi1>, tensor<128x16x32x32xf32>
    %v557 = stablehlo.reshape %v556 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v558 = stablehlo.reshape %v33 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v559 = stablehlo.constant dense<0.0> : tensor<f32>
    %v560 = stablehlo.constant dense<131072.0> : tensor<128x16x32x32xf32>
    %v561 = stablehlo.constant dense<1.0e-05> : tensor<128x16x32x32xf32>
    %v562 = stablehlo.reduce(%v558 init: %v559) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v563 = stablehlo.broadcast_in_dim %v562, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v564 = stablehlo.divide %v563, %v560 : tensor<128x16x32x32xf32>
    %v565 = stablehlo.subtract %v558, %v564 : tensor<128x16x32x32xf32>
    %v566 = stablehlo.multiply %v565, %v565 : tensor<128x16x32x32xf32>
    %v567 = stablehlo.reduce(%v566 init: %v559) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v568 = stablehlo.broadcast_in_dim %v567, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v569 = stablehlo.divide %v568, %v560 : tensor<128x16x32x32xf32>
    %v570 = stablehlo.add %v569, %v561 : tensor<128x16x32x32xf32>
    %v571 = stablehlo.rsqrt %v570 : tensor<128x16x32x32xf32>
    %v572 = stablehlo.multiply %v565, %v571 : tensor<128x16x32x32xf32>
    %v573 = stablehlo.broadcast_in_dim %g2, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v574 = stablehlo.reshape %v557 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v575 = stablehlo.multiply %v573, %v574 : tensor<128x16x32x32xf32>
    %v576 = stablehlo.reduce(%v575 init: %v559) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v577 = stablehlo.broadcast_in_dim %v576, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v578 = stablehlo.multiply %v572, %v575 : tensor<128x16x32x32xf32>
    %v579 = stablehlo.reduce(%v578 init: %v559) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v580 = stablehlo.broadcast_in_dim %v579, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v581 = stablehlo.multiply %v575, %v560 : tensor<128x16x32x32xf32>
    %v582 = stablehlo.subtract %v581, %v577 : tensor<128x16x32x32xf32>
    %v583 = stablehlo.multiply %v572, %v580 : tensor<128x16x32x32xf32>
    %v584 = stablehlo.subtract %v582, %v583 : tensor<128x16x32x32xf32>
    %v585 = stablehlo.divide %v571, %v560 : tensor<128x16x32x32xf32>
    %v586 = stablehlo.multiply %v585, %v584 : tensor<128x16x32x32xf32>
    %v587 = stablehlo.reshape %v586 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v588 = stablehlo.reshape %v587 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v589 = stablehlo.reverse %W2, dims = [2, 3] : tensor<16x16x3x3xf32>
    %v590 = stablehlo.transpose %v589, dims = [1, 0, 2, 3] : (tensor<16x16x3x3xf32>) -> tensor<16x16x3x3xf32>
    %v591 = stablehlo.convolution(%v588, %v590)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<128x16x32x32xf32>, tensor<16x16x3x3xf32>) -> tensor<128x16x32x32xf32>
    %v592 = stablehlo.reshape %v591 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v593 = stablehlo.reshape %v592 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v594 = stablehlo.reshape %v24 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v595 = stablehlo.constant dense<0.0> : tensor<128x16x32x32xf32>
    %v596 = stablehlo.compare GT, %v594, %v595 : (tensor<128x16x32x32xf32>, tensor<128x16x32x32xf32>) -> tensor<128x16x32x32xi1>
    %v597 = stablehlo.select %v596, %v593, %v595 : tensor<128x16x32x32xi1>, tensor<128x16x32x32xf32>
    %v598 = stablehlo.reshape %v597 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v599 = stablehlo.reshape %v4 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v600 = stablehlo.constant dense<0.0> : tensor<f32>
    %v601 = stablehlo.constant dense<131072.0> : tensor<128x16x32x32xf32>
    %v602 = stablehlo.constant dense<1.0e-05> : tensor<128x16x32x32xf32>
    %v603 = stablehlo.reduce(%v599 init: %v600) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v604 = stablehlo.broadcast_in_dim %v603, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v605 = stablehlo.divide %v604, %v601 : tensor<128x16x32x32xf32>
    %v606 = stablehlo.subtract %v599, %v605 : tensor<128x16x32x32xf32>
    %v607 = stablehlo.multiply %v606, %v606 : tensor<128x16x32x32xf32>
    %v608 = stablehlo.reduce(%v607 init: %v600) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v609 = stablehlo.broadcast_in_dim %v608, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v610 = stablehlo.divide %v609, %v601 : tensor<128x16x32x32xf32>
    %v611 = stablehlo.add %v610, %v602 : tensor<128x16x32x32xf32>
    %v612 = stablehlo.rsqrt %v611 : tensor<128x16x32x32xf32>
    %v613 = stablehlo.multiply %v606, %v612 : tensor<128x16x32x32xf32>
    %v614 = stablehlo.broadcast_in_dim %g1, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v615 = stablehlo.reshape %v598 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v616 = stablehlo.multiply %v614, %v615 : tensor<128x16x32x32xf32>
    %v617 = stablehlo.reduce(%v616 init: %v600) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v618 = stablehlo.broadcast_in_dim %v617, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v619 = stablehlo.multiply %v613, %v616 : tensor<128x16x32x32xf32>
    %v620 = stablehlo.reduce(%v619 init: %v600) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v621 = stablehlo.broadcast_in_dim %v620, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v622 = stablehlo.multiply %v616, %v601 : tensor<128x16x32x32xf32>
    %v623 = stablehlo.subtract %v622, %v618 : tensor<128x16x32x32xf32>
    %v624 = stablehlo.multiply %v613, %v621 : tensor<128x16x32x32xf32>
    %v625 = stablehlo.subtract %v623, %v624 : tensor<128x16x32x32xf32>
    %v626 = stablehlo.divide %v612, %v601 : tensor<128x16x32x32xf32>
    %v627 = stablehlo.multiply %v626, %v625 : tensor<128x16x32x32xf32>
    %v628 = stablehlo.reshape %v627 : (tensor<128x16x32x32xf32>) -> tensor<128x16384xf32>
    %v629 = stablehlo.reshape %x : (tensor<128x3072xf32>) -> tensor<128x3x32x32xf32>
    %v630 = stablehlo.reshape %v628 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v631 = stablehlo.transpose %v629, dims = [1, 0, 2, 3] : (tensor<128x3x32x32xf32>) -> tensor<3x128x32x32xf32>
    %v632 = stablehlo.transpose %v630, dims = [1, 0, 2, 3] : (tensor<128x16x32x32xf32>) -> tensor<16x128x32x32xf32>
    %v633 = stablehlo.convolution(%v631, %v632)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<3x128x32x32xf32>, tensor<16x128x32x32xf32>) -> tensor<3x16x3x3xf32>
    %v634 = stablehlo.transpose %v633, dims = [1, 0, 2, 3] : (tensor<3x16x3x3xf32>) -> tensor<16x3x3x3xf32>
    %v635 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16x3x3x3xf32>
    %v636 = stablehlo.multiply %v635, %v634 : tensor<16x3x3x3xf32>
    %v637 = stablehlo.subtract %W1, %v636 : tensor<16x3x3x3xf32>
    %v638 = stablehlo.reshape %v628 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v639 = stablehlo.constant dense<0.0> : tensor<f32>
    %v640 = stablehlo.reduce(%v638 init: %v639) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v641 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16xf32>
    %v642 = stablehlo.multiply %v641, %v640 : tensor<16xf32>
    %v643 = stablehlo.subtract %cb1, %v642 : tensor<16xf32>
    %v644 = stablehlo.reshape %v4 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v645 = stablehlo.constant dense<0.0> : tensor<f32>
    %v646 = stablehlo.constant dense<131072.0> : tensor<128x16x32x32xf32>
    %v647 = stablehlo.reduce(%v644 init: %v645) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v648 = stablehlo.broadcast_in_dim %v647, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v649 = stablehlo.divide %v648, %v646 : tensor<128x16x32x32xf32>
    %v650 = stablehlo.subtract %v644, %v649 : tensor<128x16x32x32xf32>
    %v651 = stablehlo.multiply %v650, %v650 : tensor<128x16x32x32xf32>
    %v652 = stablehlo.reduce(%v651 init: %v645) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v653 = stablehlo.broadcast_in_dim %v652, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v654 = stablehlo.divide %v653, %v646 : tensor<128x16x32x32xf32>
    %v655 = stablehlo.constant dense<1.0e-05> : tensor<128x16x32x32xf32>
    %v656 = stablehlo.add %v654, %v655 : tensor<128x16x32x32xf32>
    %v657 = stablehlo.rsqrt %v656 : tensor<128x16x32x32xf32>
    %v658 = stablehlo.multiply %v650, %v657 : tensor<128x16x32x32xf32>
    %v659 = stablehlo.reshape %v598 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v660 = stablehlo.multiply %v659, %v658 : tensor<128x16x32x32xf32>
    %v661 = stablehlo.reduce(%v660 init: %v645) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v662 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16xf32>
    %v663 = stablehlo.multiply %v662, %v661 : tensor<16xf32>
    %v664 = stablehlo.subtract %g1, %v663 : tensor<16xf32>
    %v665 = stablehlo.reshape %v598 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v666 = stablehlo.constant dense<0.0> : tensor<f32>
    %v667 = stablehlo.reduce(%v665 init: %v666) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v668 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16xf32>
    %v669 = stablehlo.multiply %v668, %v667 : tensor<16xf32>
    %v670 = stablehlo.subtract %bt1, %v669 : tensor<16xf32>
    %v671 = stablehlo.reshape %v28 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v672 = stablehlo.reshape %v587 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v673 = stablehlo.transpose %v671, dims = [1, 0, 2, 3] : (tensor<128x16x32x32xf32>) -> tensor<16x128x32x32xf32>
    %v674 = stablehlo.transpose %v672, dims = [1, 0, 2, 3] : (tensor<128x16x32x32xf32>) -> tensor<16x128x32x32xf32>
    %v675 = stablehlo.convolution(%v673, %v674)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<16x128x32x32xf32>, tensor<16x128x32x32xf32>) -> tensor<16x16x3x3xf32>
    %v676 = stablehlo.transpose %v675, dims = [1, 0, 2, 3] : (tensor<16x16x3x3xf32>) -> tensor<16x16x3x3xf32>
    %v677 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16x16x3x3xf32>
    %v678 = stablehlo.multiply %v677, %v676 : tensor<16x16x3x3xf32>
    %v679 = stablehlo.subtract %W2, %v678 : tensor<16x16x3x3xf32>
    %v680 = stablehlo.reshape %v587 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v681 = stablehlo.constant dense<0.0> : tensor<f32>
    %v682 = stablehlo.reduce(%v680 init: %v681) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v683 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16xf32>
    %v684 = stablehlo.multiply %v683, %v682 : tensor<16xf32>
    %v685 = stablehlo.subtract %cb2, %v684 : tensor<16xf32>
    %v686 = stablehlo.reshape %v33 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v687 = stablehlo.constant dense<0.0> : tensor<f32>
    %v688 = stablehlo.constant dense<131072.0> : tensor<128x16x32x32xf32>
    %v689 = stablehlo.reduce(%v686 init: %v687) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v690 = stablehlo.broadcast_in_dim %v689, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v691 = stablehlo.divide %v690, %v688 : tensor<128x16x32x32xf32>
    %v692 = stablehlo.subtract %v686, %v691 : tensor<128x16x32x32xf32>
    %v693 = stablehlo.multiply %v692, %v692 : tensor<128x16x32x32xf32>
    %v694 = stablehlo.reduce(%v693 init: %v687) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v695 = stablehlo.broadcast_in_dim %v694, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v696 = stablehlo.divide %v695, %v688 : tensor<128x16x32x32xf32>
    %v697 = stablehlo.constant dense<1.0e-05> : tensor<128x16x32x32xf32>
    %v698 = stablehlo.add %v696, %v697 : tensor<128x16x32x32xf32>
    %v699 = stablehlo.rsqrt %v698 : tensor<128x16x32x32xf32>
    %v700 = stablehlo.multiply %v692, %v699 : tensor<128x16x32x32xf32>
    %v701 = stablehlo.reshape %v557 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v702 = stablehlo.multiply %v701, %v700 : tensor<128x16x32x32xf32>
    %v703 = stablehlo.reduce(%v702 init: %v687) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v704 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16xf32>
    %v705 = stablehlo.multiply %v704, %v703 : tensor<16xf32>
    %v706 = stablehlo.subtract %g2, %v705 : tensor<16xf32>
    %v707 = stablehlo.reshape %v557 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v708 = stablehlo.constant dense<0.0> : tensor<f32>
    %v709 = stablehlo.reduce(%v707 init: %v708) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v710 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16xf32>
    %v711 = stablehlo.multiply %v710, %v709 : tensor<16xf32>
    %v712 = stablehlo.subtract %bt2, %v711 : tensor<16xf32>
    %v713 = stablehlo.reshape %v61 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v714 = stablehlo.reshape %v541 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v715 = stablehlo.transpose %v713, dims = [1, 0, 2, 3] : (tensor<128x16x16x16xf32>) -> tensor<16x128x16x16xf32>
    %v716 = stablehlo.transpose %v714, dims = [1, 0, 2, 3] : (tensor<128x16x16x16xf32>) -> tensor<16x128x16x16xf32>
    %v717 = stablehlo.convolution(%v715, %v716)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<16x128x16x16xf32>, tensor<16x128x16x16xf32>) -> tensor<16x16x3x3xf32>
    %v718 = stablehlo.transpose %v717, dims = [1, 0, 2, 3] : (tensor<16x16x3x3xf32>) -> tensor<16x16x3x3xf32>
    %v719 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16x16x3x3xf32>
    %v720 = stablehlo.multiply %v719, %v718 : tensor<16x16x3x3xf32>
    %v721 = stablehlo.subtract %W3, %v720 : tensor<16x16x3x3xf32>
    %v722 = stablehlo.reshape %v541 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v723 = stablehlo.constant dense<0.0> : tensor<f32>
    %v724 = stablehlo.reduce(%v722 init: %v723) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v725 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16xf32>
    %v726 = stablehlo.multiply %v725, %v724 : tensor<16xf32>
    %v727 = stablehlo.subtract %cb3, %v726 : tensor<16xf32>
    %v728 = stablehlo.reshape %v66 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v729 = stablehlo.constant dense<0.0> : tensor<f32>
    %v730 = stablehlo.constant dense<32768.0> : tensor<128x16x16x16xf32>
    %v731 = stablehlo.reduce(%v728 init: %v729) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v732 = stablehlo.broadcast_in_dim %v731, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v733 = stablehlo.divide %v732, %v730 : tensor<128x16x16x16xf32>
    %v734 = stablehlo.subtract %v728, %v733 : tensor<128x16x16x16xf32>
    %v735 = stablehlo.multiply %v734, %v734 : tensor<128x16x16x16xf32>
    %v736 = stablehlo.reduce(%v735 init: %v729) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v737 = stablehlo.broadcast_in_dim %v736, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v738 = stablehlo.divide %v737, %v730 : tensor<128x16x16x16xf32>
    %v739 = stablehlo.constant dense<1.0e-05> : tensor<128x16x16x16xf32>
    %v740 = stablehlo.add %v738, %v739 : tensor<128x16x16x16xf32>
    %v741 = stablehlo.rsqrt %v740 : tensor<128x16x16x16xf32>
    %v742 = stablehlo.multiply %v734, %v741 : tensor<128x16x16x16xf32>
    %v743 = stablehlo.reshape %v511 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v744 = stablehlo.multiply %v743, %v742 : tensor<128x16x16x16xf32>
    %v745 = stablehlo.reduce(%v744 init: %v729) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v746 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16xf32>
    %v747 = stablehlo.multiply %v746, %v745 : tensor<16xf32>
    %v748 = stablehlo.subtract %g3, %v747 : tensor<16xf32>
    %v749 = stablehlo.reshape %v511 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v750 = stablehlo.constant dense<0.0> : tensor<f32>
    %v751 = stablehlo.reduce(%v749 init: %v750) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v752 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16xf32>
    %v753 = stablehlo.multiply %v752, %v751 : tensor<16xf32>
    %v754 = stablehlo.subtract %bt3, %v753 : tensor<16xf32>
    %v755 = stablehlo.reshape %v90 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v756 = stablehlo.reshape %v500 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v757 = stablehlo.transpose %v755, dims = [1, 0, 2, 3] : (tensor<128x16x16x16xf32>) -> tensor<16x128x16x16xf32>
    %v758 = stablehlo.transpose %v756, dims = [1, 0, 2, 3] : (tensor<128x16x16x16xf32>) -> tensor<16x128x16x16xf32>
    %v759 = stablehlo.convolution(%v757, %v758)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<16x128x16x16xf32>, tensor<16x128x16x16xf32>) -> tensor<16x16x3x3xf32>
    %v760 = stablehlo.transpose %v759, dims = [1, 0, 2, 3] : (tensor<16x16x3x3xf32>) -> tensor<16x16x3x3xf32>
    %v761 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16x16x3x3xf32>
    %v762 = stablehlo.multiply %v761, %v760 : tensor<16x16x3x3xf32>
    %v763 = stablehlo.subtract %W4, %v762 : tensor<16x16x3x3xf32>
    %v764 = stablehlo.reshape %v500 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v765 = stablehlo.constant dense<0.0> : tensor<f32>
    %v766 = stablehlo.reduce(%v764 init: %v765) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v767 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16xf32>
    %v768 = stablehlo.multiply %v767, %v766 : tensor<16xf32>
    %v769 = stablehlo.subtract %cb4, %v768 : tensor<16xf32>
    %v770 = stablehlo.reshape %v95 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v771 = stablehlo.constant dense<0.0> : tensor<f32>
    %v772 = stablehlo.constant dense<32768.0> : tensor<128x16x16x16xf32>
    %v773 = stablehlo.reduce(%v770 init: %v771) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v774 = stablehlo.broadcast_in_dim %v773, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v775 = stablehlo.divide %v774, %v772 : tensor<128x16x16x16xf32>
    %v776 = stablehlo.subtract %v770, %v775 : tensor<128x16x16x16xf32>
    %v777 = stablehlo.multiply %v776, %v776 : tensor<128x16x16x16xf32>
    %v778 = stablehlo.reduce(%v777 init: %v771) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v779 = stablehlo.broadcast_in_dim %v778, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v780 = stablehlo.divide %v779, %v772 : tensor<128x16x16x16xf32>
    %v781 = stablehlo.constant dense<1.0e-05> : tensor<128x16x16x16xf32>
    %v782 = stablehlo.add %v780, %v781 : tensor<128x16x16x16xf32>
    %v783 = stablehlo.rsqrt %v782 : tensor<128x16x16x16xf32>
    %v784 = stablehlo.multiply %v776, %v783 : tensor<128x16x16x16xf32>
    %v785 = stablehlo.reshape %v470 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v786 = stablehlo.multiply %v785, %v784 : tensor<128x16x16x16xf32>
    %v787 = stablehlo.reduce(%v786 init: %v771) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v788 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16xf32>
    %v789 = stablehlo.multiply %v788, %v787 : tensor<16xf32>
    %v790 = stablehlo.subtract %g4, %v789 : tensor<16xf32>
    %v791 = stablehlo.reshape %v470 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v792 = stablehlo.constant dense<0.0> : tensor<f32>
    %v793 = stablehlo.reduce(%v791 init: %v792) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v794 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<16xf32>
    %v795 = stablehlo.multiply %v794, %v793 : tensor<16xf32>
    %v796 = stablehlo.subtract %bt4, %v795 : tensor<16xf32>
    %v797 = stablehlo.reshape %v123 : (tensor<128x1024xf32>) -> tensor<128x16x8x8xf32>
    %v798 = stablehlo.reshape %v454 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v799 = stablehlo.transpose %v797, dims = [1, 0, 2, 3] : (tensor<128x16x8x8xf32>) -> tensor<16x128x8x8xf32>
    %v800 = stablehlo.transpose %v798, dims = [1, 0, 2, 3] : (tensor<128x32x8x8xf32>) -> tensor<32x128x8x8xf32>
    %v801 = stablehlo.convolution(%v799, %v800)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<16x128x8x8xf32>, tensor<32x128x8x8xf32>) -> tensor<16x32x3x3xf32>
    %v802 = stablehlo.transpose %v801, dims = [1, 0, 2, 3] : (tensor<16x32x3x3xf32>) -> tensor<32x16x3x3xf32>
    %v803 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32x16x3x3xf32>
    %v804 = stablehlo.multiply %v803, %v802 : tensor<32x16x3x3xf32>
    %v805 = stablehlo.subtract %W5, %v804 : tensor<32x16x3x3xf32>
    %v806 = stablehlo.reshape %v454 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v807 = stablehlo.constant dense<0.0> : tensor<f32>
    %v808 = stablehlo.reduce(%v806 init: %v807) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v809 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32xf32>
    %v810 = stablehlo.multiply %v809, %v808 : tensor<32xf32>
    %v811 = stablehlo.subtract %cb5, %v810 : tensor<32xf32>
    %v812 = stablehlo.reshape %v128 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v813 = stablehlo.constant dense<0.0> : tensor<f32>
    %v814 = stablehlo.constant dense<8192.0> : tensor<128x32x8x8xf32>
    %v815 = stablehlo.reduce(%v812 init: %v813) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v816 = stablehlo.broadcast_in_dim %v815, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v817 = stablehlo.divide %v816, %v814 : tensor<128x32x8x8xf32>
    %v818 = stablehlo.subtract %v812, %v817 : tensor<128x32x8x8xf32>
    %v819 = stablehlo.multiply %v818, %v818 : tensor<128x32x8x8xf32>
    %v820 = stablehlo.reduce(%v819 init: %v813) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v821 = stablehlo.broadcast_in_dim %v820, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v822 = stablehlo.divide %v821, %v814 : tensor<128x32x8x8xf32>
    %v823 = stablehlo.constant dense<1.0e-05> : tensor<128x32x8x8xf32>
    %v824 = stablehlo.add %v822, %v823 : tensor<128x32x8x8xf32>
    %v825 = stablehlo.rsqrt %v824 : tensor<128x32x8x8xf32>
    %v826 = stablehlo.multiply %v818, %v825 : tensor<128x32x8x8xf32>
    %v827 = stablehlo.reshape %v424 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v828 = stablehlo.multiply %v827, %v826 : tensor<128x32x8x8xf32>
    %v829 = stablehlo.reduce(%v828 init: %v813) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v830 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32xf32>
    %v831 = stablehlo.multiply %v830, %v829 : tensor<32xf32>
    %v832 = stablehlo.subtract %g5, %v831 : tensor<32xf32>
    %v833 = stablehlo.reshape %v424 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v834 = stablehlo.constant dense<0.0> : tensor<f32>
    %v835 = stablehlo.reduce(%v833 init: %v834) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v836 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32xf32>
    %v837 = stablehlo.multiply %v836, %v835 : tensor<32xf32>
    %v838 = stablehlo.subtract %bt5, %v837 : tensor<32xf32>
    %v839 = stablehlo.reshape %v152 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v840 = stablehlo.reshape %v413 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v841 = stablehlo.transpose %v839, dims = [1, 0, 2, 3] : (tensor<128x32x8x8xf32>) -> tensor<32x128x8x8xf32>
    %v842 = stablehlo.transpose %v840, dims = [1, 0, 2, 3] : (tensor<128x32x8x8xf32>) -> tensor<32x128x8x8xf32>
    %v843 = stablehlo.convolution(%v841, %v842)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<32x128x8x8xf32>, tensor<32x128x8x8xf32>) -> tensor<32x32x3x3xf32>
    %v844 = stablehlo.transpose %v843, dims = [1, 0, 2, 3] : (tensor<32x32x3x3xf32>) -> tensor<32x32x3x3xf32>
    %v845 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32x32x3x3xf32>
    %v846 = stablehlo.multiply %v845, %v844 : tensor<32x32x3x3xf32>
    %v847 = stablehlo.subtract %W6, %v846 : tensor<32x32x3x3xf32>
    %v848 = stablehlo.reshape %v413 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v849 = stablehlo.constant dense<0.0> : tensor<f32>
    %v850 = stablehlo.reduce(%v848 init: %v849) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v851 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32xf32>
    %v852 = stablehlo.multiply %v851, %v850 : tensor<32xf32>
    %v853 = stablehlo.subtract %cb6, %v852 : tensor<32xf32>
    %v854 = stablehlo.reshape %v157 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v855 = stablehlo.constant dense<0.0> : tensor<f32>
    %v856 = stablehlo.constant dense<8192.0> : tensor<128x32x8x8xf32>
    %v857 = stablehlo.reduce(%v854 init: %v855) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v858 = stablehlo.broadcast_in_dim %v857, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v859 = stablehlo.divide %v858, %v856 : tensor<128x32x8x8xf32>
    %v860 = stablehlo.subtract %v854, %v859 : tensor<128x32x8x8xf32>
    %v861 = stablehlo.multiply %v860, %v860 : tensor<128x32x8x8xf32>
    %v862 = stablehlo.reduce(%v861 init: %v855) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v863 = stablehlo.broadcast_in_dim %v862, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v864 = stablehlo.divide %v863, %v856 : tensor<128x32x8x8xf32>
    %v865 = stablehlo.constant dense<1.0e-05> : tensor<128x32x8x8xf32>
    %v866 = stablehlo.add %v864, %v865 : tensor<128x32x8x8xf32>
    %v867 = stablehlo.rsqrt %v866 : tensor<128x32x8x8xf32>
    %v868 = stablehlo.multiply %v860, %v867 : tensor<128x32x8x8xf32>
    %v869 = stablehlo.reshape %v383 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v870 = stablehlo.multiply %v869, %v868 : tensor<128x32x8x8xf32>
    %v871 = stablehlo.reduce(%v870 init: %v855) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v872 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32xf32>
    %v873 = stablehlo.multiply %v872, %v871 : tensor<32xf32>
    %v874 = stablehlo.subtract %g6, %v873 : tensor<32xf32>
    %v875 = stablehlo.reshape %v383 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v876 = stablehlo.constant dense<0.0> : tensor<f32>
    %v877 = stablehlo.reduce(%v875 init: %v876) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v878 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32xf32>
    %v879 = stablehlo.multiply %v878, %v877 : tensor<32xf32>
    %v880 = stablehlo.subtract %bt6, %v879 : tensor<32xf32>
    %v881 = stablehlo.reshape %v185 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v882 = stablehlo.reshape %v367 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v883 = stablehlo.transpose %v881, dims = [1, 0, 2, 3] : (tensor<128x32x4x4xf32>) -> tensor<32x128x4x4xf32>
    %v884 = stablehlo.transpose %v882, dims = [1, 0, 2, 3] : (tensor<128x32x4x4xf32>) -> tensor<32x128x4x4xf32>
    %v885 = stablehlo.convolution(%v883, %v884)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<32x128x4x4xf32>, tensor<32x128x4x4xf32>) -> tensor<32x32x3x3xf32>
    %v886 = stablehlo.transpose %v885, dims = [1, 0, 2, 3] : (tensor<32x32x3x3xf32>) -> tensor<32x32x3x3xf32>
    %v887 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32x32x3x3xf32>
    %v888 = stablehlo.multiply %v887, %v886 : tensor<32x32x3x3xf32>
    %v889 = stablehlo.subtract %W7, %v888 : tensor<32x32x3x3xf32>
    %v890 = stablehlo.reshape %v367 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v891 = stablehlo.constant dense<0.0> : tensor<f32>
    %v892 = stablehlo.reduce(%v890 init: %v891) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v893 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32xf32>
    %v894 = stablehlo.multiply %v893, %v892 : tensor<32xf32>
    %v895 = stablehlo.subtract %cb7, %v894 : tensor<32xf32>
    %v896 = stablehlo.reshape %v190 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v897 = stablehlo.constant dense<0.0> : tensor<f32>
    %v898 = stablehlo.constant dense<2048.0> : tensor<128x32x4x4xf32>
    %v899 = stablehlo.reduce(%v896 init: %v897) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v900 = stablehlo.broadcast_in_dim %v899, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v901 = stablehlo.divide %v900, %v898 : tensor<128x32x4x4xf32>
    %v902 = stablehlo.subtract %v896, %v901 : tensor<128x32x4x4xf32>
    %v903 = stablehlo.multiply %v902, %v902 : tensor<128x32x4x4xf32>
    %v904 = stablehlo.reduce(%v903 init: %v897) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v905 = stablehlo.broadcast_in_dim %v904, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v906 = stablehlo.divide %v905, %v898 : tensor<128x32x4x4xf32>
    %v907 = stablehlo.constant dense<1.0e-05> : tensor<128x32x4x4xf32>
    %v908 = stablehlo.add %v906, %v907 : tensor<128x32x4x4xf32>
    %v909 = stablehlo.rsqrt %v908 : tensor<128x32x4x4xf32>
    %v910 = stablehlo.multiply %v902, %v909 : tensor<128x32x4x4xf32>
    %v911 = stablehlo.reshape %v337 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v912 = stablehlo.multiply %v911, %v910 : tensor<128x32x4x4xf32>
    %v913 = stablehlo.reduce(%v912 init: %v897) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v914 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32xf32>
    %v915 = stablehlo.multiply %v914, %v913 : tensor<32xf32>
    %v916 = stablehlo.subtract %g7, %v915 : tensor<32xf32>
    %v917 = stablehlo.reshape %v337 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v918 = stablehlo.constant dense<0.0> : tensor<f32>
    %v919 = stablehlo.reduce(%v917 init: %v918) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v920 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32xf32>
    %v921 = stablehlo.multiply %v920, %v919 : tensor<32xf32>
    %v922 = stablehlo.subtract %bt7, %v921 : tensor<32xf32>
    %v923 = stablehlo.reshape %v214 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v924 = stablehlo.reshape %v326 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v925 = stablehlo.transpose %v923, dims = [1, 0, 2, 3] : (tensor<128x32x4x4xf32>) -> tensor<32x128x4x4xf32>
    %v926 = stablehlo.transpose %v924, dims = [1, 0, 2, 3] : (tensor<128x32x4x4xf32>) -> tensor<32x128x4x4xf32>
    %v927 = stablehlo.convolution(%v925, %v926)
      dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1],
      window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]}
      {batch_group_count = 1 : i64, feature_group_count = 1 : i64} : (tensor<32x128x4x4xf32>, tensor<32x128x4x4xf32>) -> tensor<32x32x3x3xf32>
    %v928 = stablehlo.transpose %v927, dims = [1, 0, 2, 3] : (tensor<32x32x3x3xf32>) -> tensor<32x32x3x3xf32>
    %v929 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32x32x3x3xf32>
    %v930 = stablehlo.multiply %v929, %v928 : tensor<32x32x3x3xf32>
    %v931 = stablehlo.subtract %W8, %v930 : tensor<32x32x3x3xf32>
    %v932 = stablehlo.reshape %v326 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v933 = stablehlo.constant dense<0.0> : tensor<f32>
    %v934 = stablehlo.reduce(%v932 init: %v933) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v935 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32xf32>
    %v936 = stablehlo.multiply %v935, %v934 : tensor<32xf32>
    %v937 = stablehlo.subtract %cb8, %v936 : tensor<32xf32>
    %v938 = stablehlo.reshape %v219 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v939 = stablehlo.constant dense<0.0> : tensor<f32>
    %v940 = stablehlo.constant dense<2048.0> : tensor<128x32x4x4xf32>
    %v941 = stablehlo.reduce(%v938 init: %v939) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v942 = stablehlo.broadcast_in_dim %v941, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v943 = stablehlo.divide %v942, %v940 : tensor<128x32x4x4xf32>
    %v944 = stablehlo.subtract %v938, %v943 : tensor<128x32x4x4xf32>
    %v945 = stablehlo.multiply %v944, %v944 : tensor<128x32x4x4xf32>
    %v946 = stablehlo.reduce(%v945 init: %v939) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v947 = stablehlo.broadcast_in_dim %v946, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v948 = stablehlo.divide %v947, %v940 : tensor<128x32x4x4xf32>
    %v949 = stablehlo.constant dense<1.0e-05> : tensor<128x32x4x4xf32>
    %v950 = stablehlo.add %v948, %v949 : tensor<128x32x4x4xf32>
    %v951 = stablehlo.rsqrt %v950 : tensor<128x32x4x4xf32>
    %v952 = stablehlo.multiply %v944, %v951 : tensor<128x32x4x4xf32>
    %v953 = stablehlo.reshape %v296 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v954 = stablehlo.multiply %v953, %v952 : tensor<128x32x4x4xf32>
    %v955 = stablehlo.reduce(%v954 init: %v939) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v956 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32xf32>
    %v957 = stablehlo.multiply %v956, %v955 : tensor<32xf32>
    %v958 = stablehlo.subtract %g8, %v957 : tensor<32xf32>
    %v959 = stablehlo.reshape %v296 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v960 = stablehlo.constant dense<0.0> : tensor<f32>
    %v961 = stablehlo.reduce(%v959 init: %v960) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v962 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<32xf32>
    %v963 = stablehlo.multiply %v962, %v961 : tensor<32xf32>
    %v964 = stablehlo.subtract %bt8, %v963 : tensor<32xf32>
    %v965 = stablehlo.dot_general %v247, %v282, contracting_dims = [0] x [0], precision = [DEFAULT, DEFAULT] : (tensor<128x128xf32>, tensor<128x512xf32>) -> tensor<128x512xf32>
    %v966 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<128x512xf32>
    %v967 = stablehlo.multiply %v966, %v965 : tensor<128x512xf32>
    %v968 = stablehlo.subtract %W9, %v967 : tensor<128x512xf32>
    %v969 = stablehlo.constant dense<0.0> : tensor<f32>
    %v970 = stablehlo.reduce(%v282 init: %v969) applies stablehlo.add across dimensions = [0] : (tensor<128x512xf32>, tensor<f32>) -> tensor<512xf32>
    %v971 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<512xf32>
    %v972 = stablehlo.multiply %v971, %v970 : tensor<512xf32>
    %v973 = stablehlo.subtract %b9, %v972 : tensor<512xf32>
    %v974 = stablehlo.dot_general %v252, %v276, contracting_dims = [0] x [0], precision = [DEFAULT, DEFAULT] : (tensor<128x512xf32>, tensor<128x512xf32>) -> tensor<512x512xf32>
    %v975 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<512x512xf32>
    %v976 = stablehlo.multiply %v975, %v974 : tensor<512x512xf32>
    %v977 = stablehlo.subtract %Wa, %v976 : tensor<512x512xf32>
    %v978 = stablehlo.constant dense<0.0> : tensor<f32>
    %v979 = stablehlo.reduce(%v276 init: %v978) applies stablehlo.add across dimensions = [0] : (tensor<128x512xf32>, tensor<f32>) -> tensor<512xf32>
    %v980 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<512xf32>
    %v981 = stablehlo.multiply %v980, %v979 : tensor<512xf32>
    %v982 = stablehlo.subtract %ba, %v981 : tensor<512xf32>
    %v983 = stablehlo.dot_general %v257, %v270, contracting_dims = [0] x [0], precision = [DEFAULT, DEFAULT] : (tensor<128x512xf32>, tensor<128x10xf32>) -> tensor<512x10xf32>
    %v984 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<512x10xf32>
    %v985 = stablehlo.multiply %v984, %v983 : tensor<512x10xf32>
    %v986 = stablehlo.subtract %Wb, %v985 : tensor<512x10xf32>
    %v987 = stablehlo.constant dense<0.0> : tensor<f32>
    %v988 = stablehlo.reduce(%v270 init: %v987) applies stablehlo.add across dimensions = [0] : (tensor<128x10xf32>, tensor<f32>) -> tensor<10xf32>
    %v989 = stablehlo.broadcast_in_dim %lr, dims = [] : (tensor<f32>) -> tensor<10xf32>
    %v990 = stablehlo.multiply %v989, %v988 : tensor<10xf32>
    %v991 = stablehlo.subtract %bb, %v990 : tensor<10xf32>
    %v992 = stablehlo.reshape %v4 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v993 = stablehlo.constant dense<0.0> : tensor<f32>
    %v994 = stablehlo.constant dense<131072.0> : tensor<16xf32>
    %v995 = stablehlo.reduce(%v992 init: %v993) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v996 = stablehlo.divide %v995, %v994 : tensor<16xf32>
    %v997 = stablehlo.reshape %v4 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v998 = stablehlo.constant dense<0.0> : tensor<f32>
    %v999 = stablehlo.constant dense<131072.0> : tensor<128x16x32x32xf32>
    %v1000 = stablehlo.reduce(%v997 init: %v998) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v1001 = stablehlo.broadcast_in_dim %v1000, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v1002 = stablehlo.divide %v1001, %v999 : tensor<128x16x32x32xf32>
    %v1003 = stablehlo.subtract %v997, %v1002 : tensor<128x16x32x32xf32>
    %v1004 = stablehlo.multiply %v1003, %v1003 : tensor<128x16x32x32xf32>
    %v1005 = stablehlo.reduce(%v1004 init: %v998) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v1006 = stablehlo.constant dense<131072.0> : tensor<16xf32>
    %v1007 = stablehlo.divide %v1005, %v1006 : tensor<16xf32>
    %v1008 = stablehlo.reshape %v33 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v1009 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1010 = stablehlo.constant dense<131072.0> : tensor<16xf32>
    %v1011 = stablehlo.reduce(%v1008 init: %v1009) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v1012 = stablehlo.divide %v1011, %v1010 : tensor<16xf32>
    %v1013 = stablehlo.reshape %v33 : (tensor<128x16384xf32>) -> tensor<128x16x32x32xf32>
    %v1014 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1015 = stablehlo.constant dense<131072.0> : tensor<128x16x32x32xf32>
    %v1016 = stablehlo.reduce(%v1013 init: %v1014) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v1017 = stablehlo.broadcast_in_dim %v1016, dims = [1] : (tensor<16xf32>) -> tensor<128x16x32x32xf32>
    %v1018 = stablehlo.divide %v1017, %v1015 : tensor<128x16x32x32xf32>
    %v1019 = stablehlo.subtract %v1013, %v1018 : tensor<128x16x32x32xf32>
    %v1020 = stablehlo.multiply %v1019, %v1019 : tensor<128x16x32x32xf32>
    %v1021 = stablehlo.reduce(%v1020 init: %v1014) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x32x32xf32>, tensor<f32>) -> tensor<16xf32>
    %v1022 = stablehlo.constant dense<131072.0> : tensor<16xf32>
    %v1023 = stablehlo.divide %v1021, %v1022 : tensor<16xf32>
    %v1024 = stablehlo.reshape %v66 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v1025 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1026 = stablehlo.constant dense<32768.0> : tensor<16xf32>
    %v1027 = stablehlo.reduce(%v1024 init: %v1025) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v1028 = stablehlo.divide %v1027, %v1026 : tensor<16xf32>
    %v1029 = stablehlo.reshape %v66 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v1030 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1031 = stablehlo.constant dense<32768.0> : tensor<128x16x16x16xf32>
    %v1032 = stablehlo.reduce(%v1029 init: %v1030) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v1033 = stablehlo.broadcast_in_dim %v1032, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v1034 = stablehlo.divide %v1033, %v1031 : tensor<128x16x16x16xf32>
    %v1035 = stablehlo.subtract %v1029, %v1034 : tensor<128x16x16x16xf32>
    %v1036 = stablehlo.multiply %v1035, %v1035 : tensor<128x16x16x16xf32>
    %v1037 = stablehlo.reduce(%v1036 init: %v1030) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v1038 = stablehlo.constant dense<32768.0> : tensor<16xf32>
    %v1039 = stablehlo.divide %v1037, %v1038 : tensor<16xf32>
    %v1040 = stablehlo.reshape %v95 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v1041 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1042 = stablehlo.constant dense<32768.0> : tensor<16xf32>
    %v1043 = stablehlo.reduce(%v1040 init: %v1041) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v1044 = stablehlo.divide %v1043, %v1042 : tensor<16xf32>
    %v1045 = stablehlo.reshape %v95 : (tensor<128x4096xf32>) -> tensor<128x16x16x16xf32>
    %v1046 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1047 = stablehlo.constant dense<32768.0> : tensor<128x16x16x16xf32>
    %v1048 = stablehlo.reduce(%v1045 init: %v1046) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v1049 = stablehlo.broadcast_in_dim %v1048, dims = [1] : (tensor<16xf32>) -> tensor<128x16x16x16xf32>
    %v1050 = stablehlo.divide %v1049, %v1047 : tensor<128x16x16x16xf32>
    %v1051 = stablehlo.subtract %v1045, %v1050 : tensor<128x16x16x16xf32>
    %v1052 = stablehlo.multiply %v1051, %v1051 : tensor<128x16x16x16xf32>
    %v1053 = stablehlo.reduce(%v1052 init: %v1046) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x16x16x16xf32>, tensor<f32>) -> tensor<16xf32>
    %v1054 = stablehlo.constant dense<32768.0> : tensor<16xf32>
    %v1055 = stablehlo.divide %v1053, %v1054 : tensor<16xf32>
    %v1056 = stablehlo.reshape %v128 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v1057 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1058 = stablehlo.constant dense<8192.0> : tensor<32xf32>
    %v1059 = stablehlo.reduce(%v1056 init: %v1057) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v1060 = stablehlo.divide %v1059, %v1058 : tensor<32xf32>
    %v1061 = stablehlo.reshape %v128 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v1062 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1063 = stablehlo.constant dense<8192.0> : tensor<128x32x8x8xf32>
    %v1064 = stablehlo.reduce(%v1061 init: %v1062) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v1065 = stablehlo.broadcast_in_dim %v1064, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v1066 = stablehlo.divide %v1065, %v1063 : tensor<128x32x8x8xf32>
    %v1067 = stablehlo.subtract %v1061, %v1066 : tensor<128x32x8x8xf32>
    %v1068 = stablehlo.multiply %v1067, %v1067 : tensor<128x32x8x8xf32>
    %v1069 = stablehlo.reduce(%v1068 init: %v1062) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v1070 = stablehlo.constant dense<8192.0> : tensor<32xf32>
    %v1071 = stablehlo.divide %v1069, %v1070 : tensor<32xf32>
    %v1072 = stablehlo.reshape %v157 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v1073 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1074 = stablehlo.constant dense<8192.0> : tensor<32xf32>
    %v1075 = stablehlo.reduce(%v1072 init: %v1073) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v1076 = stablehlo.divide %v1075, %v1074 : tensor<32xf32>
    %v1077 = stablehlo.reshape %v157 : (tensor<128x2048xf32>) -> tensor<128x32x8x8xf32>
    %v1078 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1079 = stablehlo.constant dense<8192.0> : tensor<128x32x8x8xf32>
    %v1080 = stablehlo.reduce(%v1077 init: %v1078) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v1081 = stablehlo.broadcast_in_dim %v1080, dims = [1] : (tensor<32xf32>) -> tensor<128x32x8x8xf32>
    %v1082 = stablehlo.divide %v1081, %v1079 : tensor<128x32x8x8xf32>
    %v1083 = stablehlo.subtract %v1077, %v1082 : tensor<128x32x8x8xf32>
    %v1084 = stablehlo.multiply %v1083, %v1083 : tensor<128x32x8x8xf32>
    %v1085 = stablehlo.reduce(%v1084 init: %v1078) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x8x8xf32>, tensor<f32>) -> tensor<32xf32>
    %v1086 = stablehlo.constant dense<8192.0> : tensor<32xf32>
    %v1087 = stablehlo.divide %v1085, %v1086 : tensor<32xf32>
    %v1088 = stablehlo.reshape %v190 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v1089 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1090 = stablehlo.constant dense<2048.0> : tensor<32xf32>
    %v1091 = stablehlo.reduce(%v1088 init: %v1089) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v1092 = stablehlo.divide %v1091, %v1090 : tensor<32xf32>
    %v1093 = stablehlo.reshape %v190 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v1094 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1095 = stablehlo.constant dense<2048.0> : tensor<128x32x4x4xf32>
    %v1096 = stablehlo.reduce(%v1093 init: %v1094) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v1097 = stablehlo.broadcast_in_dim %v1096, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v1098 = stablehlo.divide %v1097, %v1095 : tensor<128x32x4x4xf32>
    %v1099 = stablehlo.subtract %v1093, %v1098 : tensor<128x32x4x4xf32>
    %v1100 = stablehlo.multiply %v1099, %v1099 : tensor<128x32x4x4xf32>
    %v1101 = stablehlo.reduce(%v1100 init: %v1094) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v1102 = stablehlo.constant dense<2048.0> : tensor<32xf32>
    %v1103 = stablehlo.divide %v1101, %v1102 : tensor<32xf32>
    %v1104 = stablehlo.reshape %v219 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v1105 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1106 = stablehlo.constant dense<2048.0> : tensor<32xf32>
    %v1107 = stablehlo.reduce(%v1104 init: %v1105) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v1108 = stablehlo.divide %v1107, %v1106 : tensor<32xf32>
    %v1109 = stablehlo.reshape %v219 : (tensor<128x512xf32>) -> tensor<128x32x4x4xf32>
    %v1110 = stablehlo.constant dense<0.0> : tensor<f32>
    %v1111 = stablehlo.constant dense<2048.0> : tensor<128x32x4x4xf32>
    %v1112 = stablehlo.reduce(%v1109 init: %v1110) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v1113 = stablehlo.broadcast_in_dim %v1112, dims = [1] : (tensor<32xf32>) -> tensor<128x32x4x4xf32>
    %v1114 = stablehlo.divide %v1113, %v1111 : tensor<128x32x4x4xf32>
    %v1115 = stablehlo.subtract %v1109, %v1114 : tensor<128x32x4x4xf32>
    %v1116 = stablehlo.multiply %v1115, %v1115 : tensor<128x32x4x4xf32>
    %v1117 = stablehlo.reduce(%v1116 init: %v1110) applies stablehlo.add across dimensions = [0, 2, 3] : (tensor<128x32x4x4xf32>, tensor<f32>) -> tensor<32xf32>
    %v1118 = stablehlo.constant dense<2048.0> : tensor<32xf32>
    %v1119 = stablehlo.divide %v1117, %v1118 : tensor<32xf32>
    return %v637, %v643, %v664, %v670, %v679, %v685, %v706, %v712, %v721, %v727, %v748, %v754, %v763, %v769, %v790, %v796, %v805, %v811, %v832, %v838, %v847, %v853, %v874, %v880, %v889, %v895, %v916, %v922, %v931, %v937, %v958, %v964, %v968, %v973, %v977, %v982, %v986, %v991, %W1m, %cb1m, %g1m, %bt1m, %W2m, %cb2m, %g2m, %bt2m, %W3m, %cb3m, %g3m, %bt3m, %W4m, %cb4m, %g4m, %bt4m, %W5m, %cb5m, %g5m, %bt5m, %W6m, %cb6m, %g6m, %bt6m, %W7m, %cb7m, %g7m, %bt7m, %W8m, %cb8m, %g8m, %bt8m, %W9m, %b9m, %Wam, %bam, %Wbm, %bbm, %W1v, %cb1v, %g1v, %bt1v, %W2v, %cb2v, %g2v, %bt2v, %W3v, %cb3v, %g3v, %bt3v, %W4v, %cb4v, %g4v, %bt4v, %W5v, %cb5v, %g5v, %bt5v, %W6v, %cb6v, %g6v, %bt6v, %W7v, %cb7v, %g7v, %bt7v, %W8v, %cb8v, %g8v, %bt8v, %W9v, %b9v, %Wav, %bav, %Wbv, %bbv, %loss, %bc1, %bc2, %v996, %v1007, %v1012, %v1023, %v1028, %v1039, %v1044, %v1055, %v1060, %v1071, %v1076, %v1087, %v1092, %v1103, %v1108, %v1119 : tensor<16x3x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<32x16x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<128x512xf32>, tensor<512xf32>, tensor<512x512xf32>, tensor<512xf32>, tensor<512x10xf32>, tensor<10xf32>, tensor<16x3x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<32x16x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<128x512xf32>, tensor<512xf32>, tensor<512x512xf32>, tensor<512xf32>, tensor<512x10xf32>, tensor<10xf32>, tensor<16x3x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16x16x3x3xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<32x16x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32x32x3x3xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<128x512xf32>, tensor<512xf32>, tensor<512x512xf32>, tensor<512xf32>, tensor<512x10xf32>, tensor<10xf32>, tensor<f32>, tensor<f32>, tensor<f32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<16xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>, tensor<32xf32>
  }
}
