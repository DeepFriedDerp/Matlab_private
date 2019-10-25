function [aeroForces] = paramSpace_1_3_3_1_1_3_2(sailStates,airStates)

	CL = (6.814074)*sailStates.alpha + (-0.378894)*sailStates.beta + (-2.378779)*sailStates.p + (27.641056)*sailStates.q + (1.811609)*sailStates.r + (0.009320)*sailStates.de;
	CD = -2.659610;
	CY = (-0.168678)*sailStates.alpha + (-0.028629)*sailStates.beta + (1.125342)*sailStates.p + (-1.671349)*sailStates.q + (0.198269)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (2.392912)*sailStates.alpha + (-0.599443)*sailStates.beta + (-1.104212)*sailStates.p + (7.346585)*sailStates.q + (1.877181)*sailStates.r + (0.000317)*sailStates.de;
	Cm = (-18.320318)*sailStates.alpha + (1.533256)*sailStates.beta + (10.091952)*sailStates.p + (-136.726761)*sailStates.q + (-5.954618)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.906427)*sailStates.alpha + (-0.071914)*sailStates.beta + (-2.659032)*sailStates.p + (13.678924)*sailStates.q + (-0.103612)*sailStates.r + (0.000678)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end