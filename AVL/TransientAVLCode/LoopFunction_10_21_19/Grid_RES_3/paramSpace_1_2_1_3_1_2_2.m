function [aeroForces] = paramSpace_1_2_1_3_1_2_2(sailStates,airStates)

	CL = (3.834594)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.514835)*sailStates.p + (35.228291)*sailStates.q + (-0.765516)*sailStates.r + (0.010647)*sailStates.de;
	CD = 0.086830;
	CY = (-0.061644)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.139351)*sailStates.p + (-0.491627)*sailStates.q + (-0.024525)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.182103)*sailStates.alpha + (0.089282)*sailStates.beta + (-1.182334)*sailStates.p + (9.867941)*sailStates.q + (-0.532287)*sailStates.r + (0.000365)*sailStates.de;
	Cm = (-13.728127)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.454559)*sailStates.p + (-136.151047)*sailStates.q + (2.619116)*sailStates.r + (-0.068436)*sailStates.de;
	Cn = (0.189754)*sailStates.alpha + (0.015743)*sailStates.beta + (0.138617)*sailStates.p + (0.490942)*sailStates.q + (-0.032938)*sailStates.r + (0.000143)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end