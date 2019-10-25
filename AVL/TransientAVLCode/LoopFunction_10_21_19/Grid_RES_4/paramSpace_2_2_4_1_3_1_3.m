function [aeroForces] = paramSpace_2_2_4_1_3_1_3(sailStates,airStates)

	CL = (7.320871)*sailStates.alpha + (-0.211028)*sailStates.beta + (-3.492796)*sailStates.p + (44.864296)*sailStates.q + (-3.098736)*sailStates.r + (0.012087)*sailStates.de;
	CD = -2.955220;
	CY = (-0.260835)*sailStates.alpha + (-0.025456)*sailStates.beta + (-1.412493)*sailStates.p + (1.915495)*sailStates.q + (-0.092377)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (3.051945)*sailStates.alpha + (0.560131)*sailStates.beta + (-1.955031)*sailStates.p + (17.425493)*sailStates.q + (-2.727832)*sailStates.r + (0.001535)*sailStates.de;
	Cm = (-14.523400)*sailStates.alpha + (0.781695)*sailStates.beta + (11.027770)*sailStates.p + (-160.694275)*sailStates.q + (10.439164)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (1.491569)*sailStates.alpha + (0.042610)*sailStates.beta + (3.013204)*sailStates.p + (-14.775422)*sailStates.q + (0.026608)*sailStates.r + (-0.000878)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end