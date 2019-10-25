function [aeroForces] = paramSpace_10_1_2_2_1_1_1(sailStates,airStates)

	CL = (4.121820)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.334480)*sailStates.p + (32.603207)*sailStates.q + (-0.108336)*sailStates.r + (0.010831)*sailStates.de;
	CD = -0.066330;
	CY = (-0.032573)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.123518)*sailStates.p + (-0.351850)*sailStates.q + (0.008650)*sailStates.r + (-0.000076)*sailStates.de;

	Cl = (1.139555)*sailStates.alpha + (0.075976)*sailStates.beta + (-1.026254)*sailStates.p + (8.001657)*sailStates.q + (-0.207342)*sailStates.r + (0.000053)*sailStates.de;
	Cm = (-14.905164)*sailStates.alpha + (0.000000)*sailStates.beta + (8.119901)*sailStates.p + (-131.203201)*sailStates.q + (0.381009)*sailStates.r + (-0.069551)*sailStates.de;
	Cn = (-0.124346)*sailStates.alpha + (-0.005313)*sailStates.beta + (0.342863)*sailStates.p + (-1.441782)*sailStates.q + (-0.004516)*sailStates.r + (0.000077)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end