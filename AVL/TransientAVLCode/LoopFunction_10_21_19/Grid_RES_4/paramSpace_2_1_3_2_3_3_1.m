function [aeroForces] = paramSpace_2_1_3_2_3_3_1(sailStates,airStates)

	CL = (4.211304)*sailStates.alpha + (0.156124)*sailStates.beta + (-2.110950)*sailStates.p + (30.270899)*sailStates.q + (0.533958)*sailStates.r + (0.010462)*sailStates.de;
	CD = -0.326870;
	CY = (0.030977)*sailStates.alpha + (-0.025429)*sailStates.beta + (0.301101)*sailStates.p + (0.668511)*sailStates.q + (0.019759)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.065299)*sailStates.alpha + (-0.140248)*sailStates.beta + (-0.906041)*sailStates.p + (6.961747)*sailStates.q + (0.604684)*sailStates.r + (-0.000072)*sailStates.de;
	Cm = (-14.572308)*sailStates.alpha + (-0.669397)*sailStates.beta + (7.484680)*sailStates.p + (-124.743294)*sailStates.q + (-1.827676)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (0.307409)*sailStates.alpha + (-0.012395)*sailStates.beta + (-0.740268)*sailStates.p + (2.978812)*sailStates.q + (-0.005075)*sailStates.r + (-0.000135)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end