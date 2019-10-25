function [aeroForces] = paramSpace_1_3_3_2_1_2_3(sailStates,airStates)

	CL = (3.772328)*sailStates.alpha + (0.130093)*sailStates.beta + (-2.897700)*sailStates.p + (38.127045)*sailStates.q + (-0.806084)*sailStates.r + (0.010913)*sailStates.de;
	CD = 0.065770;
	CY = (-0.078189)*sailStates.alpha + (-0.025948)*sailStates.beta + (-0.099074)*sailStates.p + (-0.491415)*sailStates.q + (-0.017516)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.216564)*sailStates.alpha + (0.116686)*sailStates.beta + (-1.457831)*sailStates.p + (12.312499)*sailStates.q + (-0.514813)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-13.714316)*sailStates.alpha + (-0.403443)*sailStates.beta + (9.776690)*sailStates.p + (-146.474228)*sailStates.q + (2.701012)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.277525)*sailStates.alpha + (0.016822)*sailStates.beta + (0.028554)*sailStates.p + (0.968204)*sailStates.q + (-0.040580)*sailStates.r + (0.000112)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end