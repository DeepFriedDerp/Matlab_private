function [aeroForces] = paramSpace_1_4_2_3_2_2_1(sailStates,airStates)

	CL = (3.778678)*sailStates.alpha + (0.200567)*sailStates.beta + (-2.210279)*sailStates.p + (32.900700)*sailStates.q + (-0.882040)*sailStates.r + (0.010312)*sailStates.de;
	CD = 0.069010;
	CY = (-0.002531)*sailStates.alpha + (-0.025426)*sailStates.beta + (-0.196188)*sailStates.p + (-0.194783)*sailStates.q + (-0.039017)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (0.977964)*sailStates.alpha + (0.156865)*sailStates.beta + (-0.901112)*sailStates.p + (7.256886)*sailStates.q + (-0.591755)*sailStates.r + (-0.000127)*sailStates.de;
	Cm = (-13.332235)*sailStates.alpha + (-0.754109)*sailStates.beta + (7.295197)*sailStates.p + (-126.796555)*sailStates.q + (2.976535)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (-0.003298)*sailStates.alpha + (0.023214)*sailStates.beta + (0.302604)*sailStates.p + (-0.748381)*sailStates.q + (-0.021900)*sailStates.r + (0.000039)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end