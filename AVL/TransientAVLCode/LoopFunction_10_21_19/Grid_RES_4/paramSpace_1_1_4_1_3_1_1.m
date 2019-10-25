function [aeroForces] = paramSpace_1_1_4_1_3_1_1(sailStates,airStates)

	CL = (7.400507)*sailStates.alpha + (-0.707486)*sailStates.beta + (-1.730677)*sailStates.p + (35.884094)*sailStates.q + (-3.303247)*sailStates.r + (0.011749)*sailStates.de;
	CD = -2.964690;
	CY = (0.681361)*sailStates.alpha + (-0.027664)*sailStates.beta + (-1.390163)*sailStates.p + (1.002331)*sailStates.q + (-0.276413)*sailStates.r + (0.000207)*sailStates.de;

	Cl = (2.367128)*sailStates.alpha + (0.441814)*sailStates.beta + (-0.525490)*sailStates.p + (5.865913)*sailStates.q + (-2.805307)*sailStates.r + (-0.000755)*sailStates.de;
	Cm = (-10.516993)*sailStates.alpha + (2.576358)*sailStates.beta + (3.326339)*sailStates.p + (-107.565659)*sailStates.q + (10.869104)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (-2.501444)*sailStates.alpha + (0.143578)*sailStates.beta + (3.090675)*sailStates.p + (-14.682835)*sailStates.q + (0.077214)*sailStates.r + (-0.000482)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end