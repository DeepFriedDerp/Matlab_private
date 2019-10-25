function [aeroForces] = paramSpace_3_4_3_3_1_1_1(sailStates,airStates)

	CL = (4.064104)*sailStates.alpha + (0.059035)*sailStates.beta + (-2.264743)*sailStates.p + (31.849277)*sailStates.q + (-0.221445)*sailStates.r + (0.010581)*sailStates.de;
	CD = -0.103940;
	CY = (-0.036169)*sailStates.alpha + (-0.024279)*sailStates.beta + (-0.155922)*sailStates.p + (-0.432842)*sailStates.q + (0.010204)*sailStates.r + (-0.000092)*sailStates.de;

	Cl = (1.009808)*sailStates.alpha + (0.111097)*sailStates.beta + (-0.928851)*sailStates.p + (6.938062)*sailStates.q + (-0.296601)*sailStates.r + (-0.000140)*sailStates.de;
	Cm = (-14.583486)*sailStates.alpha + (-0.232693)*sailStates.beta + (7.907459)*sailStates.p + (-128.769608)*sailStates.q + (0.746194)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (-0.164329)*sailStates.alpha + (-0.005684)*sailStates.beta + (0.419527)*sailStates.p + (-1.768532)*sailStates.q + (-0.004064)*sailStates.r + (0.000083)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end