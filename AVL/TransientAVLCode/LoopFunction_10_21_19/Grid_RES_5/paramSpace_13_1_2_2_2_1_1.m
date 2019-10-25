function [aeroForces] = paramSpace_13_1_2_2_2_1_1(sailStates,airStates)

	CL = (4.010576)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.268935)*sailStates.p + (31.703459)*sailStates.q + (0.156111)*sailStates.r + (0.010353)*sailStates.de;
	CD = -0.071540;
	CY = (0.079168)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.146541)*sailStates.p + (0.546500)*sailStates.q + (0.025820)*sailStates.r + (0.000116)*sailStates.de;

	Cl = (1.138254)*sailStates.alpha + (0.051469)*sailStates.beta + (-0.999293)*sailStates.p + (7.789762)*sailStates.q + (-0.057082)*sailStates.r + (0.000086)*sailStates.de;
	Cm = (-14.811491)*sailStates.alpha + (0.000000)*sailStates.beta + (8.083116)*sailStates.p + (-130.238892)*sailStates.q + (-0.560220)*sailStates.r + (-0.067853)*sailStates.de;
	Cn = (-0.322041)*sailStates.alpha + (-0.009075)*sailStates.beta + (0.457317)*sailStates.p + (-2.904533)*sailStates.q + (-0.039516)*sailStates.r + (-0.000188)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end