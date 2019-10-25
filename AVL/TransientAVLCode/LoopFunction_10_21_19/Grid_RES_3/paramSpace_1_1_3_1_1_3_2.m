function [aeroForces] = paramSpace_1_1_3_1_1_3_2(sailStates,airStates)

	CL = (6.814074)*sailStates.alpha + (0.378894)*sailStates.beta + (-2.378779)*sailStates.p + (27.641054)*sailStates.q + (1.811609)*sailStates.r + (0.009320)*sailStates.de;
	CD = -2.659610;
	CY = (-0.168678)*sailStates.alpha + (-0.021033)*sailStates.beta + (1.125342)*sailStates.p + (-1.671349)*sailStates.q + (0.198269)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (2.540590)*sailStates.alpha + (-0.388236)*sailStates.beta + (-1.188865)*sailStates.p + (8.407450)*sailStates.q + (1.862355)*sailStates.r + (0.000545)*sailStates.de;
	Cm = (-18.320318)*sailStates.alpha + (-1.533256)*sailStates.beta + (10.091951)*sailStates.p + (-136.726761)*sailStates.q + (-5.954617)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.813724)*sailStates.alpha + (-0.102241)*sailStates.beta + (-2.673958)*sailStates.p + (13.865982)*sailStates.q + (-0.106226)*sailStates.r + (0.000678)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end