function [aeroForces] = paramSpace_3_3_4_3_3_3_2(sailStates,airStates)

	CL = (4.189680)*sailStates.alpha + (-0.078924)*sailStates.beta + (-2.588331)*sailStates.p + (35.747250)*sailStates.q + (0.869054)*sailStates.r + (0.011153)*sailStates.de;
	CD = -0.138310;
	CY = (0.063132)*sailStates.alpha + (-0.025207)*sailStates.beta + (0.325870)*sailStates.p + (0.498142)*sailStates.q + (-0.021306)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.220066)*sailStates.alpha + (-0.201733)*sailStates.beta + (-1.200041)*sailStates.p + (9.783268)*sailStates.q + (0.767758)*sailStates.r + (0.000312)*sailStates.de;
	Cm = (-14.188578)*sailStates.alpha + (0.332185)*sailStates.beta + (8.663868)*sailStates.p + (-137.428818)*sailStates.q + (-2.983761)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (-0.002781)*sailStates.alpha + (0.012080)*sailStates.beta + (-0.663006)*sailStates.p + (2.289809)*sailStates.q + (-0.002091)*sailStates.r + (-0.000104)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end