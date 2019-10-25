function [aeroForces] = paramSpace_2_4_2_3_1_1_3(sailStates,airStates)

	CL = (4.104311)*sailStates.alpha + (0.218734)*sailStates.beta + (-2.829264)*sailStates.p + (37.572914)*sailStates.q + (-0.892098)*sailStates.r + (0.011144)*sailStates.de;
	CD = -0.142090;
	CY = (-0.089150)*sailStates.alpha + (-0.025294)*sailStates.beta + (-0.320853)*sailStates.p + (-0.432842)*sailStates.q + (-0.021015)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.249110)*sailStates.alpha + (0.234886)*sailStates.beta + (-1.371024)*sailStates.p + (11.278369)*sailStates.q + (-0.767850)*sailStates.r + (0.000562)*sailStates.de;
	Cm = (-13.913564)*sailStates.alpha + (-0.870497)*sailStates.beta + (9.469220)*sailStates.p + (-143.531296)*sailStates.q + (3.039939)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (0.130719)*sailStates.alpha + (0.011686)*sailStates.beta + (0.649909)*sailStates.p + (-2.320161)*sailStates.q + (-0.001902)*sailStates.r + (0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end