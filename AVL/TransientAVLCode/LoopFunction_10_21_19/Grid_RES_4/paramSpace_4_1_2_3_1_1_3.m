function [aeroForces] = paramSpace_4_1_2_3_1_1_3(sailStates,airStates)

	CL = (3.867240)*sailStates.alpha + (0.071800)*sailStates.beta + (-2.647972)*sailStates.p + (34.877625)*sailStates.q + (0.539410)*sailStates.r + (0.010180)*sailStates.de;
	CD = -0.038470;
	CY = (-0.081488)*sailStates.alpha + (-0.026893)*sailStates.beta + (0.018495)*sailStates.p + (-0.684401)*sailStates.q + (-0.003654)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.337534)*sailStates.alpha + (0.056988)*sailStates.beta + (-1.382603)*sailStates.p + (11.816490)*sailStates.q + (0.241952)*sailStates.r + (0.000753)*sailStates.de;
	Cm = (-14.237553)*sailStates.alpha + (-0.186444)*sailStates.beta + (9.188660)*sailStates.p + (-140.146637)*sailStates.q + (-1.829670)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (-0.149113)*sailStates.alpha + (-0.008188)*sailStates.beta + (0.215873)*sailStates.p + (-1.374620)*sailStates.q + (-0.036445)*sailStates.r + (0.000182)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end