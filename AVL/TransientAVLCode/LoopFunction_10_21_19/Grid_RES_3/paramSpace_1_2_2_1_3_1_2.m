function [aeroForces] = paramSpace_1_2_2_1_3_1_2(sailStates,airStates)

	CL = (7.826679)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.610559)*sailStates.p + (42.547695)*sailStates.q + (-3.555538)*sailStates.r + (0.012146)*sailStates.de;
	CD = -3.052320;
	CY = (0.254124)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.501248)*sailStates.p + (1.671350)*sailStates.q + (-0.264710)*sailStates.r + (0.000355)*sailStates.de;

	Cl = (3.019922)*sailStates.alpha + (0.683955)*sailStates.beta + (-1.195304)*sailStates.p + (11.829665)*sailStates.q + (-3.043257)*sailStates.r + (0.000236)*sailStates.de;
	Cm = (-12.856341)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.496243)*sailStates.p + (-133.415192)*sailStates.q + (11.797720)*sailStates.r + (-0.068163)*sailStates.de;
	Cn = (-0.461062)*sailStates.alpha + (0.120600)*sailStates.beta + (3.183226)*sailStates.p + (-14.971602)*sailStates.q + (0.061844)*sailStates.r + (-0.000733)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end