function [aeroForces] = paramSpace_3_1_3_3_1_1_1(sailStates,airStates)

	CL = (4.064104)*sailStates.alpha + (-0.059035)*sailStates.beta + (-2.264743)*sailStates.p + (31.849277)*sailStates.q + (-0.221444)*sailStates.r + (0.010581)*sailStates.de;
	CD = -0.103940;
	CY = (-0.036169)*sailStates.alpha + (-0.025294)*sailStates.beta + (-0.155922)*sailStates.p + (-0.432842)*sailStates.q + (0.010204)*sailStates.r + (-0.000092)*sailStates.de;

	Cl = (1.171667)*sailStates.alpha + (0.079598)*sailStates.beta + (-1.026544)*sailStates.p + (8.146620)*sailStates.q + (-0.290155)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-14.583486)*sailStates.alpha + (0.232693)*sailStates.beta + (7.907459)*sailStates.p + (-128.769608)*sailStates.q + (0.746194)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (-0.149912)*sailStates.alpha + (-0.006815)*sailStates.beta + (0.425930)*sailStates.p + (-1.847744)*sailStates.q + (-0.004486)*sailStates.r + (0.000083)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end