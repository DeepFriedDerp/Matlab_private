function [aeroForces] = paramSpace_4_2_1_3_3_2_2(sailStates,airStates)

	CL = (3.886385)*sailStates.alpha + (0.052452)*sailStates.beta + (-2.495700)*sailStates.p + (35.128498)*sailStates.q + (0.848134)*sailStates.r + (0.010770)*sailStates.de;
	CD = 0.065500;
	CY = (0.061501)*sailStates.alpha + (-0.024506)*sailStates.beta + (0.122163)*sailStates.p + (0.489619)*sailStates.q + (-0.024352)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.195410)*sailStates.alpha + (-0.062032)*sailStates.beta + (-1.188388)*sailStates.p + (10.076451)*sailStates.q + (0.542266)*sailStates.r + (0.000408)*sailStates.de;
	Cm = (-14.018735)*sailStates.alpha + (-0.161859)*sailStates.beta + (8.353829)*sailStates.p + (-135.545776)*sailStates.q + (-2.835598)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (-0.206636)*sailStates.alpha + (0.014298)*sailStates.beta + (-0.108496)*sailStates.p + (-0.489421)*sailStates.q + (-0.039478)*sailStates.r + (-0.000111)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end