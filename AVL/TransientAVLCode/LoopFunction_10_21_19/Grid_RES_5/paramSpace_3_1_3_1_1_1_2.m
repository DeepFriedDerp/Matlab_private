function [aeroForces] = paramSpace_3_1_3_1_1_1_2(sailStates,airStates)

	CL = (4.372901)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.112097)*sailStates.p + (43.328182)*sailStates.q + (-2.099088)*sailStates.r + (0.011868)*sailStates.de;
	CD = -0.610080;
	CY = (-0.235096)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.688991)*sailStates.p + (-0.624079)*sailStates.q + (-0.121510)*sailStates.r + (-0.000134)*sailStates.de;

	Cl = (1.297286)*sailStates.alpha + (0.369392)*sailStates.beta + (-1.625030)*sailStates.p + (14.799340)*sailStates.q + (-1.736711)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-11.736779)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.473779)*sailStates.p + (-150.579605)*sailStates.q + (7.004718)*sailStates.r + (-0.069965)*sailStates.de;
	Cn = (0.696678)*sailStates.alpha + (0.065134)*sailStates.beta + (1.336823)*sailStates.p + (-4.603163)*sailStates.q + (-0.019970)*sailStates.r + (0.000037)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end