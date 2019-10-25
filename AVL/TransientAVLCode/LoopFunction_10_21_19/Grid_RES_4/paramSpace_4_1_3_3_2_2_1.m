function [aeroForces] = paramSpace_4_1_3_3_2_2_1(sailStates,airStates)

	CL = (3.778678)*sailStates.alpha + (0.200567)*sailStates.beta + (-2.210278)*sailStates.p + (32.900700)*sailStates.q + (0.882040)*sailStates.r + (0.010312)*sailStates.de;
	CD = 0.069010;
	CY = (0.002531)*sailStates.alpha + (-0.024146)*sailStates.beta + (0.196188)*sailStates.p + (0.194783)*sailStates.q + (-0.039017)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.126798)*sailStates.alpha + (-0.049083)*sailStates.beta + (-0.995486)*sailStates.p + (8.444766)*sailStates.q + (0.610570)*sailStates.r + (0.000127)*sailStates.de;
	Cm = (-13.332236)*sailStates.alpha + (-0.754109)*sailStates.beta + (7.295197)*sailStates.p + (-126.796555)*sailStates.q + (-2.976536)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (-0.055028)*sailStates.alpha + (0.017751)*sailStates.beta + (-0.283832)*sailStates.p + (0.512097)*sailStates.q + (-0.025642)*sailStates.r + (-0.000039)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end