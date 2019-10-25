function [aeroForces] = paramSpace_2_1_1_2_1_1_1(sailStates,airStates)

	CL = (3.928557)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.319538)*sailStates.p + (35.651920)*sailStates.q + (-1.417691)*sailStates.r + (0.010760)*sailStates.de;
	CD = -0.053260;
	CY = (-0.036759)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.415433)*sailStates.p + (-0.571906)*sailStates.q + (-0.088242)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.086546)*sailStates.alpha + (0.230369)*sailStates.beta + (-1.010087)*sailStates.p + (8.824153)*sailStates.q + (-1.105202)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-12.352807)*sailStates.alpha + (0.000000)*sailStates.beta + (7.183600)*sailStates.p + (-129.462372)*sailStates.q + (4.757960)*sailStates.r + (-0.066948)*sailStates.de;
	Cn = (-0.048217)*sailStates.alpha + (0.048966)*sailStates.beta + (0.773948)*sailStates.p + (-2.318908)*sailStates.q + (-0.025160)*sailStates.r + (0.000116)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end