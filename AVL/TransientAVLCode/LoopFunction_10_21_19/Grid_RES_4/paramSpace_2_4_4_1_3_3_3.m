function [aeroForces] = paramSpace_2_4_4_1_3_3_3(sailStates,airStates)

	CL = (5.124391)*sailStates.alpha + (-0.404254)*sailStates.beta + (-3.357284)*sailStates.p + (39.279942)*sailStates.q + (1.347587)*sailStates.r + (0.010834)*sailStates.de;
	CD = -1.728140;
	CY = (0.480486)*sailStates.alpha + (-0.023349)*sailStates.beta + (0.687885)*sailStates.p + (1.915493)*sailStates.q + (0.045289)*sailStates.r + (0.000416)*sailStates.de;

	Cl = (1.226854)*sailStates.alpha + (-0.504732)*sailStates.beta + (-1.843976)*sailStates.p + (15.140639)*sailStates.q + (1.435881)*sailStates.r + (0.001345)*sailStates.de;
	Cm = (-13.215474)*sailStates.alpha + (1.726507)*sailStates.beta + (11.948420)*sailStates.p + (-159.650192)*sailStates.q + (-4.632590)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-0.933210)*sailStates.alpha + (-0.025350)*sailStates.beta + (-1.698342)*sailStates.p + (6.596837)*sailStates.q + (-0.009967)*sailStates.r + (-0.000406)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end