function [aeroForces] = paramSpace_4_3_3_2_1_1_1(sailStates,airStates)

	CL = (3.973558)*sailStates.alpha + (0.005354)*sailStates.beta + (-1.992916)*sailStates.p + (28.525816)*sailStates.q + (0.005200)*sailStates.r + (0.009697)*sailStates.de;
	CD = -0.228410;
	CY = (-0.025054)*sailStates.alpha + (-0.024476)*sailStates.beta + (-0.167494)*sailStates.p + (-0.455226)*sailStates.q + (0.033300)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (0.916139)*sailStates.alpha + (0.103604)*sailStates.beta + (-0.790821)*sailStates.p + (5.734978)*sailStates.q + (-0.231423)*sailStates.r + (-0.000269)*sailStates.de;
	Cm = (-14.618638)*sailStates.alpha + (-0.028073)*sailStates.beta + (7.325664)*sailStates.p + (-122.911674)*sailStates.q + (-0.081327)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (-0.311231)*sailStates.alpha + (-0.019044)*sailStates.beta + (0.527036)*sailStates.p + (-2.413568)*sailStates.q + (-0.027499)*sailStates.r + (0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end