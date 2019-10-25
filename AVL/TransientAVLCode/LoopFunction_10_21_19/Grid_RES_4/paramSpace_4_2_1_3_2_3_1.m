function [aeroForces] = paramSpace_4_2_1_3_2_3_1(sailStates,airStates)

	CL = (4.211658)*sailStates.alpha + (0.104898)*sailStates.beta + (-2.280391)*sailStates.p + (35.401886)*sailStates.q + (1.534477)*sailStates.r + (0.011105)*sailStates.de;
	CD = -0.184040;
	CY = (-0.026862)*sailStates.alpha + (-0.024789)*sailStates.beta + (0.472186)*sailStates.p + (0.194783)*sailStates.q + (-0.093944)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.190878)*sailStates.alpha + (-0.211056)*sailStates.beta + (-0.989376)*sailStates.p + (8.735214)*sailStates.q + (1.176239)*sailStates.r + (0.000045)*sailStates.de;
	Cm = (-13.002649)*sailStates.alpha + (-0.361918)*sailStates.beta + (6.943394)*sailStates.p + (-127.822792)*sailStates.q + (-5.083041)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (0.189540)*sailStates.alpha + (0.048490)*sailStates.beta + (-0.938697)*sailStates.p + (3.665179)*sailStates.q + (-0.008334)*sailStates.r + (0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end