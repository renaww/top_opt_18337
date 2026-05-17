
// Units: SI, meters

SetFactory("Built-in");

// Mesh controls

lc = 0.015;         // fixed mesh size, 1.5 cm

thick = 0.080;      // 8 cm thick 3D geometry
z0 = -thick/2;
z1 =  thick/2;

// Patch size along boundary.
// 0.03 m = 3 cm local load/support patch.
patch = 0.030;

// Front face points, z = -thick/2
// Original Fig. 9 coordinates converted from cm to m
// plus extra points that split local BC/load patches.

// Main original points
Point(1) = {-0.40, 0.072, z0, lc};  // left pin/support, (-40, 7.2)
Point(2) = {-0.40, 0.510, z0, lc};  // upper-left boundary
Point(3) = {-0.15, 0.510, z0, lc};  // top-left load, (-15, 51)
Point(4) = { 0.40, 0.540, z0, lc};  // top-right load, (40, 54)
Point(5) = { 0.42, 0.435, z0, lc};  // upper pin/support, (42, 43.5)
Point(6) = { 0.37, 0.370, z0, lc};  // curved-boundary point, (37, 37)
Point(7) = { 0.300, 0.270, z0, lc};
Point(8) = { 0.210, 0.125, z0, lc};
Point(9) = { 0.000, 0.000, z0, lc}; // bottom load, (0, 0)

// Extra patch-splitting points
Point(10) = {-0.40, 0.102, z0, lc};        // above left pin, local patch end

Point(11) = {-0.180, 0.510, z0, lc};       // left of top-left load
Point(12) = {-0.120, 0.51164, z0, lc};     // right of top-left load along top edge

Point(13) = { 0.370, 0.53836, z0, lc};     // left of top-right load
Point(14) = { 0.40561, 0.51053, z0, lc};   // below top-right load along slanted edge

Point(15) = { 0.41439, 0.46447, z0, lc};   // above upper pin
Point(16) = { 0.40171, 0.41121, z0, lc};   // below upper pin

Point(17) = {-0.02953, 0.00532, z0, lc};   // near bottom load along bottom edge

// Back face points, z = +thick/2

Point(101) = {-0.40, 0.072, z1, lc};
Point(102) = {-0.40, 0.510, z1, lc};
Point(103) = {-0.15, 0.510, z1, lc};
Point(104) = { 0.40, 0.540, z1, lc};
Point(105) = { 0.42, 0.435, z1, lc};
Point(106) = { 0.37, 0.370, z1, lc};
Point(107) = { 0.300, 0.270, z1, lc};
Point(108) = { 0.210, 0.125, z1, lc};
Point(109) = { 0.000, 0.000, z1, lc};

Point(110) = {-0.40, 0.102, z1, lc};

Point(111) = {-0.180, 0.510, z1, lc};
Point(112) = {-0.120, 0.51164, z1, lc};

Point(113) = { 0.370, 0.53836, z1, lc};
Point(114) = { 0.40561, 0.51053, z1, lc};

Point(115) = { 0.41439, 0.46447, z1, lc};
Point(116) = { 0.40171, 0.41121, z1, lc};

Point(117) = {-0.02953, 0.00532, z1, lc};

// --------------------------------------------------
// Front face boundary curves

Line(1)  = {1, 10};
Line(2)  = {10, 2};
Line(3)  = {2, 11};
Line(4)  = {11, 3};
Line(5)  = {3, 12};
Line(6)  = {12, 13};
Line(7)  = {13, 4};
Line(8)  = {4, 14};
Line(9)  = {14, 15};
Line(10) = {15, 5};
Line(11) = {5, 16};
Line(12) = {16, 6};
Spline(13) = {6, 7, 8, 9};
Line(14) = {9, 17};
Line(15) = {17, 1};

Curve Loop(1) = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
Plane Surface(1) = {1};

// Back face boundary curves

Line(101) = {101, 110};
Line(102) = {110, 102};
Line(103) = {102, 111};
Line(104) = {111, 103};
Line(105) = {103, 112};
Line(106) = {112, 113};
Line(107) = {113, 104};
Line(108) = {104, 114};
Line(109) = {114, 115};
Line(110) = {115, 105};
Line(111) = {105, 116};
Line(112) = {116, 106};
Spline(113) = {106, 107, 108, 109};
Line(114) = {109, 117};
Line(115) = {117, 101};

Curve Loop(2) = {-115,-114,-113,-112,-111,-110,-109,-108,-107,-106,-105,-104,-103,-102,-101};
Plane Surface(2) = {2};

// Through-thickness connector curves

Line(201) = {1, 101};
Line(210) = {10, 110};
Line(202) = {2, 102};

Line(211) = {11, 111};
Line(203) = {3, 103};
Line(212) = {12, 112};

