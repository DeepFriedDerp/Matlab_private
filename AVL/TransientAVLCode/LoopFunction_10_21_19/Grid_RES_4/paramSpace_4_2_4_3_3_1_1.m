function [aeroForces] = paramSpace_4_2_4_3_3_1_1(sailStates,airStates)

	CL = (3.906081)*sailStates.alpha + (0.017112)*sailStates.beta + (-2.193072)*sailStates.p + (30.807913)*sailStates.q + (0.110873)*sailStates.r + (0.009927)*sailStates.de;
	CD = -0.081650;
	CY = (0.099812)*sailStates.alpha + (-0.024177)*sailStates.beta + (-0.168508)*sailStates.p + (0.684401)*sailStates.q + (0.033592)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.138470)*sailStates.alpha + (0.058388)*sailStates.beta + (-0.965798)*sailStates.p + (7.486464)*sailStates.q + (-0.083369)*sailStates.r + (0.000078)*sailStates.de;
	Cm = (-14.447276)*sailStates.alpha + (-0.082945)*sailStates.beta + (7.948122)*sailStates.p + (-128.521423)*sailStates.q + (-0.470046)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (-0.396509)*sailStates.alpha + (-0.014155)*sailStates.beta + (0.539400)*sailStates.p + (-3.598499)*sailStates.q + (-0.052846)*sailStates.r + (-0.000253)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end