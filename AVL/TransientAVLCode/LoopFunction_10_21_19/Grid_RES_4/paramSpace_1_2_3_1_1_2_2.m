function [aeroForces] = paramSpace_1_2_3_1_1_2_2(sailStates,airStates)

	CL = (3.847619)*sailStates.alpha + (-0.045504)*sailStates.beta + (-2.529636)*sailStates.p + (34.983582)*sailStates.q + (-0.555973)*sailStates.r + (0.010689)*sailStates.de;
	CD = 0.051100;
	CY = (-0.202290)*sailStates.alpha + (-0.023264)*sailStates.beta + (0.050076)*sailStates.p + (-1.664521)*sailStates.q + (0.009901)*sailStates.r + (-0.000353)*sailStates.de;

	Cl = (1.190474)*sailStates.alpha + (0.028948)*sailStates.beta + (-1.209603)*sailStates.p + (10.017457)*sailStates.q + (-0.318932)*sailStates.r + (0.000488)*sailStates.de;
	Cm = (-14.047293)*sailStates.alpha + (0.160124)*sailStates.beta + (8.746442)*sailStates.p + (-137.222183)*sailStates.q + (1.913133)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (0.397012)*sailStates.alpha + (0.004720)*sailStates.beta + (-0.263633)*sailStates.p + (3.151489)*sailStates.q + (-0.067966)*sailStates.r + (0.000483)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end