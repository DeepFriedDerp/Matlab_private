function [aeroForces] = paramSpace_3_4_3_3_3_2_3(sailStates,airStates)

	CL = (3.945915)*sailStates.alpha + (-0.066559)*sailStates.beta + (-2.812239)*sailStates.p + (36.792046)*sailStates.q + (0.239577)*sailStates.r + (0.010987)*sailStates.de;
	CD = 0.033280;
	CY = (0.054886)*sailStates.alpha + (-0.025294)*sailStates.beta + (0.012524)*sailStates.p + (0.432842)*sailStates.q + (-0.000806)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.249973)*sailStates.alpha + (-0.039460)*sailStates.beta + (-1.365638)*sailStates.p + (11.072202)*sailStates.q + (0.157344)*sailStates.r + (0.000562)*sailStates.de;
	Cm = (-14.314118)*sailStates.alpha + (0.273610)*sailStates.beta + (9.614185)*sailStates.p + (-143.531296)*sailStates.q + (-0.828201)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (-0.123786)*sailStates.alpha + (0.002704)*sailStates.beta + (0.042419)*sailStates.p + (-0.825347)*sailStates.q + (-0.007279)*sailStates.r + (-0.000132)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end