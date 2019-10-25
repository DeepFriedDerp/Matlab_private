function [aeroForces] = paramSpace_3_3_2_2_1_3_1(sailStates,airStates)

	CL = (4.786411)*sailStates.alpha + (-0.105197)*sailStates.beta + (-2.183149)*sailStates.p + (32.952293)*sailStates.q + (1.486785)*sailStates.r + (0.011109)*sailStates.de;
	CD = -0.601490;
	CY = (-0.195494)*sailStates.alpha + (-0.024761)*sailStates.beta + (0.653109)*sailStates.p + (-0.668511)*sailStates.q + (-0.042784)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.353319)*sailStates.alpha + (-0.331088)*sailStates.beta + (-0.866720)*sailStates.p + (6.867702)*sailStates.q + (1.281079)*sailStates.r + (-0.000243)*sailStates.de;
	Cm = (-14.367267)*sailStates.alpha + (0.393743)*sailStates.beta + (7.102945)*sailStates.p + (-125.787453)*sailStates.q + (-5.021846)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (0.722702)*sailStates.alpha + (0.018865)*sailStates.beta + (-1.406124)*sailStates.p + (6.805105)*sailStates.q + (0.011868)*sailStates.r + (0.000303)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end