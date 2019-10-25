function [aeroForces] = paramSpace_4_4_1_3_2_2_1(sailStates,airStates)

	CL = (3.850625)*sailStates.alpha + (-0.159384)*sailStates.beta + (-2.211571)*sailStates.p + (32.804661)*sailStates.q + (0.865846)*sailStates.r + (0.010483)*sailStates.de;
	CD = 0.052010;
	CY = (0.005728)*sailStates.alpha + (-0.025345)*sailStates.beta + (0.167610)*sailStates.p + (0.194782)*sailStates.q + (-0.033361)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (0.978041)*sailStates.alpha + (-0.142309)*sailStates.beta + (-0.901752)*sailStates.p + (7.252447)*sailStates.q + (0.545610)*sailStates.r + (-0.000127)*sailStates.de;
	Cm = (-13.729918)*sailStates.alpha + (0.492202)*sailStates.beta + (7.313507)*sailStates.p + (-126.796555)*sailStates.q + (-2.884483)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (-0.005822)*sailStates.alpha + (0.020364)*sailStates.beta + (-0.259591)*sailStates.p + (0.726060)*sailStates.q + (-0.021471)*sailStates.r + (-0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end