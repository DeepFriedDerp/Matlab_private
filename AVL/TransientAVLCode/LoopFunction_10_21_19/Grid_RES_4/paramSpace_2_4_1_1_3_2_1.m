function [aeroForces] = paramSpace_2_4_1_1_3_2_1(sailStates,airStates)

	CL = (3.834949)*sailStates.alpha + (0.145946)*sailStates.beta + (-1.645148)*sailStates.p + (27.652861)*sailStates.q + (-0.668062)*sailStates.r + (0.010438)*sailStates.de;
	CD = -0.027270;
	CY = (0.308240)*sailStates.alpha + (-0.022750)*sailStates.beta + (-0.334848)*sailStates.p + (1.471502)*sailStates.q + (-0.022102)*sailStates.r + (0.000310)*sailStates.de;

	Cl = (0.647932)*sailStates.alpha + (0.144799)*sailStates.beta + (-0.416547)*sailStates.p + (2.432164)*sailStates.q + (-0.524676)*sailStates.r + (-0.000964)*sailStates.de;
	Cm = (-13.549623)*sailStates.alpha + (-0.606645)*sailStates.beta + (5.538109)*sailStates.p + (-111.058342)*sailStates.q + (2.271414)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-0.706721)*sailStates.alpha + (0.003992)*sailStates.beta + (0.672594)*sailStates.p + (-4.031063)*sailStates.q + (0.011454)*sailStates.r + (-0.000451)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end