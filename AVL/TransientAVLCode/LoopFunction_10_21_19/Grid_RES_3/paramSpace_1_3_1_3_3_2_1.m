function [aeroForces] = paramSpace_1_3_1_3_3_2_1(sailStates,airStates)

	CL = (3.854272)*sailStates.alpha + (0.191266)*sailStates.beta + (-2.219178)*sailStates.p + (33.003220)*sailStates.q + (-0.921793)*sailStates.r + (0.010380)*sailStates.de;
	CD = 0.058590;
	CY = (0.070048)*sailStates.alpha + (-0.023950)*sailStates.beta + (-0.266982)*sailStates.p + (0.318252)*sailStates.q + (-0.047106)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.047567)*sailStates.alpha + (0.168943)*sailStates.beta + (-0.908614)*sailStates.p + (7.336658)*sailStates.q + (-0.653877)*sailStates.r + (-0.000142)*sailStates.de;
	Cm = (-13.466179)*sailStates.alpha + (-0.757192)*sailStates.beta + (7.276007)*sailStates.p + (-126.937798)*sailStates.q + (3.118397)*sailStates.r + (-0.066708)*sailStates.de;
	Cn = (-0.117680)*sailStates.alpha + (0.021006)*sailStates.beta + (0.451801)*sailStates.p + (-1.783027)*sailStates.q + (-0.007545)*sailStates.r + (-0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end