function [aeroForces] = paramSpace_3_4_3_1_1_2_3(sailStates,airStates)

	CL = (3.876102)*sailStates.alpha + (-0.157328)*sailStates.beta + (-3.414618)*sailStates.p + (41.972553)*sailStates.q + (0.894469)*sailStates.r + (0.011311)*sailStates.de;
	CD = -0.041800;
	CY = (-0.097964)*sailStates.alpha + (-0.022540)*sailStates.beta + (0.392260)*sailStates.p + (-1.915493)*sailStates.q + (-0.025777)*sailStates.r + (-0.000416)*sailStates.de;

	Cl = (1.501649)*sailStates.alpha + (-0.179078)*sailStates.beta + (-1.862023)*sailStates.p + (15.844205)*sailStates.q + (0.692193)*sailStates.r + (0.001345)*sailStates.de;
	Cm = (-13.647951)*sailStates.alpha + (0.583342)*sailStates.beta + (11.447063)*sailStates.p + (-159.650192)*sailStates.q + (-3.016636)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-0.219019)*sailStates.alpha + (0.005493)*sailStates.beta + (-0.703840)*sailStates.p + (4.137481)*sailStates.q + (0.008831)*sailStates.r + (0.000607)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end