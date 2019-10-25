function [aeroForces] = paramSpace_1_1_1_3_2_2_3(sailStates,airStates)

	CL = (3.712426)*sailStates.alpha + (-0.248737)*sailStates.beta + (-2.710813)*sailStates.p + (37.223156)*sailStates.q + (-1.092875)*sailStates.r + (0.010468)*sailStates.de;
	CD = 0.097780;
	CY = (-0.005749)*sailStates.alpha + (-0.025467)*sailStates.beta + (-0.272576)*sailStates.p + (0.194782)*sailStates.q + (-0.054240)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.332522)*sailStates.alpha + (0.051142)*sailStates.beta + (-1.406632)*sailStates.p + (12.410348)*sailStates.q + (-0.799479)*sailStates.r + (0.000786)*sailStates.de;
	Cm = (-13.060506)*sailStates.alpha + (0.980302)*sailStates.beta + (8.903646)*sailStates.p + (-140.845245)*sailStates.q + (3.700670)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.255954)*sailStates.alpha + (0.021325)*sailStates.beta + (0.353033)*sailStates.p + (-0.625128)*sailStates.q + (-0.033390)*sailStates.r + (-0.000069)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end