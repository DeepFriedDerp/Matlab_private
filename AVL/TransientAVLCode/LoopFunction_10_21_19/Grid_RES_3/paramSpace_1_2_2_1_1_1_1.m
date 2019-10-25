function [aeroForces] = paramSpace_1_2_2_1_1_1_1(sailStates,airStates)

	CL = (5.353478)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.838925)*sailStates.p + (34.815659)*sailStates.q + (-2.389801)*sailStates.r + (0.011754)*sailStates.de;
	CD = -1.811940;
	CY = (0.013219)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.873847)*sailStates.p + (-2.260756)*sailStates.q + (-0.154083)*sailStates.r + (-0.000475)*sailStates.de;

	Cl = (0.551386)*sailStates.alpha + (0.527104)*sailStates.beta + (-0.545219)*sailStates.p + (4.944770)*sailStates.q + (-2.087994)*sailStates.r + (-0.000686)*sailStates.de;
	Cm = (-9.131455)*sailStates.alpha + (0.000001)*sailStates.beta + (4.715835)*sailStates.p + (-113.665031)*sailStates.q + (7.979628)*sailStates.r + (-0.066352)*sailStates.de;
	Cn = (-1.398269)*sailStates.alpha + (0.092943)*sailStates.beta + (1.994007)*sailStates.p + (-7.234830)*sailStates.q + (0.000379)*sailStates.r + (0.000504)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end