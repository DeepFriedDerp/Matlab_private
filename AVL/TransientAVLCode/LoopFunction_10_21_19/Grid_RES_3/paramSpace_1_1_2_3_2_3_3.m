function [aeroForces] = paramSpace_1_1_2_3_2_3_3(sailStates,airStates)

	CL = (3.925783)*sailStates.alpha + (-0.037124)*sailStates.beta + (-2.694083)*sailStates.p + (35.061024)*sailStates.q + (-0.305376)*sailStates.r + (0.010320)*sailStates.de;
	CD = -0.075520;
	CY = (0.029766)*sailStates.alpha + (-0.025268)*sailStates.beta + (0.079658)*sailStates.p + (0.173374)*sailStates.q + (0.014046)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.361682)*sailStates.alpha + (-0.067360)*sailStates.beta + (-1.402302)*sailStates.p + (11.783869)*sailStates.q + (-0.068846)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-14.386622)*sailStates.alpha + (0.098588)*sailStates.beta + (9.468416)*sailStates.p + (-141.665955)*sailStates.q + (1.061578)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.179959)*sailStates.alpha + (-0.013235)*sailStates.beta + (-0.404774)*sailStates.p + (2.547319)*sailStates.q + (-0.039913)*sailStates.r + (-0.000016)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end