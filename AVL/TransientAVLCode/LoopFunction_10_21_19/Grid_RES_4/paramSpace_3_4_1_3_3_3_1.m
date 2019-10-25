function [aeroForces] = paramSpace_3_4_1_3_3_3_1(sailStates,airStates)

	CL = (4.126806)*sailStates.alpha + (-0.166301)*sailStates.beta + (-2.309266)*sailStates.p + (33.323269)*sailStates.q + (0.806724)*sailStates.r + (0.010953)*sailStates.de;
	CD = -0.125570;
	CY = (0.041650)*sailStates.alpha + (-0.025209)*sailStates.beta + (0.270083)*sailStates.p + (0.563444)*sailStates.q + (-0.017762)*sailStates.r + (0.000120)*sailStates.de;

	Cl = (1.019465)*sailStates.alpha + (-0.207767)*sailStates.beta + (-0.946084)*sailStates.p + (7.331479)*sailStates.q + (0.664789)*sailStates.r + (-0.000118)*sailStates.de;
	Cm = (-14.120801)*sailStates.alpha + (0.566854)*sailStates.beta + (7.738152)*sailStates.p + (-129.238022)*sailStates.q + (-2.713167)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (0.150633)*sailStates.alpha + (0.010092)*sailStates.beta + (-0.590677)*sailStates.p + (2.262313)*sailStates.q + (-0.000953)*sailStates.r + (-0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end