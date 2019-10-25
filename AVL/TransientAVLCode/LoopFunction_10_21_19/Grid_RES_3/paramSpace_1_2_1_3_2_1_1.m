function [aeroForces] = paramSpace_1_2_1_3_2_1_1(sailStates,airStates)

	CL = (4.165721)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.293652)*sailStates.p + (35.243122)*sailStates.q + (-1.460754)*sailStates.r + (0.010936)*sailStates.de;
	CD = -0.179250;
	CY = (0.031916)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.494324)*sailStates.p + (-0.173374)*sailStates.q + (-0.087146)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.175479)*sailStates.alpha + (0.254076)*sailStates.beta + (-0.981046)*sailStates.p + (8.458548)*sailStates.q + (-1.174660)*sailStates.r + (0.000003)*sailStates.de;
	Cm = (-12.820665)*sailStates.alpha + (0.000000)*sailStates.beta + (7.097069)*sailStates.p + (-128.476028)*sailStates.q + (4.910295)*sailStates.r + (-0.067684)*sailStates.de;
	Cn = (-0.220430)*sailStates.alpha + (0.044801)*sailStates.beta + (0.972168)*sailStates.p + (-3.682993)*sailStates.q + (-0.005464)*sailStates.r + (-0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end