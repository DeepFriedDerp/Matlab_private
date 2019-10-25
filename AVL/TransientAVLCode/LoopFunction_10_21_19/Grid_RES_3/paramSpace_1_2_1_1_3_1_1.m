function [aeroForces] = paramSpace_1_2_1_1_3_1_1(sailStates,airStates)

	CL = (7.443390)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.750195)*sailStates.p + (35.362743)*sailStates.q + (-3.259285)*sailStates.r + (0.011641)*sailStates.de;
	CD = -3.013670;
	CY = (0.700521)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.426312)*sailStates.p + (1.081938)*sailStates.q + (-0.251600)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (2.326104)*sailStates.alpha + (0.670007)*sailStates.beta + (-0.490042)*sailStates.p + (5.102506)*sailStates.q + (-2.823320)*sailStates.r + (-0.000880)*sailStates.de;
	Cm = (-10.875010)*sailStates.alpha + (0.000000)*sailStates.beta + (3.687575)*sailStates.p + (-109.437057)*sailStates.q + (10.832290)*sailStates.r + (-0.066001)*sailStates.de;
	Cn = (-2.655416)*sailStates.alpha + (0.118140)*sailStates.beta + (3.140784)*sailStates.p + (-14.831911)*sailStates.q + (0.071076)*sailStates.r + (-0.000502)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end