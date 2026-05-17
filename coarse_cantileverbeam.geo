// CoarseCantileverBeam.geo

SetFactory("OpenCASCADE");

// Geometry parameters (meters)
L = 3;
H = 1;
lc = 0.04;

// Load patch parameters
a = 0.25;      // half-height of load patch
yc = H/2.0;

// Points
Point(1) = {0, 0, 0, lc};
Point(2) = {L, 0, 0, lc};
Point(3) = {L, yc-a, 0, lc};
Point(4) = {L, yc+a, 0, lc};
Point(5) = {L, H, 0, lc};
Point(6) = {0, H, 0, lc};

// Boundary lines
Line(1) = {1, 2}; // bottom
Line(2) = {2, 3}; // lower right free
Line(3) = {3, 4}; // load patch
Line(4) = {4, 5}; // upper right free
Line(5) = {5, 6}; // top
Line(6) = {6, 1}; // clamp

// Surface
Curve Loop(1) = {1, 2, 3, 4, 5, 6};
Plane Surface(1) = {1};

// Physical labels used by Gridap
Physical Curve("Bottom") = {1};
Physical Curve("RightFree") = {2, 4};
Physical Curve("Load") = {3};
Physical Curve("Top") = {5};
Physical Curve("Clamp") = {6};

// Add endpoint nodes for Dirichlet condition
Physical Point("ClampNodes") = {1, 6};

Physical Surface("Design") = {1};