function [aeroForces] = paramSpace_1_3_3_1_3_1_2(sailStates,airStates)

	CL = (7.833673)*sailStates.alpha + (0.259687)*sailStates.beta + (-2.601390)*sailStates.p + (43.464104)*sailStates.q + (-3.660270)*sailStates.r + (0.012239)*sailStates.de;
	CD = -3.050430;
	CY = (0.259062)*sailStates.alpha + (-0.023264)*sailStates.beta + (-1.510999)*sailStates.p + (1.664519)*sailStates.q + (-0.300497)*sailStates.r + (0.000352)*sailStates.de;

	Cl = (3.012372)*sailStates.alpha + (0.768033)*sailStates.beta + (-1.170690)*sailStates.p + (11.888182)*sailStates.q + (-3.100785)*sailStates.r + (0.000178)*sailStates.de;
	Cm = (-12.350302)*sailStates.alpha + (-0.958358)*sailStates.beta + (6.133752)*sailStates.p + (-132.472137)*sailStates.q + (12.069108)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.466874)*sailStates.alpha + (0.132262)*sailStates.beta + (3.206904)*sailStates.p + (-15.030483)*sailStates.q + (0.067337)*sailStates.r + (-0.000734)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end