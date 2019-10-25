function [aeroForces] = paramSpace_1_2_1_1_1_3_1(sailStates,airStates)

	CL = (6.490848)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.534551)*sailStates.p + (20.752239)*sailStates.q + (2.090864)*sailStates.r + (0.008875)*sailStates.de;
	CD = -2.631960;
	CY = (-0.670767)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.179443)*sailStates.p + (-2.260759)*sailStates.q + (0.208182)*sailStates.r + (-0.000475)*sailStates.de;

	Cl = (1.886338)*sailStates.alpha + (-0.499559)*sailStates.beta + (-0.448782)*sailStates.p + (1.219339)*sailStates.q + (2.054093)*sailStates.r + (-0.000686)*sailStates.de;
	Cm = (-17.978464)*sailStates.alpha + (0.000000)*sailStates.beta + (7.327466)*sailStates.p + (-113.665031)*sailStates.q + (-6.831665)*sailStates.r + (-0.066352)*sailStates.de;
	Cn = (2.584720)*sailStates.alpha + (-0.088086)*sailStates.beta + (-2.677925)*sailStates.p + (13.893141)*sailStates.q + (-0.096483)*sailStates.r + (0.000841)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end