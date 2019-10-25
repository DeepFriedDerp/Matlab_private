function [aeroForces] = paramSpace_1_1_3_3_3_2_2(sailStates,airStates)

	CL = (3.971326)*sailStates.alpha + (-0.153105)*sailStates.beta + (-2.473680)*sailStates.p + (35.018559)*sailStates.q + (-0.989703)*sailStates.r + (0.010707)*sailStates.de;
	CD = 0.033900;
	CY = (0.062710)*sailStates.alpha + (-0.025948)*sailStates.beta + (-0.256104)*sailStates.p + (0.491627)*sailStates.q + (-0.045111)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.312203)*sailStates.alpha + (0.049669)*sailStates.beta + (-1.201416)*sailStates.p + (10.371823)*sailStates.q + (-0.680177)*sailStates.r + (0.000416)*sailStates.de;
	Cm = (-14.019153)*sailStates.alpha + (0.479832)*sailStates.beta + (8.121752)*sailStates.p + (-133.990967)*sailStates.q + (3.291357)*sailStates.r + (-0.067390)*sailStates.de;
	Cn = (0.042920)*sailStates.alpha + (0.018158)*sailStates.beta + (0.399997)*sailStates.p + (-1.611572)*sailStates.q + (-0.012350)*sailStates.r + (-0.000186)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end