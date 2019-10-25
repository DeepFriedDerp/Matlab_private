function [aeroForces] = paramSpace_1_1_4_1_1_3_2(sailStates,airStates)

	CL = (6.701023)*sailStates.alpha + (0.407873)*sailStates.beta + (-2.341453)*sailStates.p + (26.734827)*sailStates.q + (1.711902)*sailStates.r + (0.009052)*sailStates.de;
	CD = -2.620800;
	CY = (-0.163151)*sailStates.alpha + (-0.020007)*sailStates.beta + (1.098129)*sailStates.p + (-1.664520)*sailStates.q + (0.218253)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (2.499348)*sailStates.alpha + (-0.368240)*sailStates.beta + (-1.178770)*sailStates.p + (8.241081)*sailStates.q + (1.791880)*sailStates.r + (0.000566)*sailStates.de;
	Cm = (-18.418970)*sailStates.alpha + (-1.655718)*sailStates.beta + (10.166576)*sailStates.p + (-136.195908)*sailStates.q + (-5.564249)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (0.826637)*sailStates.alpha + (-0.115037)*sailStates.beta + (-2.641947)*sailStates.p + (13.774822)*sailStates.q + (-0.122574)*sailStates.r + (0.000668)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end