Line(213) = {13, 113};
Line(204) = {4, 104};
Line(214) = {14, 114};

Line(215) = {15, 115};
Line(205) = {5, 105};
Line(216) = {16, 116};

Line(206) = {6, 106};
Line(207) = {7, 107};
Line(208) = {8, 108};
Line(209) = {9, 109};
Line(217) = {17, 117};

// --------------------------------------------------
// Lateral surfaces
// One surface per front/back boundary segment.

Curve Loop(11) = {1, 210, -101, -201};
Plane Surface(11) = {11};

Curve Loop(12) = {2, 202, -102, -210};
Plane Surface(12) = {12};

Curve Loop(13) = {3, 211, -103, -202};
Plane Surface(13) = {13};

Curve Loop(14) = {4, 203, -104, -211};
Plane Surface(14) = {14};

Curve Loop(15) = {5, 212, -105, -203};
Plane Surface(15) = {15};

Curve Loop(16) = {6, 213, -106, -212};
Plane Surface(16) = {16};

Curve Loop(17) = {7, 204, -107, -213};
Plane Surface(17) = {17};

Curve Loop(18) = {8, 214, -108, -204};
Plane Surface(18) = {18};

Curve Loop(19) = {9, 215, -109, -214};
Plane Surface(19) = {19};

Curve Loop(20) = {10, 205, -110, -215};
Plane Surface(20) = {20};

Curve Loop(21) = {11, 216, -111, -205};
Plane Surface(21) = {21};

Curve Loop(22) = {12, 206, -112, -216};
Plane Surface(22) = {22};

Curve Loop(23) = {13, 209, -113, -206};
Ruled Surface(23) = {23};

Curve Loop(24) = {14, 217, -114, -209};
Plane Surface(24) = {24};

Curve Loop(25) = {15, 201, -115, -217};
Plane Surface(25) = {25};

// Volume

Surface Loop(1) = {1, 2, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25};
Volume(1) = {1};

// Physical groups

Physical Volume("DESIGN_VOLUME") = {1};

Physical Surface("FRONT_FACE") = {1};
Physical Surface("BACK_FACE") = {2};

Physical Surface("SIDE_BOUNDARY") = {11,12,13,14,15,16,17,18,19,20,21,22,23,24,25};

//
// Local support/load patches for Julia/Gridap
//
// Important - called in Julia

Physical Surface("PIN_LEFT_SURFACE") = {11};
Physical Surface("PIN_UPPER_SURFACE") = {20, 21};

Physical Surface("LOAD_TOP_LEFT_SURFACE") = {14, 15};
Physical Surface("LOAD_TOP_RIGHT_SURFACE") = {17, 18};
Physical Surface("LOAD_BOTTOM_SURFACE") = {24};

// --------------------------------------------------
// debug curve labels

Physical Curve("PIN_LEFT_PATCH_CURVE_FRONT") = {1};
Physical Curve("PIN_UPPER_PATCH_CURVE_FRONT") = {10, 11};

Physical Curve("LOAD_TOP_LEFT_PATCH_CURVE_FRONT") = {4, 5};
Physical Curve("LOAD_TOP_RIGHT_PATCH_CURVE_FRONT") = {7, 8};
Physical Curve("LOAD_BOTTOM_PATCH_CURVE_FRONT") = {14};

Physical Curve("PIN_LEFT_THROUGH_THICKNESS") = {201};
Physical Curve("PIN_UPPER_THROUGH_THICKNESS") = {205};

Physical Curve("LOAD_TOP_LEFT_THROUGH_THICKNESS") = {203};
Physical Curve("LOAD_TOP_RIGHT_THROUGH_THICKNESS") = {204};
Physical Curve("LOAD_BOTTOM_THROUGH_THICKNESS") = {209};

// Optional point labels
Physical Point("NODE_PIN_LEFT_FRONT") = {1};
Physical Point("NODE_PIN_LEFT_BACK") = {101};

Physical Point("NODE_PIN_UPPER_FRONT") = {5};
Physical Point("NODE_PIN_UPPER_BACK") = {105};

Physical Point("NODE_LOAD_TOP_LEFT_FRONT") = {3};
Physical Point("NODE_LOAD_TOP_LEFT_BACK") = {103};

Physical Point("NODE_LOAD_TOP_RIGHT_FRONT") = {4};
Physical Point("NODE_LOAD_TOP_RIGHT_BACK") = {104};

Physical Point("NODE_LOAD_BOTTOM_FRONT") = {9};
Physical Point("NODE_LOAD_BOTTOM_BACK") = {109};

// Mesh options

Mesh.ElementOrder = 1;
Mesh.Algorithm = 6;
Mesh.Algorithm3D = 4;
Mesh.Optimize = 1;

Mesh.CharacteristicLengthMin = lc;
Mesh.CharacteristicLengthMax = lc;