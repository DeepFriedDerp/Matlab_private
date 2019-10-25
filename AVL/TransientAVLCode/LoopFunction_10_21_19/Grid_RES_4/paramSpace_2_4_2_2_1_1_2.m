function [aeroForces] = paramSpace_2_4_2_2_1_1_2(sailStates,airStates)

	CL = (4.331187)*sailStates.alpha + (0.287329)*sailStates.beta + (-2.581078)*sailStates.p + (35.876278)*sailStates.q + (-1.143511)*sailStates.r + (0.011101)*sailStates.de;
	CD = -0.366910;
	CY = (-0.097462)*sailStates.alpha + (-0.025688)*sailStates.beta + (-0.434918)*sailStates.p + (-0.769434)*sailStates.q + (-0.028479)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.145109)*sailStates.alpha + (0.320182)*sailStates.beta + (-1.163087)*sailStates.p + (9.413621)*sailStates.q + (-1.015624)*sailStates.r + (0.000226)*sailStates.de;
	Cm = (-13.744224)*sailStates.alpha + (-1.146963)*sailStates.beta + (8.552467)*sailStates.p + (-136.512222)*sailStates.q + (3.896556)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (-0.040682)*sailStates.alpha + (0.016097)*sailStates.beta + (0.930460)*sailStates.p + (-3.412792)*sailStates.q + (-0.000669)*sailStates.r + (0.000145)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end