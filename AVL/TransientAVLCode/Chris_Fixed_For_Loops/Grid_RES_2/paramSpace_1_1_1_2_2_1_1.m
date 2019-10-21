function [aeroForces] = paramSpace_1_1_1_2_2_1_1(sailStates,airStates)

	CL = (4.131136)*sailStates.alpha + (0.430866)*sailStates.beta + (-5.006991)*sailStates.p + (49.636616)*sailStates.q + (1.401212)*sailStates.r + (0.010678)*sailStates.de;
	CD = -3.516820;
	CY = (1.309318)*sailStates.alpha + (-0.031792)*sailStates.beta + (0.852483)*sailStates.p + (2.994877)*sailStates.q + (0.112019)*sailStates.r + (0.000667)*sailStates.de;

	Cl = (0.262474)*sailStates.alpha + (-0.475418)*sailStates.beta + (-3.359433)*sailStates.p + (29.125620)*sailStates.q + (1.578224)*sailStates.r + (0.004095)*sailStates.de;
	Cm = (-4.072935)*sailStates.alpha + (-1.732582)*sailStates.beta + (18.377289)*sailStates.p + (-208.195923)*sailStates.q + (-4.673030)*sailStates.r + (-0.077344)*sailStates.de;
	Cn = (-4.496618)*sailStates.alpha + (-0.079654)*sailStates.beta + (-2.454414)*sailStates.p + (10.854331)*sailStates.q + (-0.056852)*sailStates.r + (-0.000533)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end